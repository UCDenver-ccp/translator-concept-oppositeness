#!/usr/bin/perl

# PURPOSE: Given a Gene Ontology .obo file as input, produce three files containing the three subontologies Molecular Function, Biological Process, and Cell Component

# usage: 1. Modify global variable to determine which subontology gets output 2. cat the .obo file and pipe it to this script

use strict 'vars';

# this is used to check against the namespace value and determine whether or not a term should be output
my $ontology = "molecular_function";
my $ontology = "biological_process";
my $ontology = "cell_component";

# these are the variables that hold the information that you need
my $term = "";
my $id = "";
my $synonym = ""; # not currently using
my $namespace = ""; # this identifies the subontology

# READ IN FILE
while (my $line = <>) {

    if ($line =~ /^name:/o) {  $term = $line; } # o switch optimizes the regex
    if ($line =~ /^id:/o) {  $id = $line; }
    if ($line =~ /^namespace:/o) {  $namespace = $line; }
	
    # if you have found a term, an id, and a namespace, then if the namespace corresponds to the ontology that you're interested in, you can output everything
    if ($term && $id && $namespace) {
      outputConcept($term, $id, $namespace);
    }
} # close loop through input

# PRODUCE OUTPUT
sub outputConcept() {

  my ($term, $id, $namespace) = @_;
  print $term;
  print $id;
  print $namespace;
  print "\n"; # a blank line between concepts to be considerate!  
}

