<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="/">
    <div id="container">
      <ul id="tree" class="nav nav-list">
        <xsl:apply-templates select="Book/Articles" />
      </ul>
    </div>
  </xsl:template>

  <xsl:template name="articleLink">
    <xsl:choose>
      <xsl:when test="@link = '#'">
        <strong class="articles-folder">
          <xsl:value-of select = "@name" />
        </strong>
      </xsl:when>
      <xsl:when test="@link = 'X'">
        <i class="not-active">
          <xsl:value-of select = "@name" />
        </i>
      </xsl:when>
      <xsl:otherwise>
        <a href="{@link}" target="_blank">
          <xsl:value-of select = "@name" />
        </a>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="Nodes[Article]">
    <xsl:apply-templates select="Article" />
  </xsl:template>

  <xsl:template match="Nodes[not(Article)]" />

  <xsl:template match="Article[(Nodes)]">
    <li class="tree-node tree-toggler nav-header">
      <div class="tree-nav-node pointer" data-toggle="collapse" data-target="{concat('#ArticleNode', @id)}" onclick="{concat('javascript:toggle(ExpanderArrow', @id, ');')}">
        <span class="glyphicon glyphicon-chevron-right" id="{concat('ExpanderArrow', @id)}">
          <xsl:text> </xsl:text>
        </span>
        <xsl:call-template name="articleLink" />
      </div>
      <ul class="nav nav-list tree collapse" id="{concat('ArticleNode', @id)}">
        <xsl:apply-templates select="Nodes" />
        <xsl:text> </xsl:text>
      </ul>
    </li>
  </xsl:template>

  <xsl:template match="Article[not(Nodes)]">
    <li class="tree-node tree-toggler nav-header">
      <div class="tree-nav-node pointer">
        <xsl:call-template name="articleLink" />
      </div>
    </li>
  </xsl:template>
</xsl:stylesheet>

