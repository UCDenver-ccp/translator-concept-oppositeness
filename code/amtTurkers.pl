#!/usr/bin/perl

use strict 'vars';

my $DEBUG = 0;
my %hits_per_worker = (); # HIT is a single task--"Human Intelligence Task," in AMT parlance
my $total_hits_processed = 0; # you'll use this for validation later

while (my $line = <>) {

  
  my @fields = split(",", $line);
  
  if ($DEBUG < 0) {
    for (my $i = 0; $i < @fields; $i++) {
      print "$i: <$fields[$i]>\n";
    }
  }
  my $worker_id = $fields[19];
  if ($worker_id =~ /[a-z]/) { next; } # skip the header, which contains lower-case letters, unlike worker IDs
  # remove leading and trailing double quotes
  #my $worker_id =~ s/^\"//;
  #my $worker_id =~ s/\"$//;
  $DEBUG && print "<$worker_id>";
  $hits_per_worker{$worker_id}++;
  $total_hits_processed++; # might be off by one until I leave out the header line
}

# you've gone through the whole file, so print out the workers sorted by how many HITs they did
my @workers_by_hits = sort { $hits_per_worker{$b} <=> $hits_per_worker{$a} } keys(%hits_per_worker);

$DEBUG && print "\nNumber of hits: " . $total_hits_processed . "\n";

$DEBUG && print "Number of Turkers: " . scalar (@workers_by_hits) . "\n"; # workers in AMT-land are called "Turkers"

my $validate_count_of_hits = 0;

# print header for R
print "worker,hits\n";

foreach my $worker (@workers_by_hits) {
  print "$worker,$hits_per_worker{$worker}\n";
  $validate_count_of_hits = $validate_count_of_hits + $hits_per_worker{$worker};
}

$DEBUG && print "$total_hits_processed should equal $validate_count_of_hits\n";

