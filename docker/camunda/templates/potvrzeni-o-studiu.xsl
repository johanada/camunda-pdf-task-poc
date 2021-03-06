<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format"
                xmlns:barcode="org.krysalis.barcode4j.xalan.BarcodeExt" xmlns:common="http://exslt.org/common"
                xmlns:xalan="http://xml.apache.org" version="1.1" exclude-result-prefixes="barcode common xalan">
    <xsl:template match="request">
        <fo:root xml:lang="en-uk" xmlns:fo="http://www.w3.org/1999/XSL/Format" font-family="FreeMono">

            <fo:layout-master-set>
                <fo:simple-page-master master-name="A4" page-width="210mm" page-height="297mm" margin-top="0.5cm"
                                       margin-bottom="1cm" margin-left="2.75cm" margin-right="1.5cm">
                    <fo:region-body margin-top="18mm" precedence="true"/>
                    <fo:region-before extent="2cm"/>
                    <fo:region-after/>
                    <!--<fo:region-start  extent="2cm"/>-->
                    <!--<fo:region-end    extent="2cm"/>-->
                </fo:simple-page-master>
            </fo:layout-master-set>

            <fo:page-sequence master-reference="A4">

                <!-- Definice hlavního obsahu dokumentu -->
                <fo:flow flow-name="xsl-region-body">
                    <fo:block font-size="12pt" text-align="left" space-before="1mm" space-after="1mm">
                        Vysoká škola: České vysoké učení technické v Praze
                    </fo:block>
                    <fo:block font-size="12pt" text-align="left" space-before="1mm" space-after="1mm">
                        Fakulta elektrotechnická
                    </fo:block>
                    <fo:block font-size="12pt" text-align="left" space-before="1mm" space-after="1mm">
                        Jméno a příjmení:
                        <fo:inline font-weight="bold">
                            <xsl:value-of select="studentName"/>
                        </fo:inline>
                    </fo:block>
                    <fo:block font-size="12pt" space-before="1mm">Datum narození:
                        <fo:inline font-weight="bold">
                            <xsl:value-of select="studentDateOfBirth"/>
                        </fo:inline>
                    </fo:block>
                    <fo:block font-size="12pt" space-before="1mm">Místo narození:
                        <xsl:value-of select="studentPlaceOfBirth"/>
                    </fo:block>
                    <fo:block font-weight="bold" font-size="14pt" space-after="2mm" text-align="center"
                              padding-left="1.5mm" padding-before="5mm">
                        POTVRZENÍ O STUDIU
                    </fo:block>

                    <fo:block font-size="12pt" text-align="left" space-before="2mm" space-after="1mm">
                        <fo:inline font-weight="bold">
                            <xsl:value-of select="studentName"/>
                        </fo:inline>
                        je od
                        <fo:inline font-weight="bold">
                            <xsl:value-of select="startDate"/>
                        </fo:inline>
                        do
                        <fo:inline font-weight="bold">
                            <xsl:value-of select="endDate"/>
                        </fo:inline>
                        studentem/kou
                        <xsl:value-of select="studyForm"/> formy
                        <xsl:value-of select="studyType"/> studia ve studijním programu
                        <xsl:value-of select="programme"/> v oboru <xsl:value-of select="field"/>.
                    </fo:block>
                    <fo:table space-before="1.5cm">
                        <fo:table-column column-number="1" column-width="100mm"/>
                        <fo:table-column column-number="2" column-width="40mm"/>
                        <fo:table-body>
                            <fo:table-row>
                                <fo:table-cell>
                                    <fo:block font-size="12pt">V Praze ..................</fo:block>
                                </fo:table-cell>
                                <fo:table-cell>
                                    <fo:block font-size="12pt">
                                        ..........................
                                    </fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                        </fo:table-body>
                    </fo:table>
                    <fo:table>
                        <fo:table-column column-number="1" column-width="109mm"/>
                        <fo:table-column column-number="2" column-width="40mm"/>
                        <fo:table-body>
                            <fo:table-row>
                                <fo:table-cell>
                                    <fo:block font-size="12pt"></fo:block>
                                </fo:table-cell>
                                <fo:table-cell>
                                    <fo:block font-size="12pt" text-align="center">razítko, podpis</fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                        </fo:table-body>
                    </fo:table>
                    <fo:block font-size="8pt" padding-before="15px" text-align="center">
                        Žádost byla studentem vygenerována prostřednictvím systému eProcesy. Tento dokument byl vygenerován
                        <xsl:value-of select="documentGeneratedDate"/>
                    </fo:block>


                    <fo:block font-size="12pt" text-align="left" space-before="6cm" space-after="1mm">
                        Vysoká škola: České vysoké učení technické v Praze
                    </fo:block>
                    <fo:block font-size="12pt" text-align="left" space-before="1mm" space-after="1mm">
                        Fakulta elektrotechnická
                    </fo:block>
                    <fo:block font-size="12pt" text-align="left" space-before="1mm" space-after="1mm">
                        Jméno a příjmení:
                        <fo:inline font-weight="bold">
                            <xsl:value-of select="studentName"/>
                        </fo:inline>
                    </fo:block>
                    <fo:block font-size="12pt" space-before="1mm">Datum narození:
                        <fo:inline font-weight="bold">
                            <xsl:value-of select="studentDateOfBirth"/>
                        </fo:inline>
                    </fo:block>
                    <fo:block font-size="12pt" space-before="1mm">Místo narození:
                        <xsl:value-of select="studentPlaceOfBirth"/>
                    </fo:block>
                    <fo:block font-weight="bold" font-size="14pt" space-after="2mm" text-align="center"
                              padding-left="1.5mm" padding-before="5mm">
                        POTVRZENÍ O STUDIU
                    </fo:block>


                    <fo:block font-size="12pt" text-align="left" space-before="2mm" space-after="1mm">
                        <fo:inline font-weight="bold">
                            <xsl:value-of select="studentName"/>
                        </fo:inline>
                        je od
                        <fo:inline font-weight="bold">
                            <xsl:value-of select="startDate"/>
                        </fo:inline>
                        do
                        <fo:inline font-weight="bold">
                            <xsl:value-of select="endDate"/>
                        </fo:inline>
                        studentem/kou
                        <xsl:value-of select="studyForm"/> formy
                        <xsl:value-of select="studyType"/> studia ve studijním programu
                        <xsl:value-of select="programme"/> v oboru <xsl:value-of select="field"/>.
                    </fo:block>
                    <fo:table space-before="1.5cm">
                        <fo:table-column column-number="1" column-width="100mm"/>
                        <fo:table-column column-number="2" column-width="40mm"/>
                        <fo:table-body>
                            <fo:table-row>
                                <fo:table-cell>
                                    <fo:block font-size="12pt">V Praze ...................</fo:block>
                                </fo:table-cell>
                                <fo:table-cell>
                                    <fo:block font-size="12pt">
                                        ........................
                                    </fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                        </fo:table-body>
                    </fo:table>
                    <fo:table>
                        <fo:table-column column-number="1" column-width="109mm"/>
                        <fo:table-column column-number="2" column-width="40mm"/>
                        <fo:table-body>
                            <fo:table-row>
                                <fo:table-cell>
                                    <fo:block font-size="12pt"></fo:block>
                                </fo:table-cell>
                                <fo:table-cell>
                                    <fo:block font-size="12pt" text-align="center">razítko, podpis</fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                        </fo:table-body>
                    </fo:table>
                    <fo:block font-size="8pt" padding-before="15px" text-align="center">
                        Žádost byla studentem vygenerována prostřednictvím systému eProcesy. Tento dokument byl vygenerován
                        <xsl:value-of select="documentGeneratedDate"/>
                    </fo:block>
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>
</xsl:stylesheet>