#!/usr/bin/perl

# Purpose of script: a little sandbox for testing out procedures

# catch typos, haha
use strict 'vars';


my @tokens = ();

my %affixes = ();
my @affixes = ();
my %words = ();

%affixes = ("de" => "N",
            "re" => "P",
            "un" => "P");
@affixes = sort(keys(%affixes));

%words = ("normal" => "abnormal",
          "abnormal" => "normal",
          "fast" => "slow",
          "slow" => "fast");



my $term = "";
$term = "drug-induced fast ventricular depolarization";
1 && print "Term: <$term>\n";

@tokens = split(" ", $term);
my @candidate_tokens = (); # infuriatingly, array operations aren't working for me, so I'll deal with a string instread...
my $candidate_term = "";

foreach my $token (@tokens) {
  1 && print "Token: <$token>\n";

  foreach my $affix (@affixes) {
    1 && print "Affix: <$affix>\n";

    if ($token =~ /^$affix/) {
      my $candidate_token = $token;
      $candidate_token =~ s/^$affix//;
      1 && print "Candidate token: <$candidate_token>\n";
      @candidate_tokens = push(@candidate_tokens, $candidate_token);
      print "Candidate tokens: <@candidate_tokens>\n";
      $candidate_term .= $candidate_token;
      print "$candidate_term: <$candidate_term>\n";
    }
  }
}

print(join(@candidate_tokens));

