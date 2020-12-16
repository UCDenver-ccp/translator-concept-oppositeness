#!/usr/bin/perl


use strict 'vars';

my $DEBUG = 0;

my %identifiers = ();
my %ontologies = ();

open(IN, "/Users/transfer/Downloads/biolink-model-master/biolink-model.yaml") || die "Couldn't open YAML file: $!\n";

while (my $line = <IN>) {
    chomp $line;
    if ($line =~ /\b(([A-Z]+):[0-9]+)\b/) {
	my $identifier = $1;
	my $ontology = $2;
	$DEBUG && print "input: <$line>\n";
	$DEBUG && print "ID: $identifier\n";
	$DEBUG && print "ontology: $ontology\n";

	$identifiers{$identifier}++;
	$ontologies{$ontology}++;
    } # close if line contains an identifier
} # close while-loop through file

# tell the world what you've learnt

# sort ontologies by count
my @ontologies = sort { $ontologies{$b} <=> $ontologies{$a} } keys(%ontologies);
for (my $i = 0; $i < @ontologies; $i++) {
    print "$ontologies[$i] $ontologies{$ontologies[$i]}\n";
}

# sort IDs by count
my @identifiers = sort { $identifiers{$b} <=> $identifiers{$a} } keys(%identifiers);
for (my $i = 0; $i < @identifiers; $i++) {
    print "$identifiers[$i] $identifiers{$identifiers[$i]}\n";
}

# sort IDs by alphabetical order
@identifiers = sort @identifiers;
for (my $i = 0; $i < @identifiers; $i++) {
    print "$identifiers[$i]\n";
}
