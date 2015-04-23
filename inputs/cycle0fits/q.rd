<?xml version="1.0" encoding="iso-8859-1"?>
<resource schema="cycle0fits">
  <meta name="title">ALMA Cycle 0 FITS</meta>
  <meta name="creationDate">2015-03-19T18:01:00Z</meta>
  <meta name="description" format="plain">
    This resource contains the fits files generated by the ALMA pipeline
    for Cycle 0. Only public data is published here.
  </meta>
  <meta name="copyright">Free to use.</meta>
  <meta name="creator.name">ALMA</meta>
  <meta name="creator.logo">http://www.eso.org/public/archives/logos/screen/alma-logo.jpg</meta>
  <meta name="subject">Millimiter/submillimiter Astronomy</meta>
  <meta name="facility">ALMA OSF</meta>

	<table id="cycle0" onDisk="True" adql="True">
		<mixin
			calibLevel="3"
			collectionName="'ALMA CYCLE0 FITS'"
			dec="s_dec"
			ra="s_ra"
			targetName="target_name"
			productType="'cube, image'"
			oUCD="'phot.flux.density.sb'"
			facilityName="'ALMA'"
			instrumentName="'ALMA'"	>
			//obscore#publishSIAP
		</mixin>
		<mixin>
			//siap#pgs
		</mixin>
		<mixin>
			//scs#q3cindex
		</mixin>
		<!--DESCRIPTION-->
		<meta name="description">
		  ALMA CYCLE0 FITS
		</meta>
		<column name="target_name" type="text"
			description="Targeted observation"
			utype="obscore:target.name" ucd="meta.id;meta.main"
			verbLevel="15">
			<property name="std">1</property>
		</column>
		<column name="s_ra"
		  ucd="pos.eq.ra;meta.main"
		  tablehead="RA"
		  description="Right Ascension"
		  verbLevel="10"/>
		<column name="s_dec"
		  ucd="pos.eq.dec;meta.main"
		  tablehead="Dec"
		  description="Declination"
		  verbLevel="10"/>
	</table>

  <rowmaker id="build_fits">
  	<map dest="target_name">@OBJECT</map>
		<map dest="s_dec">@CRVAL1</map>
		<map dest="s_ra">@CRVAL2</map>
		<apply procDef="//siap#computePGS"/>
		<apply procDef="//siap#setMeta">
			<bind name="title">@OBJECT</bind>
			<bind name="instrument">"ALMA/CASA"</bind>
			<bind name="dateObs">@DATE_OBS</bind>
		</apply>
  </rowmaker>

	<data id="import_content">
		<sources pattern="*.fits"/>
		<fitsProdGrammar qnd="True">
			<maxHeaderBlocks>326</maxHeaderBlocks>
			<rowfilter procDef="__system__/products#define">
				<bind key="table">"alma-fits.cycle0"</bind>
			</rowfilter>
		</fitsProdGrammar>

		<register services="__system__/tap#run"/>
		<make table="cycle0" rowmaker="build_fits"/>
	</data>

	<service id="siap-cycle0-fits" allowed="form,siap.xml">
	    <meta name="shortName">SIAP ALMA CYCLE0 FITS</meta>
	    <meta name="title">Sample Image Access for ALMA Cycle 0 Fits</meta>
	  	<meta name="sia.type">pointed</meta>
		<meta name="testQuery.pos.ra">0.8</meta>
		<meta name="testQuery.size.ra">0.8</meta>
		<publish render="siap.xml" sets="local,ivo_managed"/>
 		<publish render="form" sets="local"/>
		
		<dbCore id="query_images" queriedTable="cycle0">
		  <condDesc original="//siap#protoInput"/>
		  <condDesc original="//siap#humanInput"/>
		</dbCore>
 	</service>

 	<service id="scs-cycle0-fits" allowed="form,scs.xml">
  	<meta name="shortName">SCS ALMA CYCLE0 FITS</meta>
        <meta name="title">Simple Cone Search for ALMA Cycle 0 Fits</meta>
    	<meta name="testQuery.ra">0.01</meta>
	<meta name="testQuery.dec">0.01</meta>
	<dbCore queriedTable="cycle0">
			<condDesc original="//scs#humanInput"/>
			<condDesc original="//scs#protoInput"/>
    </dbCore>
    <publish render="scs.xml" sets="local,ivo_managed"/>
    <publish render="form" sets="local"/>
  </service>
</resource>
