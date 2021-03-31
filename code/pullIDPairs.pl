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

# you need to be able to sort the entire set of pairs
# for reproducibility and testing purposes--do that with
# a hash. Oh, and this will also get rid of any duplicates
# that you happen to get passed by anyone else
my %all_pairs = ();

while (my $line = <>) {
  chomp($line);
  $DEBUG && print "input: $line\n";

  my ($term01, $id01, $term02, $id02) = split("\t", $line);
  $DEBUG && print "id01: $id01 id02: $id02\n";

  # preprocessing that's necessary for some sources of antonym pairs 
  $id01 = removeURL($id01);
  $id02 = removeURL($id02);

  my @for_sorting = ($id01, $id02);
  my @sorted = sort(@for_sorting);
  my $sorted_pair = $sorted[0] . "\t" . $sorted[1];
  $DEBUG && print "$sorted_pair\n";
  $all_pairs{$sorted_pair}++;

} # close while-loop through input

########### PRODUCE OUTPUT #################
my @sorted_pairs = sort(keys(%all_pairs));
foreach my $pair (@sorted_pairs) {
  print $pair . "\n";
}

# sometimes you get pairs from other sources that have URLs, and those
# need to be removed since my findAntonyms.pl script does not output them
sub removeURL() {
 my $input = $_[0];
 $DEBUG && print "Input to removeURL(): <$input>\n";

 my $output = $input; # I don't hate temp variables, HSQMYP
 #$output =~ s/[A-Z]+[:_]\d+$//;
 $output =~ s/.+[^A-Z]([A-Z]+[:_]\d+)$/$1/;

 $DEBUG && print "Returning from removeURL(): <$output>\n";
 return $output;
} # close function definition removeURL()
