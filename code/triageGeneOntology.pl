#!/usr/bin/perl

# PURPOSE: Given a Gene Ontology .obo file as input, produce three files containing the three subontologies Molecular Function, Biological Process, and Cell Component

# usage: 1. Modify global variable to determine which subontology gets output 2. cat the .obo file and pipe it to this script

use strict 'vars';
my $DEBUG = 0; # set to 1 for debugging output, to 0 to suppress same

# this is used to check against the namespace value and determine whether or not a term should be output
#my $ontology = "namespace: molecular_function";
#my $ontology = "namespace: biological_process";
my $ontology = "namespace: cellular_component";
$DEBUG && print "LOOKING FOR: <$ontology>\n";

# these are the variables that hold the information that you need
my $term = "";
my $id = "";
my $synonym = ""; # not currently using
my $namespace = ""; # this identifies the subontology

# READ IN FILE
while (my $line = <>) {
    chomp($line); # remove newline to facilitate comparisons later

    if ($line =~ /^name:/o) {  $term = $line; $DEBUG && print "NAME: <$term>\n";} # o switch optimizes the regex
    if ($line =~ /^id:/o) {  $id = $line; $DEBUG && print "ID: <$id>\n"; }
    if ($line =~ /^namespace:/o) {  $namespace = $line; $DEBUG && print "NAMESPACE: <$namespace>\n"; }
	
    # if you have found a term, an id, and a namespace, then if the namespace corresponds to the ontology that you're interested in, you can output everything
    if ($term && $id && $namespace) {
      if ($namespace eq $ontology) {
        outputConcept($term, $id, $namespace);
        # reset values
        undef($term);
        undef($id);
        undef($namespace);
      }
    }
} # close loop through input

# PRODUCE OUTPUT
sub outputConcept() {

  my ($term, $id, $namespace) = @_;
  print "$term\n";
  print "$id\n";
  print "$namespace\n";
  print "\n"; # a blank line between concepts to be considerate!  
}

