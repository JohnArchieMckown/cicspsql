#!/usr/bin/perl
use strict;
use warnings;
use DBI;
use DBD::Pg qw(:pg_types);
use bytes;
my ($rv, $rectype, $statement);
my %insert;
my %inserts;
my $dbh=DBI->connect("dbi:Pg:dbname=cicsrdo","","",{PrintError=>0, RaiseError=>1, AutoCommit=>0});
die "Unable to connect to database." unless defined($dbh);

#Table:connection
#delete all rows from the connection table
$dbh->do("delete from connection");
#Define the column names for the connection table to Perl
my $connection;
my $rdogroup;
my $description;
my $netname;
my $indsys;
my $remotesystem;
my $remotename;
my $remotesysnet;
my $accessmethod;
my $protocol;
my $conntype;
my $singlesess;
my $datastream;
my $recordformat;
my $queuelimit;
my $maxqtime;
my $autoconnect;
my $inservice;
my $securityname;
my $attachsec;
my $bindsecurity;
my $usedfltuser;
my $psrecovery;
my $xlnaction;
#Create and prepare the INSERT statement for connection
$statement="INSERT INTO connection (connection,rdogroup,description,netname,indsys,remotesystem,remotename,remotesysnet,accessmethod,protocol,conntype,singlesess,datastream,recordformat,queuelimit,maxqtime,autoconnect,inservice,securityname,attachsec,bindsecurity,usedfltuser,psrecovery,xlnaction) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
if (! defined($insert{"connection"}=$dbh->prepare($statement)) ) {
	$dbh->rollback;
	$dbh->disconnect;
	die $dbh->errstr;
}

$inserts{"connection"}=0;
#Table:db2conn
#delete all rows from the db2conn table
$dbh->do("delete from db2conn");
#Define the column names for the db2conn table to Perl
my $db2conn;
my $connecterror;
my $db2id;
my $msgqueue1;
my $msgqueue2;
my $msgqueue3;
my $nontermrel;
my $purgecycle;
my $signid;
my $standbymode;
my $statsqueue;
my $tcblimit;
my $threaderror;
my $accountrec;
my $authid;
my $authtype;
my $drollback;
my $plan;
my $planexitname;
my $priority;
my $threadlimit;
my $threadwait;
my $comauthid;
my $comauthtype;
my $comthreadlim;
#Create and prepare the INSERT statement for db2conn
$statement="INSERT INTO db2conn (db2conn,rdogroup,description,connecterror,db2id,msgqueue1,msgqueue2,msgqueue3,nontermrel,purgecycle,signid,standbymode,statsqueue,tcblimit,threaderror,accountrec,authid,authtype,drollback,plan,planexitname,priority,threadlimit,threadwait,comauthid,comauthtype,comthreadlim) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
if (! defined($insert{"db2conn"}=$dbh->prepare($statement)) ) {
	$dbh->rollback;
	$dbh->disconnect;
	die $dbh->errstr;
}

$inserts{"db2conn"}=0;
#Table:db2entry
#delete all rows from the db2entry table
$dbh->do("delete from db2entry");
#Define the column names for the db2entry table to Perl
my $db2entry;
my $transid;
my $protectnum;
#Create and prepare the INSERT statement for db2entry
$statement="INSERT INTO db2entry (db2entry,rdogroup,description,transid,accountrec,authid,authtype,drollback,plan,planexitname,priority,protectnum,threadlimit,threadwait) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
if (! defined($insert{"db2entry"}=$dbh->prepare($statement)) ) {
	$dbh->rollback;
	$dbh->disconnect;
	die $dbh->errstr;
}

$inserts{"db2entry"}=0;
#Table:db2tran
#delete all rows from the db2tran table
$dbh->do("delete from db2tran");
#Define the column names for the db2tran table to Perl
my $db2tran;
my $entry;
#Create and prepare the INSERT statement for db2tran
$statement="INSERT INTO db2tran (db2tran,rdogroup,description,entry,transid) VALUES (?,?,?,?,?)";
if (! defined($insert{"db2tran"}=$dbh->prepare($statement)) ) {
	$dbh->rollback;
	$dbh->disconnect;
	die $dbh->errstr;
}

$inserts{"db2tran"}=0;
#Table:doctemplate
#delete all rows from the doctemplate table
$dbh->do("delete from doctemplate");
#Define the column names for the doctemplate table to Perl
my $doctemplate;
my $templatename;
my $file;
my $tsqueue;
my $tdqueue;
my $program;
my $exitpgm;
my $ddname;
my $membername;
my $appendcrlf;
my $type;
#Create and prepare the INSERT statement for doctemplate
$statement="INSERT INTO doctemplate (doctemplate,rdogroup,description,templatename,file,tsqueue,tdqueue,program,exitpgm,ddname,membername,appendcrlf,type) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)";
if (! defined($insert{"doctemplate"}=$dbh->prepare($statement)) ) {
	$dbh->rollback;
	$dbh->disconnect;
	die $dbh->errstr;
}

$inserts{"doctemplate"}=0;
#Table:enqmodel
#delete all rows from the enqmodel table
$dbh->do("delete from enqmodel");
#Define the column names for the enqmodel table to Perl
my $enqmodel;
my $enqscope;
my $nq_status;
my $enqname;
#Create and prepare the INSERT statement for enqmodel
$statement="INSERT INTO enqmodel (enqmodel,rdogroup,description,enqscope,nq_status,enqname) VALUES (?,?,?,?,?,?)";
if (! defined($insert{"enqmodel"}=$dbh->prepare($statement)) ) {
	$dbh->rollback;
	$dbh->disconnect;
	die $dbh->errstr;
}

$inserts{"enqmodel"}=0;
#Table:file
#delete all rows from the file table
$dbh->do("delete from file");
#Define the column names for the file table to Perl
my $dsname;
my $fi_password;
my $rlsaccess;
my $lsrpoolid;
my $readinteg;
my $dsnsharing;
my $strings;
my $nsrgroup;
my $recordsize;
my $keylength;
my $fi_status;
my $opentime;
my $disposition;
my $databuffers;
my $indexbuffers;
my $fi_table;
my $fi_maxnumrecs;
my $cfdtpool;
my $tablename;
my $updatemodel;
my $load;
my $fi_add;
my $fi_browse;
my $fi_delete;
my $fi_read;
my $fi_update;
my $journal;
my $jnlread;
my $jnlsyncread;
my $jnlupdate;
my $jnladd;
my $jnlsyncwrite;
my $recovery;
my $fwdrecovlog;
my $backuptype;
#Create and prepare the INSERT statement for file
$statement="INSERT INTO file (file,rdogroup,description,dsname,fi_password,rlsaccess,lsrpoolid,readinteg,dsnsharing,strings,nsrgroup,remotesystem,remotename,recordsize,keylength,fi_status,opentime,disposition,databuffers,indexbuffers,fi_table,fi_maxnumrecs,cfdtpool,tablename,updatemodel,load,recordformat,fi_add,fi_browse,fi_delete,fi_read,fi_update,journal,jnlread,jnlsyncread,jnlupdate,jnladd,jnlsyncwrite,recovery,fwdrecovlog,backuptype) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
if (! defined($insert{"file"}=$dbh->prepare($statement)) ) {
	$dbh->rollback;
	$dbh->disconnect;
	die $dbh->errstr;
}

$inserts{"file"}=0;
#Table:journalmodel
#delete all rows from the journalmodel table
$dbh->do("delete from journalmodel");
#Define the column names for the journalmodel table to Perl
my $journalmodel;
my $journalname;
my $streamname;
#Create and prepare the INSERT statement for journalmodel
$statement="INSERT INTO journalmodel (journalmodel,rdogroup,description,journalname,type,streamname) VALUES (?,?,?,?,?,?)";
if (! defined($insert{"journalmodel"}=$dbh->prepare($statement)) ) {
	$dbh->rollback;
	$dbh->disconnect;
	die $dbh->errstr;
}

$inserts{"journalmodel"}=0;
#Table:lsrpool
#delete all rows from the lsrpool table
$dbh->do("delete from lsrpool");
#Define the column names for the lsrpool table to Perl
my $lsrpool;
my $maxkeylength;
my $sharelimit;
my $data512;
my $data1k;
my $data2k;
my $data4k;
my $data8k;
my $data12k;
my $data16k;
my $data20k;
my $data24k;
my $data28k;
my $data32k;
my $index512;
my $index1k;
my $index2k;
my $index4k;
my $index8k;
my $index12k;
my $index16k;
my $index20k;
my $index24k;
my $index28k;
my $index32k;
my $hsdata4k;
my $hsdata8k;
my $hsdata12k;
my $hsdata16k;
my $hsdata20k;
my $hsdata24k;
my $hsdata28k;
my $hsdata32k;
my $hsindex4k;
my $hsindex8k;
my $hsindex12k;
my $hsindex16k;
my $hsindex20k;
my $hsindex24k;
my $hsindex28k;
my $hsindex32k;
#Create and prepare the INSERT statement for lsrpool
$statement="INSERT INTO lsrpool (lsrpool,rdogroup,description,lsrpoolid,maxkeylength,sharelimit,strings,data512,data1k,data2k,data4k,data8k,data12k,data16k,data20k,data24k,data28k,data32k,index512,index1k,index2k,index4k,index8k,index12k,index16k,index20k,index24k,index28k,index32k,hsdata4k,hsdata8k,hsdata12k,hsdata16k,hsdata20k,hsdata24k,hsdata28k,hsdata32k,hsindex4k,hsindex8k,hsindex12k,hsindex16k,hsindex20k,hsindex24k,hsindex28k,hsindex32k) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
if (! defined($insert{"lsrpool"}=$dbh->prepare($statement)) ) {
	$dbh->rollback;
	$dbh->disconnect;
	die $dbh->errstr;
}

$inserts{"lsrpool"}=0;
#Table:mapset
#delete all rows from the mapset table
$dbh->do("delete from mapset");
#Define the column names for the mapset table to Perl
my $mapset;
my $resident;
my $usage;
my $uselpacopy;
my $status;
#Create and prepare the INSERT statement for mapset
$statement="INSERT INTO mapset (mapset,rdogroup,description,resident,usage,uselpacopy,status) VALUES (?,?,?,?,?,?,?)";
if (! defined($insert{"mapset"}=$dbh->prepare($statement)) ) {
	$dbh->rollback;
	$dbh->disconnect;
	die $dbh->errstr;
}

$inserts{"mapset"}=0;
#Table:partitionset
#delete all rows from the partitionset table
$dbh->do("delete from partitionset");
#Define the column names for the partitionset table to Perl
my $partitionset;
#Create and prepare the INSERT statement for partitionset
$statement="INSERT INTO partitionset (partitionset,rdogroup,description,resident,usage,uselpacopy,status) VALUES (?,?,?,?,?,?,?)";
if (! defined($insert{"partitionset"}=$dbh->prepare($statement)) ) {
	$dbh->rollback;
	$dbh->disconnect;
	die $dbh->errstr;
}

$inserts{"partitionset"}=0;
#Table:partner
#delete all rows from the partner table
$dbh->do("delete from partner");
#Define the column names for the partner table to Perl
my $partner;
my $network;
my $profile;
my $tpname;
my $xtpname;
#Create and prepare the INSERT statement for partner
$statement="INSERT INTO partner (partner,rdogroup,description,netname,network,profile,tpname,xtpname) VALUES (?,?,?,?,?,?,?,?)";
if (! defined($insert{"partner"}=$dbh->prepare($statement)) ) {
	$dbh->rollback;
	$dbh->disconnect;
	die $dbh->errstr;
}

$inserts{"partner"}=0;
#Table:processtype
#delete all rows from the processtype table
$dbh->do("delete from processtype");
#Define the column names for the processtype table to Perl
my $processtype;
my $auditlog;
my $auditlevel;
#Create and prepare the INSERT statement for processtype
$statement="INSERT INTO processtype (processtype,rdogroup,description,status,file,auditlog,auditlevel) VALUES (?,?,?,?,?,?,?)";
if (! defined($insert{"processtype"}=$dbh->prepare($statement)) ) {
	$dbh->rollback;
	$dbh->disconnect;
	die $dbh->errstr;
}

$inserts{"processtype"}=0;
#Table:profile
#delete all rows from the profile table
$dbh->do("delete from profile");
#Define the column names for the profile table to Perl
my $scrnsize;
my $uctran;
my $modename;
my $facilitylike;
my $printercomp;
my $msgjrnl;
my $msginteg;
my $onewte;
my $chaincontrol;
my $dvsuprt;
my $inbfmh;
my $raq;
my $logrec;
my $nepclass;
my $rtimout;
#Create and prepare the INSERT statement for profile
$statement="INSERT INTO profile (profile,rdogroup,description,scrnsize,uctran,modename,facilitylike,printercomp,journal,msgjrnl,msginteg,onewte,chaincontrol,dvsuprt,inbfmh,raq,logrec,nepclass,rtimout) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
if (! defined($insert{"profile"}=$dbh->prepare($statement)) ) {
	$dbh->rollback;
	$dbh->disconnect;
	die $dbh->errstr;
}

$inserts{"profile"}=0;
#Table:program
#delete all rows from the program table
$dbh->do("delete from program");
#Define the column names for the program table to Perl
my $language;
my $reload;
my $cedf;
my $datalocation;
my $execkey;
my $concurrency;
my $dynamic;
my $executionset;
my $jvm;
my $jvmclass;
my $hotpool;
#Create and prepare the INSERT statement for program
$statement="INSERT INTO program (program,rdogroup,description,language,reload,resident,usage,uselpacopy,status,cedf,datalocation,execkey,concurrency,dynamic,remotesystem,remotename,transid,executionset,jvm,jvmclass,hotpool) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
if (! defined($insert{"program"}=$dbh->prepare($statement)) ) {
	$dbh->rollback;
	$dbh->disconnect;
	die $dbh->errstr;
}

$inserts{"program"}=0;
#Table:requestmodel
#delete all rows from the requestmodel table
$dbh->do("delete from requestmodel");
#Define the column names for the requestmodel table to Perl
my $requestmodel;
my $omgmodule;
my $omginterface;
my $omgoperation;
#Create and prepare the INSERT statement for requestmodel
$statement="INSERT INTO requestmodel (requestmodel,rdogroup,description,omgmodule,omginterface,omgoperation,transid) VALUES (?,?,?,?,?,?,?)";
if (! defined($insert{"requestmodel"}=$dbh->prepare($statement)) ) {
	$dbh->rollback;
	$dbh->disconnect;
	die $dbh->errstr;
}

$inserts{"requestmodel"}=0;
#Table:sessions
#delete all rows from the sessions table
$dbh->do("delete from sessions");
#Define the column names for the sessions table to Perl
my $sessions;
my $sessname;
my $netnameq;
my $maximum;
my $receivepfx;
my $receivecount;
my $sendpfx;
my $sendcount;
my $sendsize;
my $receivesize;
my $sesspriority;
my $userid;
my $buildchain;
my $userarealen;
my $ioarealen;
my $relreq;
my $discreq;
my $recovoption;
#Create and prepare the INSERT statement for sessions
$statement="INSERT INTO sessions (sessions,rdogroup,description,connection,sessname,netnameq,modename,protocol,maximum,receivepfx,receivecount,sendpfx,sendcount,sendsize,receivesize,sesspriority,userid,autoconnect,buildchain,userarealen,ioarealen,relreq,discreq,nepclass,recovoption) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
if (! defined($insert{"sessions"}=$dbh->prepare($statement)) ) {
	$dbh->rollback;
	$dbh->disconnect;
	die $dbh->errstr;
}

$inserts{"sessions"}=0;
#Table:tcpipservice
#delete all rows from the tcpipservice table
$dbh->do("delete from tcpipservice");
#Define the column names for the tcpipservice table to Perl
my $tcpipservice;
my $urm;
my $portnumber;
my $certificate;
my $ssl;
my $authenticate;
my $transaction;
my $backlog;
my $tsqprefix;
my $ipaddress;
my $socketclose;
#Create and prepare the INSERT statement for tcpipservice
$statement="INSERT INTO tcpipservice (tcpipservice,rdogroup,description,urm,portnumber,certificate,status,ssl,authenticate,transaction,backlog,tsqprefix,ipaddress,socketclose) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
if (! defined($insert{"tcpipservice"}=$dbh->prepare($statement)) ) {
	$dbh->rollback;
	$dbh->disconnect;
	die $dbh->errstr;
}

$inserts{"tcpipservice"}=0;
#Table:tdqueue
#delete all rows from the tdqueue table
$dbh->do("delete from tdqueue");
#Define the column names for the tdqueue table to Perl
my $sysoutclass;
my $erroroption;
my $rewind;
my $typefile;
my $blocksize;
my $blockformat;
my $printcontrol;
my $atifacility;
my $recovstatus;
my $facilityid;
my $triggerlevel;
my $wait;
my $waitaction;
my $indirectname;
my $remotelength;
#Create and prepare the INSERT statement for tdqueue
$statement="INSERT INTO tdqueue (tdqueue,rdogroup,description,type,databuffers,ddname,dsname,sysoutclass,erroroption,opentime,rewind,typefile,recordsize,blocksize,recordformat,blockformat,printcontrol,disposition,atifacility,recovstatus,facilityid,transid,triggerlevel,userid,wait,waitaction,indirectname,remotename,remotesystem,remotelength) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
if (! defined($insert{"tdqueue"}=$dbh->prepare($statement)) ) {
	$dbh->rollback;
	$dbh->disconnect;
	die $dbh->errstr;
}

$inserts{"tdqueue"}=0;
#Table:terminal
#delete all rows from the terminal table
$dbh->do("delete from terminal");
#Define the column names for the terminal table to Perl
my $terminal;
my $autinstmodel;
my $autinstname;
my $typeterm;
my $console;
my $consname;
my $printer;
my $printercopy;
my $altprinter;
my $altprintcopy;
my $pool;
my $tasklimit;
my $natlang;
my $termpriority;
#Create and prepare the INSERT statement for terminal
$statement="INSERT INTO terminal (terminal,rdogroup,description,autinstmodel,autinstname,typeterm,netname,console,consname,remotesystem,remotename,remotesysnet,modename,printer,printercopy,altprinter,altprintcopy,pool,tasklimit,userid,natlang,transaction,termpriority,inservice,securityname,attachsec,bindsecurity,usedfltuser) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
if (! defined($insert{"terminal"}=$dbh->prepare($statement)) ) {
	$dbh->rollback;
	$dbh->disconnect;
	die $dbh->errstr;
}

$inserts{"terminal"}=0;
#Table:tranclass
#delete all rows from the tranclass table
$dbh->do("delete from tranclass");
#Define the column names for the tranclass table to Perl
my $tranclass;
my $maxactive;
my $purgethresh;
#Create and prepare the INSERT statement for tranclass
$statement="INSERT INTO tranclass (tranclass,rdogroup,description,maxactive,purgethresh) VALUES (?,?,?,?,?)";
if (! defined($insert{"tranclass"}=$dbh->prepare($statement)) ) {
	$dbh->rollback;
	$dbh->disconnect;
	die $dbh->errstr;
}

$inserts{"tranclass"}=0;
#Table:transaction
#delete all rows from the transaction table
$dbh->do("delete from transaction");
#Define the column names for the transaction table to Perl
my $twasize;
my $taskdataloc;
my $taskdatakey;
my $storageclear;
my $runaway;
my $shutdown;
my $isolate;
my $brexit;
my $routable;
my $trprof;
my $localq;
my $alias;
my $taskreq;
my $xtranid;
my $dtimout;
my $restart;
my $spurge;
my $tpurge;
my $dump;
my $trace;
my $confdata;
my $action;
my $waittime;
my $ressec;
my $cmdsec;
#Create and prepare the INSERT statement for transaction
$statement="INSERT INTO transaction (transaction,rdogroup,description,program,twasize,profile,partitionset,status,taskdataloc,taskdatakey,storageclear,runaway,shutdown,isolate,brexit,dynamic,routable,remotesystem,remotename,trprof,localq,priority,tranclass,alias,taskreq,xtranid,tpname,xtpname,dtimout,restart,spurge,tpurge,dump,trace,confdata,action,wait,waittime,ressec,cmdsec) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
if (! defined($insert{"transaction"}=$dbh->prepare($statement)) ) {
	$dbh->rollback;
	$dbh->disconnect;
	die $dbh->errstr;
}

$inserts{"transaction"}=0;
#Table:tsmodel
#delete all rows from the tsmodel table
$dbh->do("delete from tsmodel");
#Define the column names for the tsmodel table to Perl
my $tsmodel;
my $prefix;
my $xprefix;
my $location;
my $security;
my $poolname;
my $remoteprefix;
my $xremotepfx;
#Create and prepare the INSERT statement for tsmodel
$statement="INSERT INTO tsmodel (tsmodel,rdogroup,description,prefix,xprefix,location,recovery,security,poolname,remotesystem,remoteprefix,xremotepfx) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
if (! defined($insert{"tsmodel"}=$dbh->prepare($statement)) ) {
	$dbh->rollback;
	$dbh->disconnect;
	die $dbh->errstr;
}

$inserts{"tsmodel"}=0;
#Table:typeterm
#delete all rows from the typeterm table
$dbh->do("delete from typeterm");
#Define the column names for the typeterm table to Perl
my $device;
my $termmodel;
my $sessiontype;
my $ldclist;
my $shippable;
my $pagesize;
my $altpage;
my $altsuffix;
my $fmhparm;
my $oboperid;
my $autopage;
my $defscreen;
my $altscreen;
my $aplkybd;
my $apltext;
my $audiblealarm;
my $color;
my $copy;
my $dualcasekybd;
my $extendedds;
my $hilight;
my $katakana;
my $lightpen;
my $msrcontrol;
my $obformat;
my $partitions;
my $printadapter;
my $progsymbols;
my $validation;
my $formfeed;
my $horizform;
my $verticalform;
my $textkybd;
my $textprint;
my $query;
my $outline;
my $sosi;
my $backtrans;
my $cgcsgid;
my $ascii;
my $bracket;
my $logmode;
my $errlastline;
my $errintensify;
my $errcolor;
my $errhilight;
my $ati;
my $tti;
my $createsess;
my $signoff;
my $xrfsignoff;
my $routedmsgs;
my $logonmsg;
my $recovnotify;
#Create and prepare the INSERT statement for typeterm
$statement="INSERT INTO typeterm (typeterm,rdogroup,description,device,termmodel,sessiontype,ldclist,shippable,pagesize,altpage,altsuffix,fmhparm,oboperid,autopage,defscreen,altscreen,aplkybd,apltext,audiblealarm,color,copy,dualcasekybd,extendedds,hilight,katakana,lightpen,msrcontrol,obformat,partitions,printadapter,progsymbols,validation,formfeed,horizform,verticalform,textkybd,textprint,query,outline,sosi,backtrans,cgcsgid,ascii,sendsize,receivesize,bracket,logmode,errlastline,errintensify,errcolor,errhilight,autoconnect,ati,tti,createsess,relreq,discreq,nepclass,signoff,xrfsignoff,routedmsgs,logonmsg,buildchain,userarealen,ioarealen,uctran,recovoption,recovnotify) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
if (! defined($insert{"typeterm"}=$dbh->prepare($statement)) ) {
	$dbh->rollback;
	$dbh->disconnect;
	die $dbh->errstr;
}

$inserts{"typeterm"}=0;
while(<>) {
	s/\x00/ /g; #change nulls to spaces
	if (0 == $. % 1000) { print "Processed $. lines.\n";}
	$rectype=substr($_,0,4);
	if ($rectype eq 'CONN') {
		$connection=substr($_,4,4);
		$rdogroup=substr($_,12,8);
		$description=substr($_,20,58);
		$netname=substr($_,78,8);
		$indsys=substr($_,86,4);
		$remotesystem=substr($_,90,4);
		$remotename=substr($_,94,4);
		$remotesysnet=substr($_,98,8);
		$accessmethod=substr($_,106,8);
		$protocol=substr($_,114,4);
		$conntype=substr($_,118,8);
		$singlesess=substr($_,126,3);
		$datastream=substr($_,129,8);
		$recordformat=substr($_,137,2);
		$queuelimit=substr($_,139,4);
		$maxqtime=substr($_,143,4);
		$autoconnect=substr($_,147,3);
		$inservice=substr($_,150,3);
		$securityname=substr($_,153,8);
		$attachsec=substr($_,161,10);
		$bindsecurity=substr($_,171,3);
		$usedfltuser=substr($_,174,3);
		$psrecovery=substr($_,177,10);
		$xlnaction=substr($_,187,5);
		$rv=$insert{connection}->execute($connection,$rdogroup,$description,$netname,$indsys,$remotesystem,$remotename,$remotesysnet,$accessmethod,$protocol,$conntype,$singlesess,$datastream,$recordformat,$queuelimit,$maxqtime,$autoconnect,$inservice,$securityname,$attachsec,$bindsecurity,$usedfltuser,$psrecovery,$xlnaction);
		if (! defined($rv)) {
			$dbh->rollback;
			$dbh->disconnect;
			die $dbh->errstr;
		}
		$inserts{"connection"}++;
		next;
	}

	if ($rectype eq 'DB2C') {
		$db2conn=substr($_,4,8);
		$rdogroup=substr($_,12,8);
		$description=substr($_,20,58);
		$connecterror=substr($_,78,7);
		$db2id=substr($_,85,4);
		$msgqueue1=substr($_,89,4);
		$msgqueue2=substr($_,93,4);
		$msgqueue3=substr($_,97,4);
		$nontermrel=substr($_,101,3);
		$purgecycle=substr($_,104,5);
		$signid=substr($_,109,8);
		$standbymode=substr($_,117,9);
		$statsqueue=substr($_,126,4);
		$tcblimit=substr($_,130,4);
		$threaderror=substr($_,134,5);
		$accountrec=substr($_,139,4);
		$authid=substr($_,143,8);
		$authtype=substr($_,151,6);
		$drollback=substr($_,157,3);
		$plan=substr($_,160,8);
		$planexitname=substr($_,168,8);
		$priority=substr($_,176,5);
		$threadlimit=substr($_,181,4);
		$threadwait=substr($_,185,3);
		$comauthid=substr($_,188,8);
		$comauthtype=substr($_,196,6);
		$comthreadlim=substr($_,202,4);
		$rv=$insert{db2conn}->execute($db2conn,$rdogroup,$description,$connecterror,$db2id,$msgqueue1,$msgqueue2,$msgqueue3,$nontermrel,$purgecycle,$signid,$standbymode,$statsqueue,$tcblimit,$threaderror,$accountrec,$authid,$authtype,$drollback,$plan,$planexitname,$priority,$threadlimit,$threadwait,$comauthid,$comauthtype,$comthreadlim);
		if (! defined($rv)) {
			$dbh->rollback;
			$dbh->disconnect;
			die $dbh->errstr;
		}
		$inserts{"db2conn"}++;
		next;
	}

	if ($rectype eq 'DB2E') {
		$db2entry=substr($_,4,8);
		$rdogroup=substr($_,12,8);
		$description=substr($_,20,58);
		$transid=substr($_,78,4);
		$accountrec=substr($_,82,4);
		$authid=substr($_,86,8);
		$authtype=substr($_,94,6);
		$drollback=substr($_,100,3);
		$plan=substr($_,103,8);
		$planexitname=substr($_,111,8);
		$priority=substr($_,119,5);
		$protectnum=substr($_,124,4);
		$threadlimit=substr($_,128,4);
		$threadwait=substr($_,132,4);
		$rv=$insert{db2entry}->execute($db2entry,$rdogroup,$description,$transid,$accountrec,$authid,$authtype,$drollback,$plan,$planexitname,$priority,$protectnum,$threadlimit,$threadwait);
		if (! defined($rv)) {
			$dbh->rollback;
			$dbh->disconnect;
			die $dbh->errstr;
		}
		$inserts{"db2entry"}++;
		next;
	}

	if ($rectype eq 'DB2T') {
		$db2tran=substr($_,4,8);
		$rdogroup=substr($_,12,8);
		$description=substr($_,20,58);
		$entry=substr($_,78,8);
		$transid=substr($_,86,4);
		$rv=$insert{db2tran}->execute($db2tran,$rdogroup,$description,$entry,$transid);
		if (! defined($rv)) {
			$dbh->rollback;
			$dbh->disconnect;
			die $dbh->errstr;
		}
		$inserts{"db2tran"}++;
		next;
	}

	if ($rectype eq 'DOCT') {
		$doctemplate=substr($_,4,8);
		$rdogroup=substr($_,12,8);
		$description=substr($_,20,58);
		$templatename=substr($_,78,48);
		$file=substr($_,126,8);
		$tsqueue=substr($_,134,16);
		$tdqueue=substr($_,150,4);
		$program=substr($_,154,8);
		$exitpgm=substr($_,162,8);
		$ddname=substr($_,170,8);
		$membername=substr($_,178,8);
		$appendcrlf=substr($_,186,3);
		$type=substr($_,189,6);
		$rv=$insert{doctemplate}->execute($doctemplate,$rdogroup,$description,$templatename,$file,$tsqueue,$tdqueue,$program,$exitpgm,$ddname,$membername,$appendcrlf,$type);
		if (! defined($rv)) {
			$dbh->rollback;
			$dbh->disconnect;
			die $dbh->errstr;
		}
		$inserts{"doctemplate"}++;
		next;
	}

	if ($rectype eq 'ENQM') {
		$enqmodel=substr($_,4,8);
		$rdogroup=substr($_,12,8);
		$description=substr($_,20,58);
		$enqscope=substr($_,78,4);
		$nq_status=substr($_,82,8);
		$enqname=substr($_,90,255);
		$rv=$insert{enqmodel}->execute($enqmodel,$rdogroup,$description,$enqscope,$nq_status,$enqname);
		if (! defined($rv)) {
			$dbh->rollback;
			$dbh->disconnect;
			die $dbh->errstr;
		}
		$inserts{"enqmodel"}++;
		next;
	}

	if ($rectype eq 'FILE') {
		$file=substr($_,4,8);
		$rdogroup=substr($_,12,8);
		$description=substr($_,20,58);
		$dsname=substr($_,78,44);
		$fi_password=substr($_,122,8);
		$rlsaccess=substr($_,130,3);
		$lsrpoolid=substr($_,133,1);
		$readinteg=substr($_,134,11);
		$dsnsharing=substr($_,145,10);
		$strings=substr($_,155,3);
		$nsrgroup=substr($_,158,8);
		$remotesystem=substr($_,166,4);
		$remotename=substr($_,170,8);
		$recordsize=substr($_,178,5);
		$keylength=substr($_,183,3);
		$fi_status=substr($_,186,9);
		$opentime=substr($_,195,8);
		$disposition=substr($_,203,5);
		$databuffers=substr($_,208,5);
		$indexbuffers=substr($_,213,5);
		$fi_table=substr($_,218,4);
		$fi_maxnumrecs=substr($_,222,8);
		$cfdtpool=substr($_,230,8);
		$tablename=substr($_,238,8);
		$updatemodel=substr($_,246,10);
		$load=substr($_,256,3);
		$recordformat=substr($_,259,1);
		$fi_add=substr($_,260,3);
		$fi_browse=substr($_,263,3);
		$fi_delete=substr($_,266,3);
		$fi_read=substr($_,269,3);
		$fi_update=substr($_,272,3);
		$journal=substr($_,275,2);
		$jnlread=substr($_,277,10);
		$jnlsyncread=substr($_,287,3);
		$jnlupdate=substr($_,290,3);
		$jnladd=substr($_,293,6);
		$jnlsyncwrite=substr($_,299,3);
		$recovery=substr($_,302,11);
		$fwdrecovlog=substr($_,313,2);
		$backuptype=substr($_,315,7);
		$rv=$insert{file}->execute($file,$rdogroup,$description,$dsname,$fi_password,$rlsaccess,$lsrpoolid,$readinteg,$dsnsharing,$strings,$nsrgroup,$remotesystem,$remotename,$recordsize,$keylength,$fi_status,$opentime,$disposition,$databuffers,$indexbuffers,$fi_table,$fi_maxnumrecs,$cfdtpool,$tablename,$updatemodel,$load,$recordformat,$fi_add,$fi_browse,$fi_delete,$fi_read,$fi_update,$journal,$jnlread,$jnlsyncread,$jnlupdate,$jnladd,$jnlsyncwrite,$recovery,$fwdrecovlog,$backuptype);
		if (! defined($rv)) {
			$dbh->rollback;
			$dbh->disconnect;
			die $dbh->errstr;
		}
		$inserts{"file"}++;
		next;
	}

	if ($rectype eq 'JOUR') {
		$journalmodel=substr($_,4,8);
		$rdogroup=substr($_,12,8);
		$description=substr($_,20,58);
		$journalname=substr($_,78,8);
		$type=substr($_,86,3);
		$streamname=substr($_,89,26);
		$rv=$insert{journalmodel}->execute($journalmodel,$rdogroup,$description,$journalname,$type,$streamname);
		if (! defined($rv)) {
			$dbh->rollback;
			$dbh->disconnect;
			die $dbh->errstr;
		}
		$inserts{"journalmodel"}++;
		next;
	}

	if ($rectype eq 'LSRP') {
		$lsrpool=substr($_,4,8);
		$rdogroup=substr($_,12,8);
		$description=substr($_,20,58);
		$lsrpoolid=substr($_,78,1);
		$maxkeylength=substr($_,79,3);
		$sharelimit=substr($_,82,3);
		$strings=substr($_,85,3);
		$data512=substr($_,88,5);
		$data1k=substr($_,93,5);
		$data2k=substr($_,98,5);
		$data4k=substr($_,103,5);
		$data8k=substr($_,108,5);
		$data12k=substr($_,113,5);
		$data16k=substr($_,118,5);
		$data20k=substr($_,123,5);
		$data24k=substr($_,128,5);
		$data28k=substr($_,133,5);
		$data32k=substr($_,138,5);
		$index512=substr($_,143,5);
		$index1k=substr($_,148,5);
		$index2k=substr($_,153,5);
		$index4k=substr($_,158,5);
		$index8k=substr($_,163,5);
		$index12k=substr($_,168,5);
		$index16k=substr($_,173,5);
		$index20k=substr($_,178,5);
		$index24k=substr($_,183,5);
		$index28k=substr($_,188,5);
		$index32k=substr($_,193,5);
		$hsdata4k=substr($_,198,8);
		$hsdata8k=substr($_,206,8);
		$hsdata12k=substr($_,214,8);
		$hsdata16k=substr($_,222,8);
		$hsdata20k=substr($_,230,8);
		$hsdata24k=substr($_,238,8);
		$hsdata28k=substr($_,246,8);
		$hsdata32k=substr($_,254,8);
		$hsindex4k=substr($_,262,8);
		$hsindex8k=substr($_,270,8);
		$hsindex12k=substr($_,278,8);
		$hsindex16k=substr($_,286,8);
		$hsindex20k=substr($_,294,8);
		$hsindex24k=substr($_,302,8);
		$hsindex28k=substr($_,310,8);
		$hsindex32k=substr($_,318,8);
		$rv=$insert{lsrpool}->execute($lsrpool,$rdogroup,$description,$lsrpoolid,$maxkeylength,$sharelimit,$strings,$data512,$data1k,$data2k,$data4k,$data8k,$data12k,$data16k,$data20k,$data24k,$data28k,$data32k,$index512,$index1k,$index2k,$index4k,$index8k,$index12k,$index16k,$index20k,$index24k,$index28k,$index32k,$hsdata4k,$hsdata8k,$hsdata12k,$hsdata16k,$hsdata20k,$hsdata24k,$hsdata28k,$hsdata32k,$hsindex4k,$hsindex8k,$hsindex12k,$hsindex16k,$hsindex20k,$hsindex24k,$hsindex28k,$hsindex32k);
		if (! defined($rv)) {
			$dbh->rollback;
			$dbh->disconnect;
			die $dbh->errstr;
		}
		$inserts{"lsrpool"}++;
		next;
	}

	if ($rectype eq 'MAPS') {
		$mapset=substr($_,4,8);
		$rdogroup=substr($_,12,8);
		$description=substr($_,20,58);
		$resident=substr($_,78,3);
		$usage=substr($_,81,9);
		$uselpacopy=substr($_,90,3);
		$status=substr($_,93,8);
		$rv=$insert{mapset}->execute($mapset,$rdogroup,$description,$resident,$usage,$uselpacopy,$status);
		if (! defined($rv)) {
			$dbh->rollback;
			$dbh->disconnect;
			die $dbh->errstr;
		}
		$inserts{"mapset"}++;
		next;
	}

	if ($rectype eq 'PART') {
		$partitionset=substr($_,4,8);
		$rdogroup=substr($_,12,8);
		$description=substr($_,20,58);
		$resident=substr($_,78,3);
		$usage=substr($_,81,9);
		$uselpacopy=substr($_,90,3);
		$status=substr($_,93,8);
		$rv=$insert{partitionset}->execute($partitionset,$rdogroup,$description,$resident,$usage,$uselpacopy,$status);
		if (! defined($rv)) {
			$dbh->rollback;
			$dbh->disconnect;
			die $dbh->errstr;
		}
		$inserts{"partitionset"}++;
		next;
	}

	if ($rectype eq 'PTNR') {
		$partner=substr($_,4,8);
		$rdogroup=substr($_,12,8);
		$description=substr($_,20,58);
		$netname=substr($_,78,8);
		$network=substr($_,86,8);
		$profile=substr($_,94,8);
		$tpname=substr($_,102,64);
		$xtpname=substr($_,166,128);
		$rv=$insert{partner}->execute($partner,$rdogroup,$description,$netname,$network,$profile,$tpname,$xtpname);
		if (! defined($rv)) {
			$dbh->rollback;
			$dbh->disconnect;
			die $dbh->errstr;
		}
		$inserts{"partner"}++;
		next;
	}

	if ($rectype eq 'PROC') {
		$processtype=substr($_,4,8);
		$rdogroup=substr($_,12,8);
		$description=substr($_,20,58);
		$status=substr($_,78,8);
		$file=substr($_,86,8);
		$auditlog=substr($_,94,8);
		$auditlevel=substr($_,102,8);
		$rv=$insert{processtype}->execute($processtype,$rdogroup,$description,$status,$file,$auditlog,$auditlevel);
		if (! defined($rv)) {
			$dbh->rollback;
			$dbh->disconnect;
			die $dbh->errstr;
		}
		$inserts{"processtype"}++;
		next;
	}

	if ($rectype eq 'PROF') {
		$profile=substr($_,4,8);
		$rdogroup=substr($_,12,8);
		$description=substr($_,20,58);
		$scrnsize=substr($_,78,9);
		$uctran=substr($_,87,3);
		$modename=substr($_,90,8);
		$facilitylike=substr($_,98,4);
		$printercomp=substr($_,102,3);
		$journal=substr($_,105,2);
		$msgjrnl=substr($_,107,6);
		$msginteg=substr($_,113,3);
		$onewte=substr($_,116,3);
		$chaincontrol=substr($_,119,3);
		$dvsuprt=substr($_,122,7);
		$inbfmh=substr($_,129,4);
		$raq=substr($_,133,3);
		$logrec=substr($_,136,3);
		$nepclass=substr($_,139,3);
		$rtimout=substr($_,142,4);
		$rv=$insert{profile}->execute($profile,$rdogroup,$description,$scrnsize,$uctran,$modename,$facilitylike,$printercomp,$journal,$msgjrnl,$msginteg,$onewte,$chaincontrol,$dvsuprt,$inbfmh,$raq,$logrec,$nepclass,$rtimout);
		if (! defined($rv)) {
			$dbh->rollback;
			$dbh->disconnect;
			die $dbh->errstr;
		}
		$inserts{"profile"}++;
		next;
	}

	if ($rectype eq 'PROG') {
		$program=substr($_,4,8);
		$rdogroup=substr($_,12,8);
		$description=substr($_,20,58);
		$language=substr($_,78,9);
		$reload=substr($_,87,3);
		$resident=substr($_,90,3);
		$usage=substr($_,93,9);
		$uselpacopy=substr($_,102,3);
		$status=substr($_,105,8);
		$cedf=substr($_,113,3);
		$datalocation=substr($_,116,5);
		$execkey=substr($_,121,4);
		$concurrency=substr($_,125,10);
		$dynamic=substr($_,135,3);
		$remotesystem=substr($_,138,4);
		$remotename=substr($_,142,8);
		$transid=substr($_,150,4);
		$executionset=substr($_,154,9);
		$jvm=substr($_,163,5);
		$jvmclass=substr($_,168,255);
		$hotpool=substr($_,423,3);
		$rv=$insert{program}->execute($program,$rdogroup,$description,$language,$reload,$resident,$usage,$uselpacopy,$status,$cedf,$datalocation,$execkey,$concurrency,$dynamic,$remotesystem,$remotename,$transid,$executionset,$jvm,$jvmclass,$hotpool);
		if (! defined($rv)) {
			$dbh->rollback;
			$dbh->disconnect;
			die $dbh->errstr;
		}
		$inserts{"program"}++;
		next;
	}

	if ($rectype eq 'REQU') {
		$requestmodel=substr($_,4,8);
		$rdogroup=substr($_,12,8);
		$description=substr($_,20,58);
		$omgmodule=substr($_,78,58);
		$omginterface=substr($_,136,31);
		$omgoperation=substr($_,167,31);
		$transid=substr($_,198,4);
		$rv=$insert{requestmodel}->execute($requestmodel,$rdogroup,$description,$omgmodule,$omginterface,$omgoperation,$transid);
		if (! defined($rv)) {
			$dbh->rollback;
			$dbh->disconnect;
			die $dbh->errstr;
		}
		$inserts{"requestmodel"}++;
		next;
	}

	if ($rectype eq 'SESS') {
		$sessions=substr($_,4,8);
		$rdogroup=substr($_,12,8);
		$description=substr($_,20,58);
		$connection=substr($_,78,4);
		$sessname=substr($_,82,4);
		$netnameq=substr($_,86,8);
		$modename=substr($_,94,8);
		$protocol=substr($_,102,4);
		$maximum=substr($_,106,7);
		$receivepfx=substr($_,113,2);
		$receivecount=substr($_,115,3);
		$sendpfx=substr($_,118,2);
		$sendcount=substr($_,120,3);
		$sendsize=substr($_,123,5);
		$receivesize=substr($_,128,5);
		$sesspriority=substr($_,133,3);
		$userid=substr($_,136,8);
		$autoconnect=substr($_,144,3);
		$buildchain=substr($_,147,3);
		$userarealen=substr($_,150,3);
		$ioarealen=substr($_,153,11);
		$relreq=substr($_,164,3);
		$discreq=substr($_,167,3);
		$nepclass=substr($_,170,3);
		$recovoption=substr($_,173,11);
		$rv=$insert{sessions}->execute($sessions,$rdogroup,$description,$connection,$sessname,$netnameq,$modename,$protocol,$maximum,$receivepfx,$receivecount,$sendpfx,$sendcount,$sendsize,$receivesize,$sesspriority,$userid,$autoconnect,$buildchain,$userarealen,$ioarealen,$relreq,$discreq,$nepclass,$recovoption);
		if (! defined($rv)) {
			$dbh->rollback;
			$dbh->disconnect;
			die $dbh->errstr;
		}
		$inserts{"sessions"}++;
		next;
	}

	if ($rectype eq 'TCPI') {
		$tcpipservice=substr($_,4,8);
		$rdogroup=substr($_,12,8);
		$description=substr($_,20,58);
		$urm=substr($_,78,8);
		$portnumber=substr($_,86,5);
		$certificate=substr($_,91,56);
		$status=substr($_,147,6);
		$ssl=substr($_,153,10);
		$authenticate=substr($_,163,12);
		$transaction=substr($_,175,4);
		$backlog=substr($_,179,5);
		$tsqprefix=substr($_,184,6);
		$ipaddress=substr($_,190,15);
		$socketclose=substr($_,205,6);
		$rv=$insert{tcpipservice}->execute($tcpipservice,$rdogroup,$description,$urm,$portnumber,$certificate,$status,$ssl,$authenticate,$transaction,$backlog,$tsqprefix,$ipaddress,$socketclose);
		if (! defined($rv)) {
			$dbh->rollback;
			$dbh->disconnect;
			die $dbh->errstr;
		}
		$inserts{"tcpipservice"}++;
		next;
	}

	if ($rectype eq 'TDQU') {
		$tdqueue=substr($_,4,4);
		$rdogroup=substr($_,12,8);
		$description=substr($_,20,58);
		$type=substr($_,78,8);
		$databuffers=substr($_,86,3);
		$ddname=substr($_,89,8);
		$dsname=substr($_,97,44);
		$sysoutclass=substr($_,141,1);
		$erroroption=substr($_,142,6);
		$opentime=substr($_,148,8);
		$rewind=substr($_,156,6);
		$typefile=substr($_,162,6);
		$recordsize=substr($_,168,5);
		$blocksize=substr($_,173,5);
		$recordformat=substr($_,178,8);
		$blockformat=substr($_,186,9);
		$printcontrol=substr($_,195,1);
		$disposition=substr($_,196,3);
		$atifacility=substr($_,199,8);
		$recovstatus=substr($_,207,8);
		$facilityid=substr($_,215,4);
		$transid=substr($_,219,4);
		$triggerlevel=substr($_,223,5);
		$userid=substr($_,228,8);
		$wait=substr($_,236,3);
		$waitaction=substr($_,239,6);
		$indirectname=substr($_,245,4);
		$remotename=substr($_,249,4);
		$remotesystem=substr($_,253,4);
		$remotelength=substr($_,257,5);
		$rv=$insert{tdqueue}->execute($tdqueue,$rdogroup,$description,$type,$databuffers,$ddname,$dsname,$sysoutclass,$erroroption,$opentime,$rewind,$typefile,$recordsize,$blocksize,$recordformat,$blockformat,$printcontrol,$disposition,$atifacility,$recovstatus,$facilityid,$transid,$triggerlevel,$userid,$wait,$waitaction,$indirectname,$remotename,$remotesystem,$remotelength);
		if (! defined($rv)) {
			$dbh->rollback;
			$dbh->disconnect;
			die $dbh->errstr;
		}
		$inserts{"tdqueue"}++;
		next;
	}

	if ($rectype eq 'TERM') {
		$terminal=substr($_,4,4);
		$rdogroup=substr($_,12,8);
		$description=substr($_,20,58);
		$autinstmodel=substr($_,78,4);
		$autinstname=substr($_,82,8);
		$typeterm=substr($_,90,8);
		$netname=substr($_,98,8);
		$console=substr($_,106,3);
		$consname=substr($_,109,8);
		$remotesystem=substr($_,117,4);
		$remotename=substr($_,121,4);
		$remotesysnet=substr($_,125,8);
		$modename=substr($_,133,8);
		$printer=substr($_,141,4);
		$printercopy=substr($_,145,3);
		$altprinter=substr($_,148,4);
		$altprintcopy=substr($_,152,3);
		$pool=substr($_,155,8);
		$tasklimit=substr($_,163,5);
		$userid=substr($_,168,8);
		$natlang=substr($_,176,1);
		$transaction=substr($_,177,4);
		$termpriority=substr($_,181,3);
		$inservice=substr($_,184,3);
		$securityname=substr($_,187,8);
		$attachsec=substr($_,195,10);
		$bindsecurity=substr($_,205,3);
		$usedfltuser=substr($_,208,3);
		$rv=$insert{terminal}->execute($terminal,$rdogroup,$description,$autinstmodel,$autinstname,$typeterm,$netname,$console,$consname,$remotesystem,$remotename,$remotesysnet,$modename,$printer,$printercopy,$altprinter,$altprintcopy,$pool,$tasklimit,$userid,$natlang,$transaction,$termpriority,$inservice,$securityname,$attachsec,$bindsecurity,$usedfltuser);
		if (! defined($rv)) {
			$dbh->rollback;
			$dbh->disconnect;
			die $dbh->errstr;
		}
		$inserts{"terminal"}++;
		next;
	}

	if ($rectype eq 'TRCL') {
		$tranclass=substr($_,4,8);
		$rdogroup=substr($_,12,8);
		$description=substr($_,20,58);
		$maxactive=substr($_,78,3);
		$purgethresh=substr($_,81,7);
		$rv=$insert{tranclass}->execute($tranclass,$rdogroup,$description,$maxactive,$purgethresh);
		if (! defined($rv)) {
			$dbh->rollback;
			$dbh->disconnect;
			die $dbh->errstr;
		}
		$inserts{"tranclass"}++;
		next;
	}

	if ($rectype eq 'TRAN') {
		$transaction=substr($_,4,4);
		$rdogroup=substr($_,12,8);
		$description=substr($_,20,58);
		$program=substr($_,78,8);
		$twasize=substr($_,86,5);
		$profile=substr($_,91,8);
		$partitionset=substr($_,99,8);
		$status=substr($_,107,8);
		$taskdataloc=substr($_,115,5);
		$taskdatakey=substr($_,120,4);
		$storageclear=substr($_,124,3);
		$runaway=substr($_,127,7);
		$shutdown=substr($_,134,8);
		$isolate=substr($_,142,3);
		$brexit=substr($_,145,8);
		$dynamic=substr($_,153,3);
		$routable=substr($_,156,3);
		$remotesystem=substr($_,159,4);
		$remotename=substr($_,163,8);
		$trprof=substr($_,171,8);
		$localq=substr($_,179,3);
		$priority=substr($_,182,3);
		$tranclass=substr($_,185,8);
		$alias=substr($_,193,4);
		$taskreq=substr($_,197,4);
		$xtranid=substr($_,201,8);
		$tpname=substr($_,209,64);
		$xtpname=substr($_,273,128);
		$dtimout=substr($_,401,4);
		$restart=substr($_,405,3);
		$spurge=substr($_,408,3);
		$tpurge=substr($_,411,3);
		$dump=substr($_,414,3);
		$trace=substr($_,417,3);
		$confdata=substr($_,420,3);
		$action=substr($_,423,7);
		$wait=substr($_,430,3);
		$waittime=substr($_,433,8);
		$ressec=substr($_,441,3);
		$cmdsec=substr($_,444,3);
		$rv=$insert{transaction}->execute($transaction,$rdogroup,$description,$program,$twasize,$profile,$partitionset,$status,$taskdataloc,$taskdatakey,$storageclear,$runaway,$shutdown,$isolate,$brexit,$dynamic,$routable,$remotesystem,$remotename,$trprof,$localq,$priority,$tranclass,$alias,$taskreq,$xtranid,$tpname,$xtpname,$dtimout,$restart,$spurge,$tpurge,$dump,$trace,$confdata,$action,$wait,$waittime,$ressec,$cmdsec);
		if (! defined($rv)) {
			$dbh->rollback;
			$dbh->disconnect;
			die $dbh->errstr;
		}
		$inserts{"transaction"}++;
		next;
	}

	if ($rectype eq 'TSMO') {
		$tsmodel=substr($_,4,8);
		$rdogroup=substr($_,12,8);
		$description=substr($_,20,58);
		$prefix=substr($_,78,16);
		$xprefix=substr($_,94,32);
		$location=substr($_,126,9);
		$recovery=substr($_,135,3);
		$security=substr($_,138,3);
		$poolname=substr($_,141,8);
		$remotesystem=substr($_,149,4);
		$remoteprefix=substr($_,153,16);
		$xremotepfx=substr($_,169,32);
		$rv=$insert{tsmodel}->execute($tsmodel,$rdogroup,$description,$prefix,$xprefix,$location,$recovery,$security,$poolname,$remotesystem,$remoteprefix,$xremotepfx);
		if (! defined($rv)) {
			$dbh->rollback;
			$dbh->disconnect;
			die $dbh->errstr;
		}
		$inserts{"tsmodel"}++;
		next;
	}

	if ($rectype eq 'TYPE') {
		$typeterm=substr($_,4,8);
		$rdogroup=substr($_,12,8);
		$description=substr($_,20,58);
		$device=substr($_,78,8);
		$termmodel=substr($_,86,1);
		$sessiontype=substr($_,87,8);
		$ldclist=substr($_,95,8);
		$shippable=substr($_,103,3);
		$pagesize=substr($_,106,7);
		$altpage=substr($_,113,7);
		$altsuffix=substr($_,120,1);
		$fmhparm=substr($_,121,3);
		$oboperid=substr($_,124,3);
		$autopage=substr($_,127,3);
		$defscreen=substr($_,130,7);
		$altscreen=substr($_,137,7);
		$aplkybd=substr($_,144,3);
		$apltext=substr($_,147,3);
		$audiblealarm=substr($_,150,3);
		$color=substr($_,153,3);
		$copy=substr($_,156,3);
		$dualcasekybd=substr($_,159,3);
		$extendedds=substr($_,162,3);
		$hilight=substr($_,165,3);
		$katakana=substr($_,168,3);
		$lightpen=substr($_,171,3);
		$msrcontrol=substr($_,174,3);
		$obformat=substr($_,177,3);
		$partitions=substr($_,180,3);
		$printadapter=substr($_,183,3);
		$progsymbols=substr($_,186,3);
		$validation=substr($_,189,3);
		$formfeed=substr($_,192,3);
		$horizform=substr($_,195,3);
		$verticalform=substr($_,198,3);
		$textkybd=substr($_,201,3);
		$textprint=substr($_,204,3);
		$query=substr($_,207,4);
		$outline=substr($_,211,3);
		$sosi=substr($_,214,3);
		$backtrans=substr($_,217,3);
		$cgcsgid=substr($_,220,11);
		$ascii=substr($_,231,2);
		$sendsize=substr($_,233,5);
		$receivesize=substr($_,238,5);
		$bracket=substr($_,243,3);
		$logmode=substr($_,246,8);
		$errlastline=substr($_,254,3);
		$errintensify=substr($_,257,3);
		$errcolor=substr($_,260,9);
		$errhilight=substr($_,269,9);
		$autoconnect=substr($_,278,3);
		$ati=substr($_,281,3);
		$tti=substr($_,284,3);
		$createsess=substr($_,287,3);
		$relreq=substr($_,290,3);
		$discreq=substr($_,293,3);
		$nepclass=substr($_,296,3);
		$signoff=substr($_,299,6);
		$xrfsignoff=substr($_,305,7);
		$routedmsgs=substr($_,312,8);
		$logonmsg=substr($_,320,3);
		$buildchain=substr($_,323,3);
		$userarealen=substr($_,326,3);
		$ioarealen=substr($_,329,11);
		$uctran=substr($_,340,6);
		$recovoption=substr($_,346,11);
		$recovnotify=substr($_,357,11);
		$rv=$insert{typeterm}->execute($typeterm,$rdogroup,$description,$device,$termmodel,$sessiontype,$ldclist,$shippable,$pagesize,$altpage,$altsuffix,$fmhparm,$oboperid,$autopage,$defscreen,$altscreen,$aplkybd,$apltext,$audiblealarm,$color,$copy,$dualcasekybd,$extendedds,$hilight,$katakana,$lightpen,$msrcontrol,$obformat,$partitions,$printadapter,$progsymbols,$validation,$formfeed,$horizform,$verticalform,$textkybd,$textprint,$query,$outline,$sosi,$backtrans,$cgcsgid,$ascii,$sendsize,$receivesize,$bracket,$logmode,$errlastline,$errintensify,$errcolor,$errhilight,$autoconnect,$ati,$tti,$createsess,$relreq,$discreq,$nepclass,$signoff,$xrfsignoff,$routedmsgs,$logonmsg,$buildchain,$userarealen,$ioarealen,$uctran,$recovoption,$recovnotify);
		if (! defined($rv)) {
			$dbh->rollback;
			$dbh->disconnect;
			die $dbh->errstr;
		}
		$inserts{"typeterm"}++;
		next;
	}

}
$dbh->commit;
$dbh->disconnect;
