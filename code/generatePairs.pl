#!/usr/bin/perl

# input looks like this:
# _ activity

use strict 'vars';

#my %increased = ();
#my %decreased = ();

my @increase = ("increased",
                "increasing",
                "elevated",
                "increase",
                "increases");

my @decrease = ("decreased",
                "decreasing",
                "reduced",
                "decrease",
                "decreases");

while (my $line = <>) {

  # a little preprocessing
  chomp($line);
  #$line =~ s/^name:\s+//;

  generateCrossProduct("OPPOSITE", $line, \@increase, \@decrease);
  generateCrossProduct("SYNONYM", $line, \@increase, \@increase);
  generateCrossProduct("SYNONYM", $line, \@decrease, \@decrease);

  #if ($line =~ s/increased/_/gi) { $increased{$line}++ }
  #if ($line =~ s/decreased/_/gi) { $decreased{$line}++ }
  my @increase_synset = ();
  my @decrease_synste = ();

  #foreach my $increase_word (@increase) {
  #  my $output = $line;
  #  $output =~ s/_/$increase_word/;
  #  print "$output\n";
  #}
  #foreach my $decrease_word (@decrease) {
  #  my $output = $line;
  #  $output =~ s/_/$decrease_word/;
  #  print "$output\n";
  #} 

  generateCrossProduct(\@increase, \@decrease, $line);
}


# given two arrays, generate their cross-product.
# So, these two arrays:
# @array01 = [increased, increasing]
# @array02 = [decreased, decreasing]
# produces:
# increased, decreased
# increased, decreasing
# increasing, decreased
# increasing, decreasing
sub generateCrossProduct {
  # oh, fuck--how do you pass in two arrays?? Better do two
  # array references and then dereference them, you dumb fuck, Kevin
  my ($label, $term, $array_referenceX, $array_referenceY) = @_;
  foreach my $X_element (@{$array_referenceX}) {

    my $outputX = $term;
    $outputX =~ s/_/$X_element/;
    foreach my $Y_element (@{$array_referenceY}) {
      # little hack for the case where synonyms are actually identical
      if ($Y_element eq $X_element) { next; }

      my $outputY = $term;
      $outputY =~ s/_/$Y_element/;
      #print "$X_element $term\t$Y_element $term\n";
      print "$label\t$outputX\t$outputY\n"; 
    }
  }
}
