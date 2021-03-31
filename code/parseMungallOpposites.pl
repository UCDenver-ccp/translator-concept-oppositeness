#!/usr/bin/perl

# Purpose: parse the files from Chris Mungall's project that contain opposing concepts.
# current version takes the full input and outputs from that *only* the pairs of IDs

# Data obtained from: https://github.com/drseb/phenopposites/tree/master/opposites
# format: 2 header files, then:
# identifier01 identifier02 t/f t/f

use strict 'vars';

# must seed the random number generator, because I use hashes--
# otherwise, testing/reproduction is impossible.
srand(1789); # extra points if you recognize the year 

############### SET/INITIALIZE THE GLOBAL VARIABLES #####################
# set to 1 for helpful debugging output, to 0 to suppress same
my $DEBUG = 0;

my $TEST_RUN = 0; # if set to 1, this makes you run on the test data and suppresses all output except the pairs of opposites--no counts or other
# validation data are returned at the end if it's a test run.

my $file = "";

  if ($TEST_RUN) {
    $file = "testParseMungallOpposites.tsv";
  } else {
    # could read this off of the command line, but right now I only have one file, so let's just hard-code it
    $file = "/Users/kevincohen/Dropbox/N-Z/translator-concept-oppositeness/resources/antonyms_hp.txt";
  }

open (IN, $file) || die "Couldn't open input file: $!\n";

# count how many came from which kind(s) of evidence (textual, logical, or both)
my %evidence_counts = ("TEXTUAL" => 0,
                       "LOGICAL" => 0,
                       "BOTH_TEXTUAL_AND_LOGICAL" => 0);


# specify whether you want to output pairs that he found from text *only*, from logical 
# definitions *only*, or from both *only*.  Note that these variables control only what gets *output*,
# not what gets *counted.*
# TODO: if you get energetic, validate by summing these three variables. If the sum is anything other than 1, 
# you either have set more than one of them to TRUE, or none of them to TRUE, and neither of those situations
# is likely to be what you wanted.
my $TEXTUAL_EVIDENCE = 0;
my $LOGICAL_EVIDENCE = 0;
my $BOTH_TEXTUAL_AND_LOGICAL = 1;

# rather than printing the pairs of opposites as I come across them, as I was doing,
# I need to sort them--otherwise testing becomes impossible. So:
# store them, then sort them when you're all done.
my %stored_pairs = ();

########### PROCESSING STARTS HERE #####################

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
  
  # your pairs always have to be sorted in alphanumeric order--might as
  # well do that now
  ($concept01, $concept02) = sort($concept01, $concept02); # if this works, I'll be pretty pleased with myself
  # make a string that will print the way you want it to 
  my $output = $concept01 . "\t" . $concept02;

  # IF YOU WANT ONLY OPPOSITES THAT CHRIS GOT FROM LOGICAL OR FROM TEXTUAL EVIDENCE,
  # YOU CAN SPECIFY THAT HERE
  # evidence from BOTH
  if ($logical eq "t" && $textual eq "t") { 
        $evidence_counts{"BOTH_TEXTUAL_AND_LOGICAL"}++;
        $DEBUG && print "from both: $line";
	if ($BOTH_TEXTUAL_AND_LOGICAL) { 
          $DEBUG && print "STORING $concept01\t$concept02\n";
          $stored_pairs{$output}++;
        }
  }  
  # evidence from LOGICAL DEFINITION ONLY
  if ($logical eq "t" && $textual eq "f") {
 	$evidence_counts{"LOGICAL"}++;
        $DEBUG && print "logical only: $line";
        if ($LOGICAL_EVIDENCE) { 
	  $DEBUG && print "STORING $concept01\t$concept02\n";
          $stored_pairs{$output}++; 
        }
  }
  # evidence from TERMS ONLY
  if ($logical eq "f" && $textual eq "t") { 
	$evidence_counts{"TEXTUAL"}++;
        $DEBUG && print "textual only: $line";
        if ($TEXTUAL_EVIDENCE) {
	  $DEBUG && print "STORING $concept01\t$concept02\n";
          $stored_pairs{$output}++;
        } 
  }
  # evidence from EITHER ONE
  if ($logical eq "t" || $textual eq "t") { 

       #print "$concept01\t$concept02\n"; 
       $DEBUG && print "from either: $line";
       # don't necessarily have a use case for this one,
       # so I'm not storing the pair
  }  
  # Catch errors--this should never happen
  if ($logical eq "f" && $textual eq "f") { 
	print "Something's wrong: these concepts have no evidence for opposition. $line\n"; 
	$evidence_counts{"PROBLEM!"}++;

  }
} # while-loop through input file

############# PRODUCE THE OUTPUT ##################

my @sorted_pairs = sort(keys(%stored_pairs));
foreach my $sorted_pair (@sorted_pairs) {
  print $sorted_pair . "\n";
}

# report the counts of each type of evidence
unless ($TEST_RUN) {
  foreach my $evidence_type (keys(%evidence_counts)) {
    print "$evidence_type: $evidence_counts{$evidence_type} pairs\n";
  }  
}
