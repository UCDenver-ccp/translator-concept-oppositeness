#!/usr/bin/perl

# function of script: take terms from an ontology as input and generate their opposites. for example, given "phosphorylation" as input, produce "dephosphorylation."

# expected input format:
# 1. identifier, e.g. GO:0001000
# 2. term, of arbitrary length
# 3. Will I need to know at some point whether or not it's a synonym?  What kind of synonym?
# 4. I could probably use POS tags, *if* the quality is reasonable
# Examples:
# GO:001000 methylation
# GO:001000 cell migration
# GO:001000 programmed cell death

use strict 'vars';

my $DEBUG = 1;

# the entire term, so it could be arbitrarily long
my $original_term = "";

# any term will contain at least one of these
my $word_in_term = "";

# POS: metadata about a word in a term

# might be different ones for nouns, verbs, etc.
my @prefixes = ("de", "un", "a", "in");



while (my $line = <>) {
  chomp($line); # remove newline
  $DEBUG && print "$line\n";
  $line =~ /^([^\s]+)\s+\b(.+)/;
  my $identifier = $1;
  my $term = $2;
  my @antonyms = addPrefixes($term);
  $DEBUG && print @antonyms;
} # close while-loop through input

# terms are made up of multiple words, and need some analysis before those words get dealt with
sub handleTerm {
  my ($term) = @_;
  $DEBUG && print "Input to handleTerm(): <$term>\n";
  my @words = split(" ", $term); # this could benefit from shallow parsing, from POS tagging, from all kindsa stuff...
  foreach my $word (@words) {
    if (doesNotStartWithNegativePrefix($word)) {
      my @new_words = addPrefixes($word); # MAN--YOU COULD DO THIS JUST ONCE FOR EVERY WORD IN ALL TERMS, HASH THE OUTPUTS, AND THEN ASSEMBLE ALL OF THE OPPOSITES FROM THIS WORD -> OPPOSITE DICTIONARY!!!!!
    }
  }
} # close subroutine definition handleTerm()

# if the word already starts with a negative morpheme, let's skip it.  Note that this is probably the most complicated part of the whole process!
sub doesNotStartWithNegativePrefix {
  my ($word) = @_;
  $DEBUG && print "Word input to check for negative prefix: <$word>\n";
  return(1);
} # close subroutine definition doesNotStartWithNegativePrefix()

# takes a single word as input, returns an array of single words
sub addPrefixes {
  my ($input) = @_;
  $DEBUG && print "Input to addPrefixes(): <$input>\n";  
  my @output = ();
  foreach my $prefix (@prefixes) {
    my $new_word = $prefix . $input;
    $DEBUG && print "$new_word\n";
    push (@output, $new_word);
  }
  return(@output);
} # close subroutine definition addPrefixes()

sub fixLatinateMorphology {
  my $input = @_;
  my $output = $input;
  $output =~ s/^inr/irr/o;
  $output =~ s/^inl/ill/o;
  return($output); 
} # close function definition fixLatinateMorphology()
