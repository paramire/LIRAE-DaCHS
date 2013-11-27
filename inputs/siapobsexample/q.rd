<?xml version="1.0" encoding="iso-8859-1"?>

<resource schema="siapobsexample">
  <meta name="title">SIAP ObcCoreDM Examples</meta>
  <meta name="creationDate">2013-11-26T14:59:00Z</meta>
  <meta name="description" format="plain">
    LIRAE GROUP
    SIAP ObsCoreDM Ejemplo
    Probar implementar una tabla Simple Image Access Protocol, junto con una tabla ObsCore
  </meta>
  <meta name="copyright">Free to use.</meta>
  <meta name="creator.name">Patricio Ramirez</meta>
  <meta name="subject">Ejemplo</meta>
  <meta name="facility">The Dispair Telescope</meta>

  <meta name="coverage">
    <meta name="waveband">Optical</meta>
  </meta>
  <meta name="content.type">Catalog</meta>

	<table id="spe" onDisk="True" adql="True">
		<mixin>
			//siap#pgs
		</mixin>

		<meta name="description">
		  Ejemplo SIAP+ObsCore.
		</meta>

		<!--DESCRIPTION-->
		<column name="bbox" type="box"
		  unit="deg"
		  description="Bounding box for the extinction data"/>
		<!--SCS Cone columns-->
		<column name="object"
			 type="text"
			 ucd="meta.id"
			 tablehead="Object"
			 description="Object"
			 verbLevel="1"/>
		<column name="centerAlpha"
		  required="True"
		  ucd="pos.eq.ra;meta.main" unit="deg"
		  tablehead="RA"
		  description="Area center RA ICRS"
		  verbLevel="1"/>
		<column name="centerDelta"
		  required="True"
		  ucd="pos.eq.dec;meta.main" unit="deg"
		  tablehead="Dec"
		  description="Area center Declination ICRS"
		  verbLevel="1"/>

	</table>

	<data id="import_content">
			<!--RECURSOS FITs-->
			<sources recurse="True">
				<pattern> res/*.fits </pattern>
			</sources>

			<!--SERVICIO TAP-->
			<!-- qnd: Hack para hacer fitsProdGrammar mas rapido-->
			<!-- Al utilizar productos es necesario //products#define rowgen(generador de columnas?)-->
			<fitsProdGrammar qnd="True">
				<!-- FALTA MAP FITS -->
				<rowfilter procDef="__system__/products#define">
						<bind key="table">"siapobsexample.spe"</bind>
				</rowfilter>
			</fitsProdGrammar>

    	<!--SERVICIO TAP-->
    	<register services="__system__/tap#run"/>

	    <make table="spe">
	      <rowmaker id="build_spe" idmaps="*">
	      	<apply procDef="//siap#computePGS"/>
    			<apply procDef="//siap#setMeta">
    				<!-- Falta como completar info -->
    				<bind name="bandpassId">vars["FILTER"]</bind>
    				<bind name="dateObs">vars["dateObs"]+vars["startTime"]+(
        vars["endTime"]-vars["startTime"])/2</bind>
    				<bind name="instrument">"%s, %s"%(vars["OBSERVAT"],
        vars["TELESCOP"])</bind>
    				<bind name="title"> vars["imageTitle"]</bind>
	      	</apply>
	      </rowmaker>
	    </make>
  	</data>




  	<!--Servicio, Publicación-->
  	<service id="cone" allowed="form">
	    <meta name="shortName">lmcextinct Siap</meta>
	    <meta name="title">"Sample image access"</meta>
  		<meta name="testQuery.pos.ra">230.444</meta>
  		<meta name="testQuery.pos.dec">52.929</meta>
  		<meta name="testQuery.size.ra">0.1</meta>
  		<meta name="testQuery.size.dec">0.1</meta>
	  	<publish render="siap.xml" sets="local"/>
  		<publish render="form" sets="local" />

	  	<!-- CORES -->
			<dbCore id="query_images" queriedTable="spe">
			  <condDesc original="//siap#protoInput"/>
			  <condDesc original="//siap#humanInput"/>
			  <condDesc buildFrom="dateObs"/>
			  <condDesc buildFrom="bandpassId" />
			  <condDesc>
			    <inputKey name="object" type="text"
			        tablehead="Target Object"
			        description="Object being observed, Simbad-resolvable form"
			        ucd="meta.name" verbLevel="5" required="True">
			        <values fromdb="object FROM siapobsexample.spe"/>
			    </inputKey>
			  </condDesc>
			</dbCore>
  	</service>
</resource>
