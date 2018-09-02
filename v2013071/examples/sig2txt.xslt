<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:SCRIPT="http://www.ncpdp.org/schema/SCRIPT" xmlns:ecl="http://www.ncpdp.org/schema/ecl" xmlns:samples="http://www.ncpdp.org/schema/samples" xmlns:specialized="http://www.ncpdp.org/schema/specialized" xmlns:structures="http://www.ncpdp.org/schema/structures" xmlns:transport="http://www.ncpdp.org/schema/Transport" xmlns:datatypes="http://www.ncpdp.org/schema/datatypes">
<xsl:output method="text"/>
	<xsl:template match="/">        
		<xsl:apply-templates select="/structures:Sig/structures:Instruction | /structures:Sig/structures:MultipleInstructionModifier"/>
		<xsl:apply-templates select="/structures:Sig/structures:IndicationForUse"/>
		<xsl:apply-templates select="/structures:Sig/structures:MaximumDoseRestriction"/>
		<xsl:apply-templates select="/structures:Sig/structures:ClarifyingFreeText"/>
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="structures:Instruction">
		<xsl:apply-templates select="structures:InstructionIndicator"/>
		<xsl:apply-templates select="structures:AdministrationIndicator"/>
		<xsl:apply-templates select="structures:DoseAdministration"/>
		<xsl:apply-templates select="structures:TimingAndDuration|structures:MultipleTimingModifier"/>
		<xsl:apply-templates select="structures:IndicationForUse"/>
	</xsl:template>
	<xsl:template match="structures:DoseAdministration">
		<xsl:apply-templates select="structures:DoseDeliveryMethod"/>
		<xsl:apply-templates select="structures:Dosage"/>
		<xsl:apply-templates select="structures:DoseAmount"/>
		<xsl:apply-templates select="structures:DoseForm"/>
		<xsl:apply-templates select="structures:Vehicle"/>
		<xsl:apply-templates select="structures:RouteOfAdministration"/>
		<xsl:apply-templates select="structures:SiteOfAdministration"/>
		<xsl:apply-templates select="structures:SiteOfAdministrationClarifyingFreeText"/>
	</xsl:template>
	<xsl:template match="structures:DoseDeliveryMethod">
		<xsl:value-of select="datatypes:Text"/>
		<xsl:text> </xsl:text>
	</xsl:template>
	<xsl:template match="structures:Dosage">
		<xsl:value-of select="structures:DoseQuantity[1] "/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="structures:DoseRangeModifier"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="structures:DoseQuantity[2]"/>
		<xsl:text> </xsl:text>
	</xsl:template>
	<xsl:template match="structures:DoseForm">
		<xsl:value-of select="datatypes:Text"/>
		<xsl:text> </xsl:text>
	</xsl:template>
	<xsl:template match="structures:Vehicle">
		<xsl:value-of select="structures:VehiclePreposition/datatypes:Text"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="structures:VehicleQuantity[1]"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="structures:MultipleVehicleModifier"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="structures:VehicleQuantity[2]"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="structures:VehicleUnitOfMeasure/datatypes:Text"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="structures:Vehicle/datatypes:Text"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="structures:ClarifyingFreeText"/>
		<xsl:text> </xsl:text>
	</xsl:template>
	<xsl:template match="structures:DoseAmount">
		<xsl:value-of select="datatypes:Text"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="../structures:DoseClarifyingFreeText"/>
	</xsl:template>
	<xsl:template match="structures:RouteOfAdministration">
		<xsl:value-of select="datatypes:Text"/>
		<xsl:text> </xsl:text>
	</xsl:template>
	<xsl:template match="structures:SiteOfAdministration">
		<xsl:value-of select="datatypes:Text"/>
		<xsl:text> </xsl:text>
	</xsl:template>
	<xsl:template match="structures:SiteOfAdministrationClarifyingFreeText">
		<xsl:value-of select="."/>
		<xsl:text> </xsl:text>
	</xsl:template>
	<xsl:template match="structures:TimingAndDuration">
		<xsl:apply-templates select="structures:ManufacturerPackageLabelTiming"/>
		<xsl:apply-templates select="structures:AdministrationTiming"/>
		<xsl:apply-templates select="structures:Frequency"/>
		<xsl:apply-templates select="structures:RateOfAdministration"/>
		<xsl:apply-templates select="structures:Interval"/>
		<xsl:apply-templates select="structures:Duration"/>
		<xsl:apply-templates select="structures:Until"/>
	</xsl:template>
	<xsl:template match="structures:MultipleTimingModifier">
		<xsl:text> </xsl:text>
		<xsl:value-of select="."/>
		<xsl:text> </xsl:text>
	</xsl:template>
	<xsl:template match="structures:MultipleInstructionModifier">
		<xsl:text> </xsl:text>
		<xsl:value-of select="."/>
		<xsl:text> </xsl:text>
	</xsl:template>
	<xsl:template match="structures:AdministrationTiming">
	<xsl:value-of select="structures:AdministrationTimingNumericValue[1]"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="structures:VariableAdministrationTimingModifier"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="structures:AdministrationTimingNumericValue[2]"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="structures:AdministrationTimingUnits/datatypes:Text"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="structures:AdministrationTimingModifier/datatypes:Text"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="structures:AdministrationTimingEvent/datatypes:Text"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="structures:AdministrationTimingClarifyingFreeText"/>
		<xsl:text> </xsl:text>
	</xsl:template>
	<xsl:template match="structures:Frequency">
		<xsl:value-of select="structures:FrequencyNumericValue[1]"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="structures:VariableFrequencyModifier"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="structures:FrequencyNumericValue[2]"/>
		<xsl:text>TIMES </xsl:text>
		<xsl:value-of select="structures:FrequencyUnits/datatypes:Text"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="../structures:TimingClarifyingFreeText"/>
		<xsl:text> </xsl:text>
	</xsl:template>
	<xsl:template match="structures:Interval">
		<xsl:text>EVERY </xsl:text>
		<xsl:value-of select="structures:IntervalNumericValue[1]"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="structures:VariableIntervalModifier"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="structures:IntervalNumericValue[2]"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="structures:IntervalUnits/datatypes:Text"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="../structures:TimingClarifyingFreeText"/>
		<xsl:text> </xsl:text>
	</xsl:template>
	<xsl:template match="structures:RateOfAdministration">
		<xsl:value-of select="structures:RateOfAdministration"/>
		<xsl:value-of select="structures:RateUnitOfMeasure/datatypes:Text"/>
		<xsl:value-of select="structures:TimePeriodBasis/datatypes:Text"/>
		<xsl:value-of select="../structures:TimingClarifyingFreeText"/>
	</xsl:template>
	<xsl:template match="structures:Duration">
		<xsl:text> FOR </xsl:text>
		<xsl:value-of select="structures:DurationNumericValue"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="structures:DurationText/datatypes:Text"/>
		<xsl:text> </xsl:text>
	</xsl:template>
	<xsl:template match="structures:Until">
		<xsl:value-of select="structures:Trigger"/>
		<xsl:value-of select="structures:DurationClarifyingFreeText/datatypes:Text"/>
	</xsl:template>
	<xsl:template match="structures:InstructionIndicator">
		<xsl:text>USE PER MEDICAL ENCOUNTER </xsl:text>
	</xsl:template>
	<xsl:template match="structures:AdministrationIndicator">
		<xsl:text>USE PER MANUFACTURERS INSTRUCTIONS </xsl:text>
	</xsl:template>
	<xsl:template match="structures:IndicationForUse">
		<xsl:value-of select="structures:IndicationPrecursor/datatypes:Text"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="structures:Indication/datatypes:Text"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="structures:IndicationValue[1]/datatypes:Text"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="structures:IndicationVariableModifier/datatypes:Text"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="structures:IndicationValue[2]/datatypes:Text"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="structures:IndicationValueUnit/datatypes:Text"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="structures:IndicationValueUnitOfMeasure/datatypes:Text"/>
		<xsl:text> </xsl:text>
	</xsl:template>
	<xsl:template match="structures:MaximumDoseRestriction">
	 <xsl:if test="position() &gt; 1">
        <xsl:text>OR </xsl:text>
      </xsl:if>
		<xsl:text>MAXIMUM OF </xsl:text>
		<xsl:value-of select="structures:MaximumDoseRestrictionNumericValue"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="structures:MaximumDoseRestrictionForm/datatypes:Text"/>
		<xsl:value-of select="structures:MaximumDoseRestrictionUnits/datatypes:Text"/>
		<xsl:text> PER </xsl:text>
		<xsl:value-of select="structures:MaximumDoseRestrictionDurationValue"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="structures:MaximumDoseRestrictionDurationUnit/datatypes:Text"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="structures:MaximumDoseRestrictionClarifyingFreeText"/>
		<xsl:text> </xsl:text>
	</xsl:template>
	<xsl:template match="structures:ClarifyingFreeText">
		<xsl:text>, </xsl:text>
		<xsl:value-of select="."/>
		<xsl:text> </xsl:text>
	</xsl:template>
	<xsl:template match="*|/" mode="#all">
		<xsl:apply-templates mode="#current"/>
	</xsl:template>
	<xsl:template match="text()|@*" mode="#all">
		<xsl:apply-templates mode="#current"/>
	</xsl:template>
</xsl:stylesheet>
