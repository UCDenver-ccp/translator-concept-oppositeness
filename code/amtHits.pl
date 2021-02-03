#!/usr/bin/perl

use strict 'vars';

my %responses = ();
while (my $line = <>) {
  my @fields = split(",", $line);

  if (1) {
    for (my $i = 0; $i < @fields; $i++) {
      print "$i: $fields[$i]\n";    
    }
  }

  my $first_of_pair = $fields[32];
  #$first_of_pair = s/^.{1}//; # trim first character--it's a double quote
  my $second_of_pair = $fields[33];
  #$second_of_pair = s/.{1}$//; # same for last character

  #my $pair = $fields[32] . "," . $fields[35];
  
  my $first_response = "";
  my $second_response = "";
  my $pair = $first_of_pair . "," . $second_of_pair;
  print "$pair\n";
  $responses{$pair}++;
  
}

foreach my $hit (sort(keys(%responses))) {
  print "$hit: $responses{$hit}\n"; # a hit is a pair, but I didn't want to use the same variable name twice...
}
