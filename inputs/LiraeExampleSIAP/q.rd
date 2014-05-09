<?xml version="1.0" encoding="iso-8859-1"?>

<resource schema="lmcext2">
  <meta name="title">Extinction within the LMC</meta>
  <meta name="creationDate">2013-06-04T14:59:00Z</meta>
  <meta name="description" format="plain">
    LIRAE GROUP...
  </meta>
  <meta name="copyright">Free to use.</meta>
  <meta name="creator.name">Patricio Ramirez, S.; Other, A.</meta>

  <meta name="subject">Prueba</meta>

  <meta name="coverage">
    <meta name="waveband">Optical</meta>
  </meta>

  <meta name="content.type">Catalog</meta>

	<table id="ext2" onDisk="True" adql="True">
		<mixin>
		//siap#pgs
		</mixin>
		<meta name="description">
		  Tabla prueba SIAP Lirae 
		</meta>
	</table>
	<!--<publish service="lmcextinct/q#exts" />-->
	<data id="import_content">
		<sources recurse="True" pattern="resources/images/*.cut.fits" />
	  <fitsProdGrammar qnd="True">

	    <sourceFields procDef="insertFieldKey"/>
	      <map src="PI-COI">PI_COI</map>
	    </mapKeys>

	    <rowfilter procDef="//products#define">
	      <bind key="table">"cars.images"</bind>
	    </rowfilter>
	  </fitsProdGrammar>

	  <rowmaker id="make_image" idmaps="*">
	    <apply procDef="//siap#computePGS"/>
	    <apply procDef="//siap#setMeta">
	      <bind key="title">vars["imageTitle"]</bind>
	      <bind key="instrument">"%s, %s"%(vars["OBSERVAT"],
	        vars["TELESCOP"])</bind>
	      <bind key="dateObs">vars["dateObs"]+vars["startTime"]+(
	        vars["endTime"]-vars["startTime"])/2</bind>
	      <bind key="bandpassId">vars["FILTER"]</bind>
	    </apply>
	  </rowmaker>

  	<make table="images" rowmaker="make_images"/>
	 </data>


	<service id="im" allowed="siap.xml,form" core="query_image">
	  <meta name="shortName">Example Images</meta>
		<meta name="title">Sample Image Archive</meta>
  	<meta name="sia.type">Pointed</meta>
	  
	  <dbCore queriedTable="query_images" queriedTable="main">
			<condDesc original="//siap#humanInput"/>
			<condDesc original="//siap#protoInput"/>
			<condDesc buildFrom="dateObs"/>
 			<condDesc buildFrom="bandpassId" />
  		<condDesc>
    		<inputKey name="object" type="text"
        	tablehead="Target Object"
        	description="Object being observed, Simbad-resolvable form"
        	ucd="meta.name" verbLevel="5" required="True">
        	<values fromdb="object FROM lensunion.main"/>
    		</inputKey>
  		</condDesc>
	  </dbCore>

	  <publish render="siap.xml" sets="local"/>
	  <publish render="form" sets="local"/>
	</service>
</resource>
