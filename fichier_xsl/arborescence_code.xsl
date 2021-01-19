<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
	xmlns:skos="http://www.w3.org/2004/02/skos/core#"
	xmlns:sparna-rome="http://data.sparna.fr/ROME/">

	<xsl:param name="URI_ROOT">http://vocabs.sparna.fr/rome/</xsl:param>

	<!-- controls output style -->
	<xsl:output method="xml" indent="yes" />

	<!-- Declaration fonctions -->

	<!-- Fonction pour declarer URI -->

	<xsl:function name="sparna-rome:URI_CODE_NOEUD">

	</xsl:function>


	<!-- fin fonctions -->

	<xsl:template match="/">
		<xsl:apply-templates />
	</xsl:template>

	<!-- Matches the root element, create our output root, and recurse on children -->
	<xsl:template match="ogr">
		<rdf:RDF>
			<xsl:apply-templates />
		</rdf:RDF>
	</xsl:template>

	<!-- match chaque code noeud et ses fils -->
	<xsl:template match="item_arborescence[string-length(code_noeud) > 3 and code_noeud != 'Racine AP' and code_noeud != 'Racine AR']">
	
	
		<skos:Concept rdf:about="{concat($URI_ROOT, code_noeud)}">
			<xsl:value-of select="parent::code_noeud" />
			<skos:prefLabel xml:lang="fr">
				<xsl:value-of select="libelle" />
			</skos:prefLabel>
		</skos:Concept>
	</xsl:template>

	<xsl:template match="item_arborescence[string-length(code_noeud) &lt;= 3]">	
		<skos:Collection rdf:about="{concat($URI_ROOT, code_noeud)}">
			<skos:prefLabel xml:lang="fr">
				<xsl:value-of select="libelle" />
			</skos:prefLabel>
		</skos:Collection>
	</xsl:template>
	
	<xsl:template match="text()"></xsl:template>

</xsl:stylesheet>