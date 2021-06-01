#!/usr/bin/perl

use strict 'vars';

my %increased = ();
my %decreased = ();

while (my $line = <>) {

  # a little preprocessing
  chomp($line);
  $line =~ s/^name:\s+//;

  if ($line =~ s/increased/_/gi) { $increased{$line}++ }
  if ($line =~ s/decreased/_/gi) { $decreased{$line}++ }
 
}

my @paired_terms = ();

for my $term (keys(%increased)) {
  if ($decreased{$term}) { push(@paired_terms, $term) }  
}

@paired_terms = sort(@paired_terms);

foreach my $paired_term (@paired_terms) {
  print "$paired_term\n";
  #print "decreased $paired_term" . "\t" . "increased $paired_term". "\n";
  #print "decreased $paired_term" . "\t" . "reduced $paired_term". "\n";
  #print "elevated $paired_term" . "\t" . "reduced $paired_term" . "\n";
  #print "elevated $paired_term" . "\t" . "increased $paired_term" . "\n";
}
