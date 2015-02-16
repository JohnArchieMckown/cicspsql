#!/usr/bin/perl
use strict;
use warnings;
my $database=$ENV{"database"};
die "No 'database' environment variable" unless defined($database);
my $file;
{
	local $/;
	$file = <>;
}
$file=~s/^(.{0,72}).*$/$1/gm; #remove data in columns > 72
$file=~s/--.*?$/ /gm; #Remove all DB2 comments
$file=~s/\n/ /g; #change all newlines to spaces
$file=~s/\s+/ /g; #change all multiple spaces to a single space
$file=lc $file; #make everything lower case;
my $stuff;
my @vars;
my $var;
my $line;
my @lines;
my $table;
my $when;
my $value;
my ($rectyp1, $rectyp2);
my %vars_in_table;
my @tables=();
my %defined;
my @nullif;
$rectyp1="";
$rectyp2="";
my ($start, $len, $varname, $position, $end);
my @stuff=split /into/, $file;
my %rectype_table;
print "#!/usr/bin/perl\n";
print "use strict;\n";
print "use warnings;\n";
print "use DBI;\n";
print "use DBD::Pg qw(:pg_types);\n";
print "use bytes;\n";
print "my (\$rv, \$rectype, \$statement);\n";
print "my \%insert;\n";
print "my \%inserts;\n";
print "my \$dbh=DBI->connect(\"dbi:Pg:dbname=$database\",\"\",\"\",{PrintError=>0, RaiseError=>1, AutoCommit=>0});\n";
print "die \"Unable to connect to database.\" unless defined(\$dbh);\n\n";
foreach $stuff (@stuff) {
	next unless $stuff=~s/ table (.*?) when\s*\((.*?)\)\s*=\s*\'(.*?)\'\s*\(//;
	$table=$1;
	$when=$2;
	$value=uc $3;
	$table=~s/.*?\.//;
	unshift @tables, $table;
	$rectype_table{$table}="$when`$value";
	$table=~s/.*?\.//;
	($start, $len) = split /:/, $when;
	$start--;
	$vars_in_table{$table}="";
	@lines=split /,/, $stuff;
	foreach $line (@lines) {
		next unless $line=~m/\s*(.*?)\s+position\s*\((.*?)\)/;
#		print "line:$line\n";
		$varname=$1;
		$position=$2;
		($start, $end) = split /:/, $position;
		$start--;
		$len=$end-$start;
		@nullif = $line=~m/nullif\((.*?)\)/;
#		$vars_in_table{$table}.=" $varname-$start-$len";
#		print "$varname-$start-$len";
		if (@nullif) {
			$value=join ',', @nullif;
		} else {
			$value="\xfe";
		}
		$vars_in_table{$table}.="\xff$varname-$start-$len-$value";
#		print "\n";
	}
}
for $table (sort keys %vars_in_table) {
	@vars=split /\xff/,$vars_in_table{$table};
	$rectyp1 = shift @vars;
	print "#Table:$table\n";
	print "#delete all rows from the $table table\n";
	print "\$dbh->do(\"delete from $table\");\n";
	my $line="\$statement=\"INSERT INTO $table (";
	my @field_names;
	my @values;
	print "#Define the column names for the $table table to Perl\n";
	for $var (@vars) {
		my @field=split /-/, $var;
		push @field_names, $field[0];
		push @values, "?";
		print "my \$$field[0];\n" unless defined $defined{$field[0]};
		$defined{$field[0]}++;
	}
	$line.=join ',', @field_names;
	$line.=") VALUES (";
	$line.=join ",", @values;
	$line.=")\";";
	print "#Create and prepare the INSERT statement for $table\n";
	print "$line\n";
	$line="if (! defined(\$insert{\"$table\"}=\$dbh->prepare(\$statement)) ) {";
	print "$line\n";
	print "\t\$dbh->rollback;\n";
	print "\t\$dbh->disconnect;\n";
	print "\tdie \$dbh->errstr;\n";
	print "}\n\n";
	print "\$inserts{\"$table\"}=0;\n";
}

print "while(<>) {\n";
print "\ts/\\x00/ /g; #change nulls to spaces\n";
print "\tif (0 == \$. % 1000) { print \"Processed \$. lines.\\n\";}\n";
for $table (sort keys %vars_in_table) {
	($when, $value) = split /`/,$rectype_table{$table};
	($start, $end) = split /:/,$when;
	$start--;
	$len=$end-$start;
	$rectyp1="\t\$rectype=substr(\$_,$start,$len);";
	print "$rectyp1\n" unless $rectyp1 eq $rectyp2;
	$rectyp2=$rectyp1;
# Due to the weird way that Perl does string comparisons, it is
# necessary to make sure that the $value is padded with the
# appropraite number of blanks. I did it the easy way.
	$value=$value." " x $len;
	$value="'".substr($value,0,$len)."'";
	print "\tif (\$rectype eq $value) {\n";
	@vars=split /\xff/,$vars_in_table{$table};
	shift @vars;
	my @var_names=();
	for $var (@vars) {
		my @field = split /-/,$var;
		print "\t\t\$$field[0]=substr(\$_,$field[1],$field[2]);\n";
		if ($field[3] ne "\xfe") {
#			print "$field[3]\n";
			my @x=split /=/,$field[3];
			$x[1]=~s/\'//g;
			$x[1].=" " x $field[2];
			$x[1]=substr($x[1],0,$field[2]);
			print "\t\tif (\$$x[0] eq \' \' x length(\$$x[0])) {\n";
			print "\t\t\tundef \$$x[0];\n";
			print "\t\t}\n";
		}
		push @var_names, "\$".$field[0];
	}
	my $var_names= join ",", @var_names;
	print "\t\t\$rv=\$insert{$table}->execute($var_names);\n";
	print "\t\tif (! defined(\$rv)) {\n";
	print "\t\t\t\$dbh->rollback;\n";
	print "\t\t\t\$dbh->disconnect;\n";
	print "\t\t\tdie \$dbh->errstr;\n";
	print "\t\t}\n";
	print "\t\t\$inserts{\"$table\"}++;\n";
	print "\t\tnext;\n";	
	print "\t}\n\n";
}
print "}\n";
print "\$dbh->commit;\n";
print "\$dbh->disconnect;\n";
