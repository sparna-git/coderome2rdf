<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:owl="http://www.w3.org/2002/07/owl#"
	xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
	xmlns:dc="http://purl.org/dc/elements/1.1/"
	xmlns:skos="http://www.w3.org/2004/02/skos/core#"
	xmlns:dcterms="http://purl.org/dc/terms/"
	xmlns:skosxl="http://www.w3.org/2008/05/skos-xl#"
	xmlns:isothes="http://purl.org/iso25964/skos-thes#"
	xmlns:xsd="http://www.w3.org/2001/XMLSchema#"
	xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
	xmlns:rome="http://data.sparna.fr">

	<!--
		- Mettre la racine de l'URI http://vocabs.sparna.fr/rome/ dans une variable globale en haut de la feuille de style
		- supprimer les xsl:if redondant
		- utiliser xsl:value-of select="."
	-->


	<!-- controls output style -->
	<xsl:output method="xml" indent="yes" />

	<xsl:template match="/">
		<xsl:apply-templates />
	</xsl:template>

	<xsl:template match="ogr">
		<rdf:RDF>
			<skos:Concept>
				<xsl:apply-templates />
			</skos:Concept>
		</rdf:RDF>
	</xsl:template>

	<xsl:template match="fiche_emploi_metier">
		<rdf:Description
			rdf:about="{concat('http://vocabs.sparna.fr/rome/',bloc_code_rome/code_rome)}">
			<xsl:apply-templates />
		</rdf:Description>
	</xsl:template>

	<xsl:template match="appellation/item">
		<skos:altLabel xml:lang="fr">
			<xsl:value-of select="libelle" />
		</skos:altLabel>
	</xsl:template>

	<xsl:template match="definition">
		<skos:definition xml:lang="fr">
			<xsl:value-of select="../definition" />
		</skos:definition>
	</xsl:template>

	<xsl:template match="acces_emploi_metier">
		<rome:acces xml:lang="fr">
			<xsl:value-of select="../acces_emploi_metier" />
		</rome:acces>
	</xsl:template>

	<xsl:template match="formations_associees">
		<xsl:apply-templates />
	</xsl:template>

	<xsl:template match="condition_exercice_activite">
		<rome:conditions xml:lang="fr">
			<xsl:value-of select="../condition_exercice_activite" />
		</rome:conditions>
	</xsl:template>

	<xsl:template match="classement_emploi_metier">
		<xsl:apply-templates />
	</xsl:template>

	<xsl:template match="environnement_de_travail">
		<xsl:apply-templates />
	</xsl:template>

	<xsl:template match="les_mobilites/proche/mobilite">
		<rome:mobiliteProche
			rdf:resource="{concat('http://vocabs.sparna.fr/rome/',substring(code_rome_cible,1,5))}" />
	</xsl:template>

	<xsl:template match="les_mobilites/si_evolution/mobilite">
		<rome:mobiliteEvolution
			rdf:resource="{concat('http://vocabs.sparna.fr/rome/',substring(code_rome_cible,1,5))}" />
	</xsl:template>

	<xsl:template match="les_activites_de_base">
		<rome:activitesDeBase>
			<rome:MobilisationCompetenceActivite>
				<xsl:if test="activite_de_base/item">
					<xsl:for-each select="activite_de_base/item">
						<rome:activite
							rdf:resource="{concat('http://vocabs.sparna.fr/rome/activite_',code_ogr)}" />
					</xsl:for-each>
				</xsl:if>
				<xsl:if test="savoir_theorique_et_proceduraux/item">
					<xsl:for-each
						select="savoir_theorique_et_proceduraux/item">
						<rome:competence
							rdf:resource="{concat('http://vocabs.sparna.fr/rome/competence_',code_ogr)}" />
					</xsl:for-each>
				</xsl:if>
			</rome:MobilisationCompetenceActivite>
		</rome:activitesDeBase>
	</xsl:template>

	<xsl:template match="les_activites_specifique/bloc">
		<rome:activite>
			<rome:MobilisationCompetenceActivite>
				<xsl:if test="activite_specifique/item">
					<xsl:for-each select="activite_specifique/item">
						<rome:activite
							rdf:resource="{concat('http://vocabs.sparna.fr/rome/activite_',code_ogr)}" />
					</xsl:for-each>
				</xsl:if>
				<xsl:if test="savoir_theorique_et_proceduraux/item">
					<xsl:for-each
						select="savoir_theorique_et_proceduraux/item">
						<rome:competence
							rdf:resource="{concat('http://vocabs.sparna.fr/rome/competence_',code_ogr)}" />
					</xsl:for-each>
				</xsl:if>
			</rome:MobilisationCompetenceActivite>
		</rome:activite>
	</xsl:template>


	<!-- fin de format -->
	<xsl:template match="text()"></xsl:template>

</xsl:stylesheet>