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

"Complementary" pairs differ with respect to... They are incompatible, thus an entity cannot be both dead and alive.  

Complementary pairs do support the inference if not(X), then Y.

Complementary pairs are found in the file known.opposites.complementary.english.tsv.

"Contraries" differ with respect to some specific relation between them, where that relation must be asymmetric. For example, if the (parent, offspring) relation exists between two entities, then a given entity can only be one of those two *in relation to the other.* Contraries do/do not support the inference...

Contrary pairs are found in the file known.opposites.contraries.english.tsv.   

## OTHER FILES

known.non-negatives.english.tsv: Words that start with strings that look like they could be negative prefixes, but are not.  Examples: "alive" is not a+live, "deep" is not de+ep.

known.opposites.adjectives.english.tsv: Pairs of opposites (loosely speaking) that are adjectives. Examples: <benign,malignant>. 

