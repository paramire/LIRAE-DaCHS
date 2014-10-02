<?xml version="1.0" encoding="iso-8859-1"?>
<resource schema="fitsdachs">
  <meta name="title">ObsCore+FITS</meta>
  <meta name="creationDate">2014-08-12T18:01:00Z</meta>
  <meta name="description" format="plain">
    ObsCore + FITS
  </meta>
  <meta name="copyright">Free to use.</meta>
  <meta name="creator.name">ALMA</meta>
  <meta name="subject">ASDM</meta>
  <meta name="facility">ALMA</meta>

	<table id="fits" onDisk="True" adql="True">
		<mixin
			calibLevel="1"
			collectionName="'ALMA'"
			dec="s_dec"
			ra="s_ra"
			targetName="target_name"
			emResPower=""
			productType="'visibility'"
			oUCD="'em.mm'"
			facilityName="'ALMA'"
			instrumentName="'ALMA'"	>
			//obscore#publish
		</mixin>
		<!--DESCRIPTION-->
		<meta name="description">
		  ASDM+OBSCORE
		</meta>
	</table>

  <rowmaker id="build_fits">
  	<map dest="target_name">@OBJECT</map>
		<map dest="s_dec">@CRVAL1</map>
		<map dest="s_ra">@CRVAL2</map>
  </rowmaker>

	<data id="import_content">
		<sources recurse="True" pattern="res/*.fits"/>
		<fitsProdGrammar qnd="True">
			<rowfilter procDef="__system__/products#define">
				<bind key="table">fitsdachs.fits</bind>
			</rowfilter>
		</fitsProdGrammar>

		<register services="__system__/tap#run"/>
		<make table="fits" rowmaker="build_fits"/>
	</data>
</resource>