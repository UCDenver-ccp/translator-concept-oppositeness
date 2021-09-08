# sequence for all ontologies is like this:
# 0. Delete any previous version of the output
# 1. Find the opposites and store them
# 2. Count them
# 3. Count specific categories: biosynthesis and import

echo "GO (all)"
echo "Finding opposites..."
rm -f Users/kevincohen/Dropbox/N-Z/translator-concept-oppositeness/experimental-outputs/currentOpposites/go_opposites.tsv
./findAntonyms.pl /Users/kevincohen/Dropbox/N-Z/translator-concept-oppositeness/resources/ontologies/go-2021-09-01.obo > /Users/kevincohen/Dropbox/N-Z/translator-concept-oppositeness/experimental-outputs/currentOpposites/go_opposites.tsv
echo "Counting all opposites..."
wc -l /Users/kevincohen/Dropbox/N-Z/translator-concept-oppositeness/experimental-outputs/currentOpposites/go_opposites.tsv
echo "Counting biosynthesis opposites..."
egrep -i 'biosynth' /Users/kevincohen/Dropbox/N-Z/translator-concept-oppositeness/experimental-outputs/currentOpposites/go_opposites.tsv | wc -l
echo "Counting import/export opposites..."
egrep -i 'import' /Users/kevincohen/Dropbox/N-Z/translator-concept-oppositeness/experimental-outputs/currentOpposites/go_opposites.tsv | wc -l

echo "GO_MF"
echo "Finding opposites..."
rm -f /Users/kevincohen/Dropbox/N-Z/translator-concept-oppositeness/experimental-outputs/currentOpposites/go_mf_opposites.tsv
./findAntonyms.pl /Users/kevincohen/Dropbox/N-Z/translator-concept-oppositeness/resources/ontologies/go_mf-2021-09-01.obo > /Users/kevincohen/Dropbox/N-Z/translator-concept-oppositeness/experimental-outputs/currentOpposites/go_mf_opposites.tsv
echo "Counting all opposites..."
wc -l /Users/kevincohen/Dropbox/N-Z/translator-concept-oppositeness/experimental-outputs/currentOpposites/go_mf_opposites.tsv
echo "Counting biosynthesis opposites..."
egrep -i 'biosynth' /Users/kevincohen/Dropbox/N-Z/translator-concept-oppositeness/experimental-outputs/currentOpposites/go_mf_opposites.tsv | wc -l
echo "Counting import/export opposites..."
egrep -i 'import' /Users/kevincohen/Dropbox/N-Z/translator-concept-oppositeness/experimental-outputs/currentOpposites/go_mf_opposites.tsv | wc -l

echo "GO_BP"
rm -f Users/kevincohen/Dropbox/N-Z/translator-concept-oppositeness/experimental-outputs/currentOpposites/go_bp_opposites.tsv
./findAntonyms.pl /Users/kevincohen/Dropbox/N-Z/translator-concept-oppositeness/resources/ontologies/go_bp-2021-09-01.obo > /Users/kevincohen/Dropbox/N-Z/translator-concept-oppositeness/experimental-outputs/currentOpposites/go_bp_opposites.tsv
echo "Counting all opposites..."
wc -l /Users/kevincohen/Dropbox/N-Z/translator-concept-oppositeness/experimental-outputs/currentOpposites/go_bp_opposites.tsv
echo "Counting biosynthesis opposites..."
egrep -i 'biosynth' /Users/kevincohen/Dropbox/N-Z/translator-concept-oppositeness/experimental-outputs/currentOpposites/go_bp_opposites.tsv | wc -l
echo "Counting import/export opposites..."
egrep -i 'import' /Users/kevincohen/Dropbox/N-Z/translator-concept-oppositeness/experimental-outputs/currentOpposites/go_bp_opposites.tsv | wc -l 


#echo "GO_CC"
#echo "Finding opposites..."
#./findAntonyms.pl /Users/kevincohen/Dropbox/N-Z/translator-concept-oppositeness/resources/ontologies/go_cc-2021-09-01.obo 

echo "HPO"
echo "Finding opposites..."
rm -f /Users/kevincohen/Dropbox/N-Z/translator-concept-oppositeness/experimental-outputs/currentOpposites/hpo_opposites.tsv
./findAntonyms.pl ~/Dropbox/a-m/Corpora/obo/hp-2020-20-12.obo  > /Users/kevincohen/Dropbox/N-Z/translator-concept-oppositeness/experimental-outputs/currentOpposites/hpo_opposites.tsv
echo "Counting all opposites..."
wc -l /Users/kevincohen/Dropbox/N-Z/translator-concept-oppositeness/experimental-outputs/currentOpposites/hpo_opposites.tsv
echo "Counting biosynthesis opposites..."
egrep -i 'biosynth' /Users/kevincohen/Dropbox/N-Z/translator-concept-oppositeness/experimental-outputs/currentOpposites/hpo_opposites.tsv | wc -l
echo "Counting import/export opposites..."
egrep -i 'import' /Users/kevincohen/Dropbox/N-Z/translator-concept-oppositeness/experimental-outputs/currentOpposites/hpo_opposites.tsv | wc -l



#echo "Counting categories..."

#echo "GO_MF biosynth"
#./findAntonyms.pl /Users/kevincohen/Dropbox/N-Z/translator-concept-oppositeness/resources/ontologies/go_mf-2021-09-01.obo | egrep -i 'biosynth' | wc -l

#echo "GO_BP biosynth"
#./findAntonyms.pl /Users/kevincohen/Dropbox/N-Z/translator-concept-oppositeness/resources/ontologies/go_bp-2021-09-01.obo | egrep -i 'biosynth' | wc -l

#echo "GO_CC biosynth"
./findAntonyms.pl /Users/kevincohen/Dropbox/N-Z/translator-concept-oppositeness/resources/ontologies/go_cc-2021-09-01.obo | egrep -i 'biosynth' | wc -l

 
