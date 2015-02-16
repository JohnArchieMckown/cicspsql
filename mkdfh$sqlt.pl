#!/usr/bin/perl
use strict;
use warnings;
my $table;
my $rectype;
my %vars_in_table;
my %rectype_table;
my $len;
my $start;
my $date;
my $name;
my $blanks;
my @var_array;
print "#!/usr/bin/perl\n";
print "use strict;\n";
print "use warnings;\n";
print "use DBI;\n";
print "use DBD::Pg qw(:pg_types);\n";
print "use bytes; #required due to ebcdic->ascii translation\n";
print "my \$rc;\n";
print "my \$rv;\n";
print "my \%insert;\n";
print "my \$statement;\n";
print "my \$rectype;\n";
print "my \%inserts;\n";
print "my \$dbh=DBI->connect(\"dbi:Pg:dbname=cicsrdo\",\"\",\"\",{PrintError=>0, RaiseError=>1, AutoCommit=>0});\n";
print "die \"Unable to connect to database.\" unless defined(\$dbh);\n\n";
while (<>) {
	$_ = lc $_;
#	print STDERR $_;
	chomp;
#	next if m/^--/;
	s/--.*$//;
	next if m/^\s*$/;
#	s/\/\*.*?\*\///;
	if (m/\W*(\w+)\W+position\s*\(\s*(\d+)\s*:\s*(\d+)\s*\)/o) {
		$len=$3-$2+1;
		$start=$2-1;
		$name=$1;
		$date = "no";
		$date = "yes" if / external/;
		$vars_in_table{$table}.=" $name-$start-$len-$date";
		next;
	}
	if (m/\s*into table\W+(\w+)\W*/o) {
		$table=$1;
		$vars_in_table{$table}="";
		next;
	}
	if (m/\s*when.+?\'(.+?)\'/o) {
		$rectype=$1;
		$rectype_table{$table}= uc $1;
		next;
	}
}

for $table (sort keys %vars_in_table) {
        my @vars=split / /,$vars_in_table{$table};
        shift @vars;
	print "#Table:$table\n";
#	print "#delete all rows from the $table table\n";
#	print "\$dbh->do(\"delete from $table\");\n";
        my $line="\$statement=\"INSERT INTO $table (";
        my @field_names;
        my @values;
	print "#Define the column names for the $table table to Perl\n";
        for my $var (@vars) {
                my @field=split /-/, $var;
                push @field_names, $field[0];
                push @values, "?";
		print "my \$$field[0];\n";
        }
        $line.=join ",", @field_names;
        $line.=") VALUES (";
        $line.=join "," , @values;
        $line.=")\";";
	print "#Create and prepare the INSERT statement for $table\n";
        print "$line\n";
#	print "\"\$statement\\n\";\n";
#	$line="\$insert{\"$table\"}=\$dbh->prepare(\$statement) or die \$dbh->errstr;";
	$line="if (! defined(\$insert{\"$table\"}=\$dbh->prepare(\$statement)) ) {";
	print "$line\n";
	print "\t\$dbh->rollback;\n";
	print "\t\$dbh->disconnect;\n";
	print "\tdie \$dbh->errstr;\n";
	print "}\n\n";
	print "\$inserts{\"$table\"}=0;\n";
#	print "$line\n\n";
}

print "while(<>) {\n";
print "\ts/\\x00/ /g; #translate nulls to spaces\n";
#print "\t\$_=~s/\\\\/\\\\\\\\/g;\n";
#print "\t\$_=~s/\\\'/\\\\\\\'/g;\n";
#print "\t\$_=~s/\\\"/\\\\\\\"/g;\n";
print "\tif (0 == \$. % 1000) {\n"; #print \"Processed \$. lines.\\n\";}\n";
print "\t\tprint \"Processed \$. lines. Committing.\\n\";\n";
print "\t\t\$dbh->commit;\n";
print "\t}\n";
print "\t\$rectype=substr(\$_,0,4);\n\n";
for $table (sort keys %vars_in_table) {
	print "if (\$rectype eq \'$rectype_table{$table}\') {\n";
	my @vars=split / /,$vars_in_table{$table};
	shift @vars;
	my @var_names=();
	for my $var (@vars) {
		my @field = split /-/, $var;
		print "\t\$$field[0]=substr(\$_,$field[1],$field[2]);\n";
#		print "\t\$$field[0]=~s/\\\\/\\\\\\\\/g;\n";
#		print "\t\$$field[0]=~s/\\\'/\\\\\\\'/g;\n";
#		print "\t\$$field[0]=~s/\\\"/\\\\\\\"/g;\n";
		push @var_names, "\$".$field[0];
		if ("yes" eq $field[3]) {
#			print "\tprint \"$field[0]=\\\"\$$field[0]\\\"\\n\";\n";
			$blanks = ' ' x $field[2];
			print "\tif (\$$field[0] eq \"$blanks\") { undef \$$field[0];}\n";
		}
	}
	my $var_names = join ",\n\t\t\t", @var_names;
#	print "\t\$insert{\"$table\"}->execute($var_names) or die \$dbh->errstr;\n";
	print "\t\$rv=\$insert{\"$table\"}->execute($var_names);\n";
	print "\tif (! defined(\$rv)) {\n";
	print "\t\tprint \"Error occurred processing input line \$.\\n\";";
	print "\t\tprint \"\$_\\n\";\n";
	print "\t\t\$dbh->rollback;\n";
	print "\t\t\$dbh->disconnect;\n";
	print "\t\tdie \$dbh->errstr;\n";
	print "\t}\n";
	print "\$inserts{\"$table\"}++;\n";
	print "\tnext; }\n\n";	
}
print "}\n";
print "print \"Processed \$. lines.\\n\";\n";
print "\$dbh->commit;\n";
print "\$dbh->disconnect;\n";
print "my \$inserts;\n";
for $table (sort keys %vars_in_table) {
	print "\$inserts=\$inserts{\"$table\"};\n";
	print "print \"Inserted \$inserts records into table: $table\\n\";\n";
}
