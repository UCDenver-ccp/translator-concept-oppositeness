#!/usr/bin/perl

# input looks like this:
# _ activity

use strict 'vars';

my $DEBUG = 0;

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

my @hyper = ("hyper");
my @hypo = ("hypo");

if (0) {
  @increase = @hyper;
  @decrease = @hypo;
}

while (my $line = <>) {

  # a little preprocessing
  chomp($line);
  $line =~ s/^name:\s+//;

  generateCrossProduct("OPPOSITE", $line, \@increase, \@decrease);
  #generateCrossProduct("SYNONYM", $line, \@increase, \@increase);
  #generateCrossProduct("SYNONYM", $line, \@decrease, \@decrease);

  #if ($line =~ s/increased/_/gi) { $increased{$line}++ }
  #if ($line =~ s/decreased/_/gi) { $decreased{$line}++ }
  #my @increase_synset = ();
  #my @decrease_synset = ();


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
  1 && print "Label: $label Term: $term Array ref X: $array_referenceX Array ref Y: $array_referenceY\n";

  my $outputX = $term;
  my $outputY = $term;

  OUTER: foreach my $X_element (@{$array_referenceX}) {
  $DEBUG && print "Outer loop, X_element is $X_element\n";
    $outputX =~ s/_/$X_element/;
    $DEBUG && print "output for X: $outputX\n";

    INNER: foreach my $Y_element (@{$array_referenceY}) {
    1 && print "Inner loop, Y_element is $Y_element\n";

      $outputY =~ s/_/$Y_element/;
      $DEBUG && print "output for Y: $outputY\n";
      # little hack for the case where synonyms are actually identical
      if ($Y_element eq $X_element) { $DEBUG && print "IDENTICAL: $Y_element $X_element\n"; last OUTER; }
      print "$label\t$outputX\t$outputY\n"; 
    }
  }
} # close function definition generateCrossProduct()
