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

	<xsl:template match="ogr">
		<rdf:RDF>
			<xsl:if
				test="item_referentiel_env_travail[libelle_environnement='CONDITIONS']">
				<skos:ConceptScheme
					rdf:about="{concat($URI,lower-case(../libelle_environnement))}">
					<skos:prefLabel xml:lang="fr">Code ROME - Conditions</skos:prefLabel>
					<xsl:for-each select="item_referentiel_env_travail">
						<xsl:if test="libelle_environnement='CONDITIONS'">
							<skos:hasTopConcept
								rdf:resource="{concat($URI,lower-case(libelle_environnement),'/',code_ogr)}" />
						</xsl:if>
					</xsl:for-each>
				</skos:ConceptScheme>
			</xsl:if>
			<xsl:if
				test="item_referentiel_env_travail[libelle_environnement='SECTEURS']">
				<skos:ConceptScheme
					rdf:about="{concat($URI,lower-case(../libelle_environnement))}">
					<skos:prefLabel xml:lang="fr">Code ROME - Secteurs</skos:prefLabel>
					<xsl:for-each select="item_referentiel_env_travail">
						<xsl:if test="libelle_environnement='SECTEURS'">
							<skos:hasTopConcept
								rdf:resource="{concat($URI,lower-case(libelle_environnement),'/',code_ogr)}" />
						</xsl:if>
					</xsl:for-each>
				</skos:ConceptScheme>
			</xsl:if>
			<xsl:if
				test="item_referentiel_env_travail[libelle_environnement='STRUCTURES']">
				<skos:ConceptScheme
					rdf:about="{concat($URI,lower-case(libelle_environnement))}">
					<skos:prefLabel xml:lang="fr">Code ROME - Structures</skos:prefLabel>
					<xsl:for-each select="item_referentiel_env_travail">
						<xsl:if test="libelle_environnement='STRUCTURES'">
							<skos:hasTopConcept
								rdf:resource="{concat($URI,lower-case(libelle_environnement),'/',code_ogr)}" />
						</xsl:if>
					</xsl:for-each>
				</skos:ConceptScheme>
			</xsl:if>
			<xsl:apply-templates />
		</rdf:RDF>
	</xsl:template>



	<xsl:template
		match="item_referentiel_env_travail/libelle_environnement">
		<rome:Competence
			rdf:about="{concat($URI,lower-case(../libelle_environnement),'/',../code_ogr)}">
			<rdf:type
				rdf:resource="http://www.w3.org/2004/02/skos/core#Concept" />
			<skos:inScheme
				rdf:resource="{concat($URI,lower-case(../libelle_environnement))}" />
			<skos:prefLabel xml:lang="fr">
				<xsl:value-of select="../libelle" />
			</skos:prefLabel>
		</rome:Competence>
	</xsl:template>




	<xsl:template match="text()"></xsl:template>

</xsl:stylesheet>