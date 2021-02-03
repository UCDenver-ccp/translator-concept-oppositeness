#!/usr/bin/perl

use strict 'vars';

my @lines;

# pipe your input into this...
while (my $line = <>) {
  chomp $line; # remove the newline
  # empty lines at the end fuck up this script, so get rid of them
  unless ($line =~ /.+/) { next; }
  push(@lines, $line);
}

# you have the whole contents of the file now, so generate the cross-product.  include the case where the pair includes the same thing twice, since it is a quality control case

my @lines_duplicate = @lines;

# there is undoubtedly a more elegant way to do this, but I understand this one!
foreach my $i (@lines) {
  1 && print "I: $i\n";
  foreach my $j (@lines_duplicate) {  
    my $pair = $i . "," . $j;
    print "$pair\n";

  }
}
