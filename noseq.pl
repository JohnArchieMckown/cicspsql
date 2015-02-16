#!/usr/bin/perl
use strict;
use warnings;
while (<>) {
	chomp;
	s/^(.{1,72}).*$/$1/;
	s/^(.*?) *$/$1/;
	print $_,"\n";
}
