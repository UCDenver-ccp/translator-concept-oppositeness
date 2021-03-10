rm findAntonyms.txt

####echo
####echo "CRAFT-2.0 ONTOLOGIES"
####echo
####echo "Cell Line Ontology"
####./findAntonyms.pl /Users/kevincohen/Dropbox/a-m/Corpora/craft-2.0/ontologies/CL.obo | wc -l
####cat /Users/kevincohen/Dropbox/a-m/Corpora/craft-2.0/ontologies/CL.obo | egrep '(name|term):' | wc -l
####./findAntonyms.pl /Users/kevincohen/Dropbox/a-m/Corpora/craft-2.0/ontologies/CL.obo > findAntonyms.txt

echo "Gene Ontology"
./findAntonyms.pl /Users/kevincohen/Dropbox/a-m/Corpora/craft-2.0/ontologies/GO.obo | wc -l
cat /Users/kevincohen/Dropbox/a-m/Corpora/craft-2.0/ontologies/GO.obo | egrep '(name|term):' | wc -l 
./findAntonyms.pl /Users/kevincohen/Dropbox/a-m/Corpora/craft-2.0/ontologies/GO.obo >> findAntonyms.txt
#./findAntonyms.pl /Users/kevincohen/Dropbox/a-m/Corpora/craft-2.0/ontologies/GO.obo 

####echo "NCBI Taxonomy"
####./findAntonyms.pl /Users/kevincohen/Dropbox/a-m/Corpora/craft-2.0/ontologies/NCBITaxon.obo | wc -l
####cat /Users/kevincohen/Dropbox/a-m/Corpora/craft-2.0/ontologies/NCBITaxon.obo | wc -l
####./findAntonyms.pl /Users/kevincohen/Dropbox/a-m/Corpora/craft-2.0/ontologies/NCBITaxon.obo >> findAntonyms.txt

####echo "Protein Ontology"
####./findAntonyms.pl /Users/kevincohen/Dropbox/a-m/Corpora/craft-2.0/ontologies/PR.obo | wc -l
####cat /Users/kevincohen/Dropbox/a-m/Corpora/craft-2.0/ontologies/PR.obo | egrep '(name|term):' | wc -l
####./findAntonyms.pl /Users/kevincohen/Dropbox/a-m/Corpora/craft-2.0/ontologies/PR.obo >> findAntonyms.txt

####echo "Sequence Ontology"
####./findAntonyms.pl /Users/kevincohen/Dropbox/a-m/Corpora/craft-2.0/ontologies/SO.obo | wc -l
####cat /Users/kevincohen/Dropbox/a-m/Corpora/craft-2.0/ontologies/SO.obo | egrep '(name|term):' | wc -l
####./findAntonyms.pl /Users/kevincohen/Dropbox/a-m/Corpora/craft-2.0/ontologies/SO.obo >> findAntonyms.txt


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
./findAntonyms.pl /Users/kevincohen/Dropbox/a-m/Corpora/obo/hp-2020-20-12.obo | wc -l
cat /Users/kevincohen/Dropbox/a-m/Corpora/obo/hp-2020-20-12.obo | egrep '(name|term):' | wc -l
./findAntonyms.pl /Users/kevincohen/Dropbox/a-m/Corpora/obo/hp-2020-20-12.obo >> findAntonyms.txt
./findAntonyms.pl /Users/kevincohen/Dropbox/a-m/Corpora/obo/hp-2020-20-12.obo

####echo "African Traditional Medicine Ontology"
####./findAntonyms.pl /Users/kevincohen/Dropbox/a-m/Corpora/obo/african_medicine.obo | wc -l
####cat /Users/kevincohen/Dropbox/a-m/Corpora/obo/african_medicine.obo | egrep '(name|term):' | wc -l
####./findAntonyms.pl /Users/kevincohen/Dropbox/a-m/Corpora/obo/african_medicine.obo >> findAntonyms.txt


#./findAntonyms.pl | wc -l
#cat /Users/kevincohen/Dropbox/a-m/Corpora/obo/ | egrep '(name|term):' | wc -l


