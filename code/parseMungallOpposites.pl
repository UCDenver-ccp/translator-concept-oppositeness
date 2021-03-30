#!/usr/bin/perl

# Purpose: parse the files from Chris Mungall's project that contain opposing concepts.
# current version takes the full input and outputs from that *only* the pairs of IDs

# Data obtained from: https://github.com/drseb/phenopposites/tree/master/opposites
# format: 2 header files, then:
# identifier01 identifier02 t/f t/f

use strict 'vars';

#my $file = "/Users/kevincohen/Dropbox/N-Z/translator/concept-oppositeness/resources/antonyms_hp.txt";
my $file = "/Users/kevincohen/Dropbox/N-Z/translator-concept-oppositeness/resources/antonyms_hp.txt";

open (IN, $file) || die "Couldn't open input file: $!\n";

# count how many came from which kind(s) of evidence (textual, logical, or both)
my %evidence_counts = ("TEXTUAL" => 0,
                       "LOGICAL" => 0,
                       "BOTH_TEXTUAL_AND_LOGICAL" => 0);


# specify whether you want to output pairs that he found from text *only*, from logical 
# definitions *only*, or from both *only*

my $TEXTUAL_EVIDENCE = 0;
my $LOGICAL_EVIDENCE = 0;
my $BOTH_TEXTUAL_AND_LOGICAL = 1;
# weird syntax to read the first two lines of the file...
my $version = <IN>;
my $header = <IN>;

while (my $line = <IN>) {
  0 && print $line;
  my ($concept01, $concept02, $logical, $textual) = split(" ", $line);
  #print $concept01;
  #print $concept02;  
  #print $logical;
  #print $textual;
  
  # IF YOU WANT ONLY OPPOSITES THAT CHRIS GOT FROM LOGICAL OR FROM TEXTUAL EVIDENCE,
  # YOU CAN SPECIFY THAT HERE
  # evidence from BOTH
  if ($logical eq "t" && $textual eq "t") { 
        $evidence_counts{"BOTH_TEXTUAL_AND_LOGICAL"}++;
        1 && print "both: $line";
	#print "$concept01\t$concept02\n";
  }  
  # evidence from LOGICAL DEFINITION ONLY
  if ($logical eq "t" && $textual eq "f") {
 	$evidence_counts{"LOGICAL"}++;
        1 && print "logical only: $line"; 
	#print "$concept01\t$concept02\n"; 
  }
  # evidence from TERMS ONLY
  if ($logical eq "f" && $textual eq "t") { 
	$evidence_counts{"TEXTUAL"}++;
	#print "$concept01\t$concept02\n"; 
  }
  # evidence from EITHER ONE
  #if ($logical eq "t" || $textual eq "t") { print "$concept01\t$concept02\n"; }  
  # Catch errors--this should never happen
  if ($logical eq "f" && $textual eq "f") { 
	print "Something's wrong: these concepts have no evidence for opposition. $line\n"; 
	$evidence_counts{"PROBLEM!"}++;

  }
}

# report counts
foreach my $evidence_type (keys(%evidence_counts)) {
	print "$evidence_type: $evidence_counts{$evidence_type} pairs\n";
}
