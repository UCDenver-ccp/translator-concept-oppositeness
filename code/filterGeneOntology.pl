#!/usr/bin/perl

use strict 'vars';

my $infile_name = pop(@ARGV);

open (IN, $infile_name) || die "Couldn't open infile $infile_name: $!\n";

my $id;
my $term;

while (my $line = <IN>) {

	
	
	if ($line =~ /^id:\s+(GO.+)$/) {
	  $id = $1;	  
	}
        # accidental discovery: the commented-out regex only gets the first word, which might not be a bad heuristic for multi-word terms!  try the last word, too, and you'll probably get something relevant for negating...
	#if ($line =~ /^name:\s+(\S+)$/) {
	if ($line =~ /^name:\s+([A-Za-z].*)$/) {
	  $term = $1;
	} 

	if ($line =~ /^synonym:\s+\"([^"]+)\"/) {
	  $term = $1;
	  print "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\n";
	}
        if ($term =~ / /) {
	  next; # means that it's more than one word long--see assumption above
	}
	print "$id\t$term\n";
}
