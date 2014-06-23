<?xml version="1.0" encoding="iso-8859-1"?>
<resource schema="obscoreASDM">
  <meta name="title">ObsCore+ASDM</meta>
  <meta name="creationDate">2014-05-23T14:51:00Z</meta>
  <meta name="description" format="plain">
    ASDM 
  </meta>
  <meta name="copyright">Free to use.</meta>
  <meta name="creator.name">ALMA</meta>
  <meta name="subject">ASM</meta>
  <meta name="facility">ALMA</meta>

	<table id="asdm" onDisk="True" adql="True">
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


	<data id="import_content">
		<!--RECURSOS FITs-->
		<sources pattern="res/*.csv"></sources>
		<sources recurse="True" pattern="res/*.fits"></sources>
			
		<!-- qnd: Hack para hacer fitsProdGrammar mas rapido-->
		<fitsProdGrammar qnd="True">
				<!-- Al utilizar productos es necesario //products#define, nos agrega ciertas culmanas a la tabla-->
				<rowfilter procDef="__system__/products#define">
					  <bind name="owner">ALMA</bind>
						<bind key="table">"obscoreasdm.asdm"</bind>
				</rowfilter>
		</fitsProdGrammar>

		<reGrammar>
			<names> calibLevel, collecName, targetName, sRa, sDec, sFov, sReg, sRes, tMin, tMax, tExptime, tResolution, emMin, emMax, emResPower, oUCD, polStates, facilityName, instName</name>
		</reGrammar>

		<!--Crea tabla en la DB -->
		<make table="asdm">
			<rowmaker id="build_asdm">
		  	<var name="calibLevel">@calibLevel</var>
		  	<var name="collecName">@collecName</var>
		  	<var name="targetName">@targetName</var>
		  	<var name="sRa">@sRa</var>
		  	<var name="sDec">@sDec</var>
		  	<var name="sFov">@sFov</var>
		  	<var name="sReg">@sReg</var>
		  	<var name="sRes">@sRes</var>
		  	<var name="tMin">@tMin</var>
		  	<var name="tMax">@tMax</var>
		  	<var name="tExptime">@tExptime</var>
		  	<var name="tResolution">@tResolution</var>
		  	<var name="emMin">@emMin</var>
		  	<var name="emMax">@emMax</var>
		  	<var name="emResPower">@emResPower</var>
		  	<var name="oUCD">@oUCD</var>
		  	<var name="polStates">@polStates</var>
		  	<var name="facilityName">@facilityName</var>
		  	<var name="instName">@instName</var>
	  	</rowmaker>
	  <make>

    	<!--SERVICIO TAP-->
    <register services="__system__/tap#run"/>
  </data>

</resource>