#!/usr/bin/perl

# ASSUMPTION: for now, we only handle terms of one word in length
# Now adding multi-word terms

# QUESTION: what file type does this need as input??
# let's assume a .obo file, although that doesn't seem to be what I originally wrote this for...

# TODO: need test data files
# TEST CASES:
# - ambiguous prefix, is negative, opposite exists (cancerous, noncancerous) (anion, ion, cation) (this is actually multiple opposites, I think)
# - ambiguous affix, is negative, no opposite exists
# - ambiguous, false opposite (none, one)
# - nonambiguous prefix 
# - nonambiguous prefix, other word with shared substring but different prefix exists (fan, ban)
# - nonambiguous prefix, other word with shared substring minus prefix exists (fan, an)
# - lexicalized (malignant, benign)
# - multi-word: prefixal, adjectival, nominal, verbal...
# - opposite of term is a term
# - opposite of term is in a synonym
# - opposite of synonym is in a synonym
# - preceding, with different kinds of synonyms (exact, etc.)
# - word is in list of known negative words from Cohen et al. 2017
# - word is in list of known non-negative words from Cohen et al. 2017
# - word is in WordNet
# - word is not in WordNet

# catch typos (haha)
use strict 'vars';

# set to 1 for debugging output, to 0 to suppress same
#my $DEBUG = 0;
my $DEBUG = 1;

# set this to 1 if you're producing output for manual annotation. otherwise, set to 0
my $ANNOTATION_TRAINING = 0;

# used for drawing random samples from a list of distractors/quality control pairs
use List::Util 'shuffle';
srand(1789); # i hate not setting a seed; this is good for develpment, of course, but to actually use it for multiple annotators, you need a different set of quality control pairs every time--or just use the same one for everyone??

my %gene_ontology_terms = ();
my %uniquePairs = ();

my $infile = pop(@ARGV);

open (IN, $infile) || die "Couldn't open infile: $!\n";

# for parsing terms
my $id = undef;
my $term = undef;

while (my $line = <IN>) {
	# here we're assuming a single word only--TODO

        # do I want to declare the ontology's identifier prefix?
        # note that regarding PR, it might not be worth looking. I tried grepping for names that include "mutant" or "mutated", and only found 11...
        if ($line =~ /^id:\s+((GO|CL|UBERON|NCBITaxon|IntAct:EBI-|MI|MOD|NCBIGene|OGMS|OMIM|PR|ReTO|SIO|UniProt|HP):\d+)$/o) { $id = $1; }
        #if ($line =~ /^id:\s+(CL:\d+)$/) { $id = $1; $DEBUG && print "ID: $id\n"; }
	#my $id = $1;
        #if ($line =~ /^id:\s+(UBERON:\d+)$/) {$id = $1; $DEBUG && print "ID: $id\n"; }
        # if ($line =~ /^id:\s+(NCBITaxon:\d+)$/) {$id = $1; $DEBUG && print "ID: $id\n"; }
        #if ($line =~ /^name:\s+(.*)$/) { $term = $1; } # does greediness work as I hope here, or will I end up with leading whitespace?
	# in some .obo files, I'm seeing "term", while it's "name" in others... 
        
        if ($line =~ /^(name|term):\s+(.*)$/) { $term = $2; $DEBUG && print "term: $term\n"; } # does greediness work as I hope here, or will I end up with leading whitespace? 
        #my $term = $2;
        
        if ($id && $term)  {
          $gene_ontology_terms{$term} = 1;
          $DEBUG && print "Just read in $id $term\n";
          undef($id); undef($term); 
        }
}

########### define the things that indicate antonymy/oppositeness #############
my @negative_affixes = ("de", "non", "non-", "no", "anti", "un", "in", "dys", "dis", "a", "an", "in", "im", "ir", "il", );


my %opposites = ("fast" => "slow",
	         "slow" => "fast",
                 "high" => "low",
                 "low" => "high",
                 "positive" => "negative",
                 "negative" => "positive",
                 "positively" => "negatively",
                 "negatively" => "positively",
                 "early" => "late",
                 "dorsal" => "ventral", 
                 "increase" => "decrease",
                 "mutant" => "wild type",
                 "mutant" => "wild-type",
                 "primary" => "secondary",
                 "secondary" => "tertiary",
                 "tertiary" => "quaternary",
                 "hyper" => "hypo"); # hyper and hypo are tough ones 'cause they're prefixes but my code for these requires word boundaries BUT these aren't negatives, per se.  Solution: a small function for this

###### The ontology has been read in--now look for the opposites ##########


# output some distractors/quality control pairs
if ($ANNOTATION_TRAINING) {
  outputQC();
}

foreach my $term (keys(%gene_ontology_terms)) {


  $DEBUG && print "Looking for antonyms of $term\n";
	
  foreach my $affix (@negative_affixes) {

	my $candidate_antonym = $affix . $term;
        $DEBUG && print "Candidate: $candidate_antonym\n";

   
        # is the candidate in the ontology, too?
        if ($gene_ontology_terms{$candidate_antonym}) {
	  $DEBUG && print "$candidate_antonym is an antonym of $term\n";
          storePair($term, $candidate_antonym); 
	}
  }

  if ((my $candidate_antonym = lexicalizedOpposites($term)) != 0) {
    #print "name:\t$term\n";
    #print "antonym:\t$candidate_antonym\n";
    #printTSV($term, $candidate_antonym);
    storePair($term, $candidate_antonym);
  } 
}

# output the unique pairs only
my @unique_pairs = keys(%uniquePairs);
foreach my $pair (@unique_pairs) {
  printTSV(split("---", $pair));
}

sub twoWordTerms() {
	my ($firstWord, $secondWord) = split($_);

	print "First word: <$firstWord> Second word: <$secondWord>\n";
        # TODO	
} # close function definition twoWordTerms()

# assumption: no more than one opposite to find per term,
# since this returns as soon as one is found
sub lexicalizedOpposites() {

  my $candidate_term = $_;
  $DEBUG &&  print "Input to lexicalizedOpposites(): $candidate_term\n";

  foreach my $opposite (keys(%opposites)) {
    $DEBUG && print "OPPOSITE BEING TESTED: $opposite\n";
    if ($candidate_term =~ /\b$opposite\b/) {
      $candidate_term =~ s/$opposite/$opposites{$opposite}/;
      return $candidate_term;
    }
  } # close foreach loop through opposites

  # you only reach this point if no potential opposites were found
  return 0;
} # close function definition lexicalizedOpposites()

# function to produce output, since I'm currently outputting from more than one place in the code
sub printTSV() {
	my ($term, $antonym) = @_;

        # the leading tab is there to create a column for the manual annotation in a spreadsheet 
        print("\t" . $term . "\t" . $antonym . "\n");
}

# function to produce some distractors/QC pairs
sub outputQC() {

  # create a set of these, some of which definitely are opposites, and some of which definitely aren't
  my %control_pairs = ("alive" => "dead", # OPP
                       "aorta" => "orca",
                       "bubble" => "bubble",
                       "cation" => "anion", # OPP
                       "complex" => "simple",
                       "dephosphorylation" => "phosphorylation", # OPP
                       "ectomorph" => "endomorph", # OPP
                       "extant species" => "extinct species", # OPP
                       "pear" => "wolf",
                       "ontology" => "manuscript",
                       "vertebrate" => "invertebrate", # OPP
                       "dead" => "ad",
                       "union" => "ion",
                       "apple" => "pple");
  # get a random sample of those pairs
  my @keys = keys(%control_pairs);

  # pull n pairs from there
  my $sample_size = 5; # only need this if you want to give multiple annotators each a different set of QC pairs
  # see above for the library that I got shuffle() from
  my @shuffled = shuffle(@keys);
  my @sorted = sort(@keys); # contradicts the previous line, obviously!
  # for when you want less than the whole set...
  #my @sample = @shuffled[0, $sample_size];
  #my @sample = @shuffled; # gives you the whole set
  my @sample = @sorted; # the opposite of the shuffling, obviously!
  $DEBUG && print "random sample:\n\n";
  foreach my $key (@sample) {
    print "\t$key\t$control_pairs{$key}\n";
  }
  $DEBUG && print "end of random sample...\n";
} # close function definition outputQC()

# because antonymy is bidirectional, you end up with duplicates, so I will put them in a hash to avoid that
sub storePair() {
  my @pair = @_;
  my $this_pair = $pair[0] . "---" . $pair[1];
  $uniquePairs{$this_pair}++;
}
