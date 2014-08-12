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
			calibLevel="calibLevel"
			collectionName="collecName"
			targetName="targetName"
			ra="sRa"
			dec="sDec"
			fov="sFov"
			coverage="sReg"
			sResolution="sRes"
			tMin="tMin"
			tMax="tMax"
			expTime="tExptime"
			tResolution="tRes"
			emMin="emMin"
			emMax="emMax"
			emResPower="emResPower"
			oUCD="oUCD"
			polStates="polStates"
			facilityName="facilityName"
			instrumentName="instName">
			//obscore#publish
		</mixin>
		<!--DESCRIPTION-->
		<meta name="description">
		  ASDM+OBSCORE
		</meta>
	</table>

  <rowmaker id="build_fits">
  	<var name="imageTitle">
  		"%s %s"%(@TELESCOP,@DATE_OBS) 
  	</var>
  	
  	<apply procDef="//siap#computePGS"/>
		<apply procDef="//siap#setMeta">
			<bind name="title">vars["imageTitle"]</bind>
			<bind name="instrument">vars["TELESCOP"]</bind>
		</apply>
		
		<map dest="centerDelta">@OBSDEC</map>
		<map dest="centerAlpha">@OBSRA</map>
  </rowmaker>

	<data id="import_content">
		<sources recurse="True" pattern="res/*.fits"/>
		<fitsProdGrammar qnd="True">
			<rowfilter procDef="__system__/products#define">
				<bind key="table"></bind>
			</rowfilter>
		</fitsProdGrammar>

		<register services="__system__/tap#run"/>
		<make table="fits" rowmaker="build_fits"/>
	</data>
</resource>