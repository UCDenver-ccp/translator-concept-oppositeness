# If you run EVERY line of this, you get all of the CRAFT ontologies, plus some others that Bill asked for.
#rm -f findAntonyms.txt

####echo
echo "CRAFT-2.0 ONTOLOGIES"
####echo
echo "Cell Line Ontology"
####./findAntonyms.pl /Users/kevincohen/Dropbox/a-m/Corpora/craft-2.0/ontologies/CL.obo | wc -l
####cat /Users/kevincohen/Dropbox/a-m/Corpora/craft-2.0/ontologies/CL.obo | egrep '(name|term):' | wc -l
rm -f /Users/kevincohen/Dropbox/N-Z/translator-concept-oppositeness/experimental-outputs/currentOpposites/cell_opposites_ids_only.tsv
./findAntonyms.pl /Users/kevincohen/Dropbox/a-m/Corpora/craft-2.0/ontologies/CL.obo > /Users/kevincohen/Dropbox/N-Z/translator-concept-oppositeness/experimental-outputs/currentOpposites/cell_opposites_ids_only.tsv

echo "Gene Ontology"
#./findAntonyms.pl /Users/kevincohen/Dropbox/a-m/Corpora/craft-2.0/ontologies/GO.obo | wc -l
#cat /Users/kevincohen/Dropbox/a-m/Corpora/craft-2.0/ontologies/GO.obo | egrep '(name|term):' | wc -l 
rm -f /Users/kevincohen/Dropbox/N-Z/translator-concept-oppositeness/experimental-outputs/currentOpposites/go_opposites_ids_only.tsv
./findAntonyms.pl /Users/kevincohen/Dropbox/a-m/Corpora/craft-2.0/ontologies/GO.obo > /Users/kevincohen/Dropbox/N-Z/translator-concept-oppositeness/experimental-outputs/currentOpposites/go_opposites_ids_only.tsv

#./findAntonyms.pl /Users/kevincohen/Dropbox/a-m/Corpora/craft-2.0/ontologies/GO.obo 

echo "NCBI Taxonomy"
####./findAntonyms.pl /Uasers/kevincohen/Dropbox/a-m/Corpora/craft-2.0/ontologies/NCBITaxon.obo | wc -l
####cat /Users/kevincohen/Dropbox/a-m/Corpora/craft-2.0/ontologies/NCBITaxon.obo | wc -l
rm -f /Users/kevincohen/Dropbox/N-Z/translator-concept-oppositeness/experimental-outputs/currentOpposites/ncbitaxon_opposites_ids_only.tsv
./findAntonyms.pl /Users/kevincohen/Dropbox/a-m/Corpora/craft-2.0/ontologies/NCBITaxon.obo > /Users/kevincohen/Dropbox/N-Z/translator-concept-oppositeness/experimental-outputs/currentOpposites/ncbitaxon_opposites_ids_only.tsv


echo "Protein Ontology"
####./findAntonyms.pl /Users/kevincohen/Dropbox/a-m/Corpora/craft-2.0/ontologies/PR.obo | wc -l
####cat /Users/kevincohen/Dropbox/a-m/Corpora/craft-2.0/ontologies/PR.obo | egrep '(name|term):' | wc -l
rm -f /Users/kevincohen/Dropbox/N-Z/translator-concept-oppositeness/experimental-outputs/currentOpposites/pro_opposites_ids_only.tsv
./findAntonyms.pl /Users/kevincohen/Dropbox/a-m/Corpora/craft-2.0/ontologies/PR.obo > /Users/kevincohen/Dropbox/N-Z/translator-concept-oppositeness/experimental-outputs/currentOpposites/pro_opposites_ids_only.tsv


echo "Sequence Ontology"
####./findAntonyms.pl /Users/kevincohen/Dropbox/a-m/Corpora/craft-2.0/ontologies/SO.obo | wc -l
####cat /Users/kevincohen/Dropbox/a-m/Corpora/craft-2.0/ontologies/SO.obo | egrep '(name|term):' | wc -l
rm -f /Users/kevincohen/Dropbox/N-Z/translator-concept-oppositeness/resources/ontologies/so_detokenized.obo
cat /Users/kevincohen/Dropbox/N-Z/translator-concept-oppositeness/resources/ontologies/so_2012-08-30.obo | /Users/kevincohen/Dropbox/N-Z/translator-concept-oppositeness/code/detokenizeSequenceOntology.pl > /Users/kevincohen/Dropbox/N-Z/translator-concept-oppositeness/resources/ontologies/so_detokenized.obo
./findAntonyms.pl /Users/kevincohen/Dropbox/N-Z/translator-concept-oppositeness/resources/ontologies/so_detokenized.obo > /Users/kevincohen/Dropbox/N-Z/translator-concept-oppositeness/experimental-outputs/currentOpposites/so_opposites_ids_only.tsv

echo "ChEBI"
#./findAntonyms.pl /Users/kevincohen/Dropbox/a-m/Corpora/obo/craft-ontologies/CHEBI/CHEBI/CHEBI.obo > findAntonyms.txt
rm -f /Users/kevincohen/Dropbox/N-Z/translator-concept-oppositeness/experimental-outputs/currentOpposites/chebi_opposites_ids_only.tsv
./findAntonyms.pl /Users/kevincohen/Dropbox/a-m/Corpora/obo/craft-ontologies/CHEBI/CHEBI/CHEBI.obo > /Users/kevincohen/Dropbox/N-Z/translator-concept-oppositeness/experimental-outputs/currentOpposites/chebi_opposites_ids_only.tsv

echo 
echo "OTHER ONTOLOGIES"
echo

####echo "Regulation of Transcription Ontology"
####./findAntonyms.pl /Users/kevincohen/Dropbox/a-m/Corpora/obo/reto-2015-12-16.obo | wc -l
####cat /Users/kevincohen/Dropbox/a-m/Corpora/obo/reto-2015-12-16.obo | egrep '(name|term):' | wc -l
####./findAntonyms.pl /Users/kevincohen/Dropbox/a-m/Corpora/obo/reto-2015-12-16.obo >> findAntonyms.txt

####echo "Mouse Gross Anatomy and Development Ontology"
####./findAntonyms.pl /Users/kevincohen/Dropbox/a-m/Corpora/obo/EMAP_combined-2016-2-10.obo | wc -l
####cat /Users/kevincohen/Dropbox/a-m/Corpora/obo/EMAP_combined-2016-2-10.obo | egrep '(name|term):' | wc -l
####./findAntonyms.pl /Users/kevincohen/Dropbox/a-m/Corpora/obo/EMAP_combined-2016-2-10.obo >> findAntonyms.txt

echo "Human Phenotype Ontology"
#######./findAntonyms.pl /Users/kevincohen/Dropbox/a-m/Corpora/obo/hp-2020-20-12.obo | wc -l
#######cat /Users/kevincohen/Dropbox/a-m/Corpora/obo/hp-2020-20-12.obo | egrep '(name|term):' | wc -l
rm -f /Users/kevincohen/Dropbox/N-Z/translator-concept-oppositeness/experimental-outputs/currentOpposites/hp_opposites_ids_only.tsv
./findAntonyms.pl /Users/kevincohen/Dropbox/a-m/Corpora/obo/hp-2020-20-12.obo > /Users/kevincohen/Dropbox/N-Z/translator-concept-oppositeness/experimental-outputs/currentOpposites/hp_opposites_ids_only.tsv
########./findAntonyms.pl /Users/kevincohen/Dropbox/a-m/Corpora/obo/hp-2020-20-12.obo

####echo "African Traditional Medicine Ontology"
####./findAntonyms.pl /Users/kevincohen/Dropbox/a-m/Corpora/obo/african_medicine.obo | wc -l
####cat /Users/kevincohen/Dropbox/a-m/Corpora/obo/african_medicine.obo | egrep '(name|term):' | wc -l
####./findAntonyms.pl /Users/kevincohen/Dropbox/a-m/Corpora/obo/african_medicine.obo >> findAntonyms.txt

echo "PATO"
#cat /Users/kevincohen/Dropbox/a-m/Corpora/obo/pato.2021-03-10.obo | egrep '(name|term):' | wc -l
rm -f /Users/kevincohen/Dropbox/N-Z/translator-concept-oppositeness/experimental-outputs/currentOpposites/pato_opposites_ids_only.tsv
./findAntonyms.pl /Users/kevincohen/Dropbox/a-m/Corpora/obo/pato.2021-03-10.obo > /Users/kevincohen/Dropbox/N-Z/translator-concept-oppositeness/experimental-outputs/currentOpposites/pato_opposites_ids_only.tsv
 
 
echo "MPO"
rm -f /Users/kevincohen/Dropbox/N-Z/translator-concept-oppositeness/experimental-outputs/currentOpposites/mpo_opposites_ids_only.tsv
./findAntonyms.pl /Users/kevincohen/Dropbox/N-Z/translator-concept-oppositeness/resources/ontologies/MPheno_OBO.ontology.2020-03-31 > /Users/kevincohen/Dropbox/N-Z/translator-concept-oppositeness/experimental-outputs/currentOpposites/mpo_opposites_ids_only.tsv



#cat /Users/kevincohen/Dropbox/a-m/Corpora/obo/ | egrep '(name|term):' | wc -l

#./findAntonyms.pl | wc -l
#cat /Users/kevincohen/Dropbox/a-m/Corpora/obo/ | egrep '(name|term):' | wc -l


