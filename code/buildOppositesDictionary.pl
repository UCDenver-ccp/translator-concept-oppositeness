#!/usr/bin/perl

# purpose: take a bunch of words, e.g. the set of all terms in ontology and their synonyms.  Generate a map from each word to all of its possible opposites.

# You can later use that to process an ontology and put together the opposite of each term based on looking up the opposites of its words.

# expected input format:
# do I need an identifier? I don't think so.
# do I need to know whether something is a term or a synonym? I don't think so.
# POS tags WOULD be nice...


use strict 'vars';

my $DEBUG = 1;

# the entire term, so it could be arbitrarily long
my $original_term = "";

# any term will contain at least one of these
my $word_in_term = "";

# POS: metadata about a word in a term

# might be different ones for nouns, verbs, etc.
my @prefixes = ("de", "un", "a", "in");

# words can have multiple opposites, so a word needs to map to a list
my %dictionary = ("live" => "dead",
                  "high" => "low");

while (my $line = <>) {
  chomp($line); # remove newline
  $DEBUG && print "$line\n";
  my $term = $line;
  #my @antonyms = addPrefixes($term);
  handleTerm($term);
  #$DEBUG && print @antonyms;
} # close while-loop through input

# terms can be made up of multiple words, and need some analysis before those words get dealt with
sub handleTerm {
  my ($term) = @_;
  $DEBUG && print "Input to handleTerm(): <$term>\n";
  my @words = split(" ", $term); # this could benefit from shallow parsing, from POS tagging, from all kindsa stuff...
  foreach my $word (@words) {
    # first check to see if it's already in the dictionary, in which case no need to deal with it further
    if ($dictionary{$word}) { next; }
    addPrefixes($word);
    
  }
} # close subroutine definition handleTerm()


# if a word ALREADY starts with a negative morpheme, then we should (a) remove the negative to get to the base morpheme, and then (b) make sure that we have or generate all of the OTHER potential opposites of that base.  So, if you get "demethylated", you want to make sure that you end up with "methylated" and "unmethylated", too.
sub ifWordStartsWithNegativePrefix {
  my ($word) = @_;
  $DEBUG && print "Input to ifWordStartsEtc.(): <$word>\n";
  return(0);  
} # close subroutine definition ifWordStartsWithNegativePrefix()

# if the word already starts with a negative morpheme, let's skip it.  Note that this is probably the most complicated part of the whole process!
sub doesNotStartWithNegativePrefix {
  my ($word) = @_;
  $DEBUG && print "Word input to check for negative prefix: <$word>\n";
  return(1);
} # close subroutine definition doesNotStartWithNegativePrefix()

# takes a single word as input, returns an array of single words
sub addPrefixes {
  my ($word) = @_;
  $DEBUG && print "Input to addPrefixes(): <$word>\n";  
  my @output = ();
  foreach my $prefix (@prefixes) {
    my $new_word = $prefix . $word;
    $DEBUG && print "$new_word\n";
    push (@output, $new_word);
    # you could do this without the temporary variables, but frankly, it's REALLY complicated
    
    # 1. see if the word is already in the dictionary, and if it is...skip it, I guess
    # ...OK, did this in the handleTerm() subroutine
    # 2. otherwise, generate an array of all possible antonyms of that word
    # 3. store that array
 
  }
  #return(@output);
  $dictionary{$word} = @output; # now that word points to an array of opposites 
} # close subroutine definition addPrefixes()

sub fixLatinateMorphology {
  my $input = @_;
  my $output = $input;
  $output =~ s/^inr/irr/o;
  $output =~ s/^inl/ill/o;
  return($output); 
} # close function definition fixLatinateMorphology()
