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

	<!-- controls output style -->
	<xsl:output method="xml" indent="yes" />

	<!-- Variable -->
	<xsl:variable name="URI"
		select="'http://vocabs.sparna.fr/rome/'" />

	<xsl:template match="/">
		<xsl:apply-templates />
	</xsl:template>

	<xsl:template match="ogr">
		<rdf:RDF>
			<xsl:apply-templates />
		</rdf:RDF>
	</xsl:template>

	<xsl:template match="item_referentiel_code_rome">
		<skos:Concept rdf:about="{concat($URI,code_rome)}">
			<xsl:apply-templates />
		</skos:Concept>
	</xsl:template>

	<xsl:template match="libelle">
		<skos:prefLable>
			<xsl:value-of select="." />
		</skos:prefLable>
	</xsl:template>

	<!-- fin de format -->
	<xsl:template match="text()"></xsl:template>

</xsl:stylesheet>