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

	<xsl:variable name="URI">
		<xsl:value-of select="'http://vocabs.sparna.fr/rome/'" />
	</xsl:variable>

	<!-- controls output style -->
	<xsl:output method="xml" indent="yes" />

	<xsl:template match="/">
		<xsl:apply-templates />
	</xsl:template>

	<!-- Matches the root element, create our output root, and recurse on children -->
	<xsl:template match="ogr">
		<rdf:RDF>
			<skos:ConceptScheme
				rdf:about="{concat($URI,'metiers')}">
				<skos:prefLabel xml:lang="fr">Code ROME - Fiches Métiers</skos:prefLabel>
				<xsl:for-each
					select="item_arborescence[string-length(code_noeud) 
					> 3 and code_noeud != 'Racine AP' and code_noeud != 'Racine AR']">
					<skos:hasTopConcept
						rdf:resource="{concat($URI,'metiers/',code_noeud)}" />
				</xsl:for-each>
			</skos:ConceptScheme>
			<xsl:apply-templates />
		</rdf:RDF>
	</xsl:template>


	<xsl:template
		match="item_arborescence[string-length(code_noeud) 
		&lt;= 3]">
		<skos:Collection
			rdf:about="{concat($URI,'metiers/',code_noeud)}">
			<skos:inScheme rdf:resource="{concat($URI,'metiers')}" />
			<skos:notation>
				<xsl:value-of select="code_noeud" />
			</skos:notation>
			<skos:prefLabel xml:lang="fr">
				<xsl:value-of select="libelle" />
			</skos:prefLabel>
			<dcterms:identifier>
				<xsl:value-of select="code_ogr" />
			</dcterms:identifier>

			<xsl:variable name="code_noeud_id">
				<xsl:value-of select="code_noeud" />
			</xsl:variable>
			<xsl:for-each select="following::code_noeud">
				<xsl:variable name="code_pere_noeud">
					<xsl:value-of select="parent::*/code_pere[1]" />
				</xsl:variable>
				<xsl:if test="$code_pere_noeud = $code_noeud_id">
					<skos:member rdf:resource="{concat($URI,'metiers/',.)}" />
				</xsl:if>
			</xsl:for-each>
		</skos:Collection>
	</xsl:template>


	<!-- match chaque code noeud et ses fils -->
	<xsl:template
		match="item_arborescence[string-length(code_noeud) 
		> 3 and code_noeud != 'Racine AP' and code_noeud != 'Racine AR']">
		<skos:Concept
			rdf:about="{concat($URI,'metiers/',code_noeud)}">
			<rdf:type
				rdf:resource="{concat('http://data.sparna.fr/ontologies/rome#','FicheEmploiMetier')}" />
			<skos:inScheme rdf:resource="{concat($URI,'metiers')}" />
			<xsl:value-of select="parent::code_noeud" />
			<skos:notation>
				<xsl:value-of select="code_noeud" />
			</skos:notation>
			<skos:prefLabel xml:lang="fr">
				<xsl:value-of select="libelle" />
			</skos:prefLabel>
			<dcterms:identifier>
				<xsl:value-of select="code_ogr" />
			</dcterms:identifier>
		</skos:Concept>
	</xsl:template>



	<xsl:template match="text()"></xsl:template>

</xsl:stylesheet>