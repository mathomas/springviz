<?xml version="1.0" encoding="UTF-8"?>

<!--
  - An XSLT stylesheet that converts a Spring bean config file into a Graphviz/Dot
  - input file.  Excuse my XSLT if I'm doing something stupid herein - I'm still learning.
  -
  - @author Mike Thomas (http://www.samoht.com)
  -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text"/>


    <xsl:template match="/">
digraph G {
    graph [ ratio="0.6" ];
    node  [ shape=box, style=filled, fontname=helvetica, fontsize="16" ];
    edge  [ ];
        <xsl:apply-templates select="beans/bean"/>
        <xsl:apply-templates select="beans/bean/property//ref"/>
        <xsl:apply-templates select="beans/bean/property/@ref"/>
 }
    </xsl:template>


    <!-- Generates all the nodes so that their attributes can be set -->
    <xsl:template match="bean">
        <!-- I don't want to include my project's "field" definitions. -->
        <xsl:if test="@id and not(contains(@id, 'Field'))">

            <!-- Start the bean node.  Singletons get a double border -->
            <xsl:text>"</xsl:text>
            <xsl:value-of select="@id"/>
            <xsl:text>"</xsl:text>
            <xsl:text> [</xsl:text>
            <xsl:if test="@singleton != 'false'">peripheries=2, </xsl:if>

            <!--
            "Colorize" the graph.  Change this according to your project's needs and conventions.
            I find it useful to use colors from the same family for components within the same "layer"
            -->
            <xsl:choose>
                <xsl:when test="contains(@id, 'Controller')">color=gold3</xsl:when>
                <xsl:when test="contains(@id, 'Form')">color=gold2</xsl:when>
                <xsl:when test="contains(@id, 'Validator')">color=gold1</xsl:when>
                <xsl:when test="contains(@id, 'FieldSource')">color=gold</xsl:when>

                <xsl:when test="contains(@id, 'Service')">color=steelblue3</xsl:when>
                <xsl:when test="contains(@id, 'DAO') or contains(@id, 'Dao')">color=steelblue1</xsl:when>
                <xsl:when test="contains(@id, 'DataSource') or contains(@id, 'dataSource')">fontcolor=white, color=steelblue4</xsl:when>

                <xsl:when test="contains(@id, 'Manager')">fontcolor=white, color=paleturquoise4</xsl:when>
                <xsl:when test="contains(@id, 'Factory')">fontcolor=white, color=paleturquoise4</xsl:when>

                <xsl:when test="contains(@id, 'Task')">color=springgreen3</xsl:when>
                <xsl:when test="contains(@id, 'EventHandler')">color=springgreen2</xsl:when>
                <xsl:when test="contains(@id, 'Message')">color=springgreen</xsl:when>

                <xsl:when test="contains(@id, 'Bridge')">color=orchid2</xsl:when>
                <xsl:when test="contains(@id, 'velocity')">color=wheat3</xsl:when>
            </xsl:choose>

            <xsl:text>];
            </xsl:text>
        </xsl:if>
    </xsl:template>


    <xsl:template match="ref">
        <xsl:text>"</xsl:text>
        <xsl:value-of select="ancestor::bean/@id"/>
        <xsl:text>"</xsl:text>
        <xsl:text> -&gt; </xsl:text>
        <xsl:text>"</xsl:text>
        <xsl:value-of select="@bean"/>
        <xsl:value-of select="@local"/>
        <xsl:text>"</xsl:text>
        <xsl:text> [</xsl:text>
        <xsl:if test="@bean">style=dotted</xsl:if>
        <xsl:text>];</xsl:text>
        <xsl:text>
        </xsl:text>
    </xsl:template>

    <xsl:template match="@ref">
        <xsl:text>"</xsl:text>
        <xsl:value-of select="ancestor::bean/@id"/>
        <xsl:text>"</xsl:text>
        <xsl:text> -&gt; </xsl:text>
        <xsl:text>"</xsl:text>
        <xsl:value-of select="."/>
        <xsl:text>"</xsl:text>
        <xsl:text> [</xsl:text>
        <xsl:text>];</xsl:text>
        <xsl:text>
        </xsl:text>
    </xsl:template>

</xsl:stylesheet>
