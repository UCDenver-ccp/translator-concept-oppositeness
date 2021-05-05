#!/usr/bin/perl

# The version of the Sequence Ontology that I'm using has underscores between words in term names, so let's get rid of them.
# for example, 
# name: interior_coding_exon
# ...should become
# name: interior coding exon

use strict 'vars';

while (my $line = <>) {

  if ($line =~ /^name: /) {
    $line =~ s/_/ /g;
  }   
  print $line;
}
