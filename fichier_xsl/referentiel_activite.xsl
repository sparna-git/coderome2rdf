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
	xmlns:rome="http://data.sparna.fr/ontologies/rome#"
	xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#">

	<!-- controls output style -->
	<xsl:output method="xml" indent="yes" />

	<!-- Variable -->
	<xsl:variable name="URI"
		select="'http://vocabs.sparna.fr/rome/'" />

	<xsl:template match="/">
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="ogr">
		<rdf:RDF>
			<skos:ConceptScheme
				rdf:about="{concat($URI,'activites')}">
				<skos:prefLabel xml:lang="fr">
					<xsl:value-of select="'CODE ROME - Activités'" />
				</skos:prefLabel>
				<xsl:for-each select="item_referentiel_activite">
					<skos:hasTopConcept
						rdf:resource="{concat($URI,'activites/',code_ogr)}" />
				</xsl:for-each>
			</skos:ConceptScheme>
			<xsl:apply-templates />
		</rdf:RDF>
	</xsl:template>

	<xsl:template match="item_referentiel_activite">
		<rome:Activite
			rdf:about="{concat($URI,'activites/',code_ogr)}">
			<rdf:type
				rdf:resource="{concat('http://www.w3.org/2004/02/skos/core#','Concept')}" />
			<skos:inScheme
				rdf:resource="{concat($URI,'activites')}" />
			<skos:prefLabel xml:lang="fr">
				<xsl:value-of select="libelle" />
			</skos:prefLabel>
		</rome:Activite>
	</xsl:template>

	<!-- fin de format -->
	<xsl:template match="text()"></xsl:template>

</xsl:stylesheet>