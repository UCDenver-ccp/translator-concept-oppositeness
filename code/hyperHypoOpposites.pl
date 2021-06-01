#!/usr/bin/perl

use strict 'vars';

my %hypers = ();
my %hypos = ();

while (my $line = <>) {

  # a little preprocessing
  chomp($line);
  $line =~ s/^name:\s+//;

  if ($line =~ s/hyper/_/gi) { $hypers{$line}++ }
  if ($line =~ s/hypo/_/gi) { $hypos{$line}++ } 
}

for my $term (keys(%hypers)) {
  if ($hypos{$term}) { print "$term\n" }  
}
