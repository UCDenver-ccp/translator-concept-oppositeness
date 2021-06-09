# HPO
egrep -i '^name.+increased' ~/Dropbox/a-m/Corpora/obo/hp-2020-20-12.obo | egrep -vi 'obsolete' | sort > ~/Dropbox/N-Z/translator-concept-oppositeness/resources/HPO.terms.with.increased.txt
egrep -i '^name.+decreased' ~/Dropbox/a-m/Corpora/obo/hp-2020-20-12.obo | egrep -vi 'obsolete' | sort > ~/Dropbox/N-Z/translator-concept-oppositeness/resources/HPO.terms.with.decreased.txt

egrep -i '^name.+hyper' ~/Dropbox/a-m/Corpora/obo/hp-2020-20-12.obo | egrep -vi 'obsolete' | sort > ~/Dropbox/N-Z/translator-concept-oppositeness/resources/HPO.terms.with.hyper.txt
egrep -i '^name.+hypo' ~/Dropbox/a-m/Corpora/obo/hp-2020-20-12.obo | egrep -vi 'obsolete' | sort > ~/Dropbox/N-Z/translator-concept-oppositeness/resources/HPO.terms.with.hypo.txt

#To find paired hyper/hypo opposites: 

cat ../resources/HPO.terms.with.hyper.txt ../resources/HPO.terms.with.hypo.txt | ./hyperHypoOpposites.pl

# To find paired increased/decreased opposites: 

cat ../resources/HPO.terms.with.increased.txt ../resources/HPO.terms.with.decreased.txt | ./increasedDecreasedOpposites.pl

# to generate synonyms:


