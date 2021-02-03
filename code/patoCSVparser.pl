#!/usr/bin/perl

use strict 'vars';

while (my $line = <>) {

  my @columns = split(",", $line); # caution: commas in the definitions could fuck this up. maybe I should export the file from Excel as .tsv, and use that instead?

  my $term = $columns[1]; # this is the "preferred label" column
  if ($term =~ /^PATO/o) { next; } # apparently some IDs land in this column
  if ($term =~ /^obsolete/o) { next; } # this seems to be how PATO currently indicates obsolete terms     
  if ($term =~ /^Preferred Label/o) { next; } # a small thing, but we like to pay attention to details
  print "$term\n";  
}
