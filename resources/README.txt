## TWO TYPES OF FILES IN THE RESOURCES DIRECTORY

1. Contents categorized by inferences that they license (or do not)
2. Contents categorized by morphology---lexical category (POS), or prefixal morphology

The contents of these two types of files can overlap.  For example, <alive,dead> might appear in the "complementary" file (opposites of the excluded middle), and also in the "adjectives" file.

BASIC CONTRASTS BETWEEN INFERENTIALLY-CATEGORIZED OPPOSITIONS:

A. Middle is/is not excluded
B. You can or cannot be more than one

1. Complementary: excluded middle. dead/alive
2. Antonym: middle not excluded. cold/warm/hot
3. Relational, so you can be more than one: parent/child

"Antonynms" differ with respect to some attribute (long, short) or change in some attribute (to lengthen, to shorten). They exist on a continuum, and an entity can be neither of them: not being long does not of necessity imply being short. 

Antonyms do not support the inference if not(X), then Y.

Antonyms are found in the file known.opposites.antonyms.english.tsv.

"Complementary" pairs differ with respect to one feature; deciding what it is is actually probably easier than figuring out all of the things that they have in common.  Complementary pairs are incompatible, thus an entity cannot be both dead and alive.  

Complementary pairs do support the inference if not(X), then Y.

Complementary pairs are found in the file known.opposites.complementary.english.tsv.

"Contraries" differ with respect to some specific relation between them, where that relation must be asymmetric. For example, if the (parent, offspring) relation exists between two entities, then a given entity can only be one of those two *in relation to the other.* Contraries support inference only within a specified pair of entries: for example, knowing that mouse A is a parent of mouse B does not tell you anything about A's or B's relationships of parenthood to mouse C, one way or the other.

Contrary pairs are found in the file known.opposites.contraries.english.tsv.   

## OTHER FILES

known.non-negatives.english.tsv: Words that start with strings that look like they could be negative prefixes, but are not.  This is a list of single words, not pairs of words.  Examples: "alive" (which is not a+live), "deep" (which is not de+ep).

known.opposites.adjectives.english.tsv: Pairs of opposites (loosely speaking) that are adjectives. Examples: <benign,malignant>.

known.non-negatives.english.tsv and known.non-opposites.english.tsv: words in the non-negatives file (should) appear in the non-opposites file iff removing the (apparently but) negative "morpheme" leaves an actual word.  (In linguistic terminology: a free morpheme.)  So, "alive" appears in the list of non-negatives because the "a" at the beginning is not a negative morpheme.  It also appears in the non-opposites file, as part of the pair <alive,live>, because (a) "live" is an actual word, and (b) "alive" and "live" are not opposites. In contrast, "deep" appears in the list of non-negatives (because "de" is not a negative morpheme here), but it does not appear in the non-opposites file, because "ed" is not a word.

## FILES FROM https://github.com/drseb/phenopposites/tree/master/opposites

antonyms_hp.txt: pairs of opposites found by Chris Mungall's project. Format: a pair of concepts with a binary value telling you whether they were returned by examining the logical definitions, and another binary value telling you whether they were returned by examining the terms.


 
