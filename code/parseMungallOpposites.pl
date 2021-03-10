#!/usr/bin/perl

# Purpose: parse the files from Chris Mungall's project that contain opposing concepts.

# Data obtained from: https://github.com/drseb/phenopposites/tree/master/opposites
# format: 2 header files, then:
# identifier01 identifier02 t/f t/f

use strict 'vars';

#my $file = "/Users/kevincohen/Dropbox/N-Z/translator/concept-oppositeness/resources/antonyms_hp.txt";
my $file = "/Users/kevincohen/Dropbox/N-Z/translator-concept-oppositeness/resources/antonyms_hp.txt";

open (IN, $file) || die "Couldn't open input file: $!\n";

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
  #if ($logical eq "t" && $textual eq "t") { print "$concept01\t$concept02\n";}  
  # evidence from LOGICAL DEFINITION ONLY
  if ($logical eq "t" && $textual eq "f") { print "$concept01\t$concept02\n"; }
  # evidence from TERMS ONLY
  # if ($logical eq "f" && $textual eq "t") { print "$concept01\t$concept02\n"; }
  # evidence from EITHER ON
  #if ($logical eq "t" || $textual eq "t") { print "$concept01\t$concept02\n"; }  
  # Catch errors--this should never happen
  #if ($logical eq "f" && $textual eq "f") { print "Something's wrong: these concepts have no evidence for opposition. $line\n"; }

}
