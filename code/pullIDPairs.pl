#!/usr/bin/perl

# input: a file containing the term01 id01 term02 id02 format
# that my antonym-finding code outputs

# output: just the pair of IDs, with the IDs in a pair sorted and the entire set of pairs sorted

# usage:
# cat inputFileName.tsv | ./pullIDPairs.pl

# test data: testData/testPullIDPairs.input.tsv
#            testData/testPullIDPairs.gold.output.tsv

use strict 'vars';

my $DEBUG = 0;

while (my $line = <>) {
  chomp($line);
  $DEBUG && print "input: $line\n";

  my ($term01, $id01, $term02, $id02) = split("\t", $line);
  $DEBUG && print "id01: $id01 id02: $id02\n";
  my @for_sorting = ($id01, $id02);
  my @sorted = sort(@for_sorting);
  my $sorted_pair = $sorted[0] . "\t" . $sorted[1];
  print "$sorted_pair\n";
} # close while-loop through input

