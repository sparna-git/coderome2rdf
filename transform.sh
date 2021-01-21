export SAXON=/home/thomas/programs/saxon/saxon-he-10.3.jar

java -jar $SAXON -s:input/unix_arborescence_v344_iso8859-15.xml -xsl:fichier_xsl/arborescence.xsl -o:output/arborescence.rdf
java -jar $SAXON -s:input/unix_fiche_emploi_metier_v344_iso8859-15.xml -xsl:fichier_xsl/fiche_emploi_metier.xsl -o:output/fiche_emploi_metier.rdf
java -jar $SAXON -s:input/unix_referentiel_activite_v344_iso8859-15.xml -xsl:fichier_xsl/referentiel_activite.xsl -o:output/referentiel_activite.rdf
java -jar $SAXON -s:input/unix_referentiel_competence_v344_iso8859-15.xml -xsl:fichier_xsl/referentiel_competence.xsl -o:output/referentiel_competence.rdf
