<?xml version="1.0" encoding="iso-8859-1"?>
<resource schema="asdmdachs">
  <meta name="title">ObsCore+ASDM</meta>
  <meta name="creationDate">2014-05-23T14:51:00Z</meta>
  <meta name="description" format="plain">
    ASDM 
  </meta>
  <meta name="copyright">Free to use.</meta>
  <meta name="creator.name">ALMA</meta>
  <meta name="subject">ASM</meta>
  <meta name="facility">ALMA</meta>

<STREAM id="obscore-columns">
		<column name="prodType" type="text"
			utype="obscore:obs.dataproducttype" ucd="meta.id"
			description="High level scientific classification of the data product,
				taken from an enumeration"
			verbLevel="5">
			<values>
				<option>image</option>
				<option>cube</option>
				<option>spectrum</option>
				<option>sed</option>
				<option>timeseries</option>
				<option>visibility</option>
				<option>event</option>
			</values>
			<property name="std">1</property>
		</column>

		<!--<column name="dataproduct_subtype" type="text"
			utype="obscore:obs.dataproductsubtype" ucd="meta.id"
			description="Data product specific type"
			verbLevel="15"/>-->
	
		<column name="calibLevel" type="smallint" required="True"
			utype="obscore:obs.caliblevel" ucd="meta.code;obs.calib"
			description="Amount of data processing that has been
				applied to the data"
			verbLevel="10" note="calib">
			<values>
				<option>0</option>
				<option>1</option>
				<option>2</option>
				<option>3</option>
			</values>
			<property name="std">1</property>
		</column>

		<column name="collecName" type="text"
				utype="obscore:dataid.collection" ucd="meta.id"
				description="Name of a data collection (e.g., project name) this
					data belongs to"
				verbLevel="15">
			<property name="std">1</property>
		</column>

		<column name="obsId" type="text" 
			utype="obscore:DataID.observationID" ucd="meta.id"
			description="Unique identifier for an observation"
			verbLevel="5">
			<property name="std">1</property>
		</column>

		<!--<column name="obs_title" type="text"
			utype="obscore:dataid.title" ucd="meta.title;obs"
			description="Free-from title of the data set"
			verbLevel="5"/>-->

		<!--<column name="obs_publisher_did" type="text"
			utype="obscore:curation.publisherdid" ucd="meta.ref.url;meta.curation"
			description="Dataset identifier assigned by the publisher."
			verbLevel="5">
			<property name="std">1</property>
		</column>-->

		<!--<column name="obs_creator_did" type="text"
			utype="obscore:dataid.creatordid" ucd="meta.id"
			description="Dataset identifier assigned by the creator."
			verbLevel="15"/>-->

		<!--<column name="access_url" type="text"
			utype="obscore:access.reference" ucd="meta.ref.url"
			description="The URL at which to obtain the data set."
			verbLevel="1" displayHint="type=url">
			<property name="std">1</property>
		</column>-->

		<!--<column name="access_format" type="text"
			description="MIME type of the resource at access_url"
			utype="obscore:access.format" ucd="meta.code.mime"
			verbLevel="5">
			<property name="std">1</property>
		</column>-->

		<!--<column name="access_estsize" type="bigint"
			description="Estimated size of data product"
			unit="kbyte" utype="obscore:access.size" ucd="phys.size;meta.file"
			verbLevel="5">
			<property name="std">1</property>
			<values nullLiteral="-1"/>
		</column>-->

		<column name="targetName" type="text" 
			description="Object a targeted observation targeted"
			utype="obscore:target.name" ucd="meta.id;src"
			verbLevel="15">
			<property name="std">1</property>
		</column>

		<!--<column name="target_class" type="text" 
			description="Class of the target object (star, QSO, ...)"
			utype="obscore:target.class" ucd="src.class"
			verbLevel="20">
			<property name="std">1</property>
		</column>-->

		<column name="sRa" type="double precision"
			description="RA of (center of) observation, ICRS"
			unit="deg"  ucd="pos.eq.ra"
			utype="obscore:char.spatialaxis.coverage.location.coord.position2d.value2.c1"
			verbLevel="1">
			<property name="std">1</property>
		</column>
																					 
		<column name="sDec" type="double precision"
			description="Dec of (center of) observation, ICRS"
			unit="deg" ucd="pos.eq.dec"
			utype="obscore:char.spatialaxis.coverage.location.coord.position2d.value2.c2"
			verbLevel="1">
			<property name="std">1</property>
		</column>

		<!--<column name="sFov" type="double precision"
			description="Approximate spatial extent for the region covered by the
				observation"
			unit="deg" ucd="phys.angSize;instr.fov"
			utype="obscore:char.spatialaxis.coverage.bounds.extent.diameter"
			verbLevel="5">
			<property name="std">1</property>
		</column>-->
		<column name="sFov" type="text"
			description="Approximate spatial extent for the region covered by the
				observation"
			unit="deg" ucd="phys.angSize;instr.fov"
			utype="obscore:char.spatialaxis.coverage.bounds.extent.diameter"
			verbLevel="5">
			<property name="std">1</property>
		</column>
		<!--TIENE QUE SER type="spoly"-->	
		<column name="roughCircle" type="spoly"
			description="Region covered by the observation, as a polygon"
			utype="obscore:char.spatialaxis.coverage.support.area"
			ucd="phys.angArea;obs"
			verbLevel="15">
			<property name="std">1</property>
		</column>

		<column name="sRes" type="double precision"
			description="Best spatial resolution within the data set"
			unit="arcsec"  
			utype="obscore:Char.SpatialAxis.Resolution.refval"
			ucd="pos.angResolution"
			verbLevel="15">
			<property name="std">1</property>
		</column>
		
		<column name="tMin" type="double precision"
			description="Lower bound of times represented in the data set, as MJD"
			unit="d" 
			utype="obscore:char.timeaxis.coverage.bounds.limits.interval.starttime"
			ucd="time.start;obs.exposure"
			verbLevel="10">
			<property name="std">1</property>
		</column>
																					 
		<column name="tMax" type="double precision"
			description="Upper bound of times represented in the data set, as MJD"
			unit="d" 
			utype="obscore:char.timeaxis.coverage.bounds.limits.interval.stoptime"
			ucd="time.end;obs.exposure"
			verbLevel="10">
			<property name="std">1</property>
		</column>

		<column name="tExptime" type="real"
			description="Total exporure time"
			unit="s" utype="obscore:char.timeaxis.coverage.support.extent"
			ucd="time.duration;obs.exposure"
			verbLevel="10">
			<property name="std">1</property>
		</column>
	  <!--tiene que ser type="real"-->
		<column name="tResolution" type="text" 
			description="Minimal significant time interval along the time axis"
			unit="s" utype="obscore:char.timeaxis.resolution.refval" ucd="time.resolution"
			verbLevel="15">
			<property name="std">1</property>
		</column>

		<column name="emMin" type="double precision"
			description="Minimal wavelength represented within the data set"
			unit="m" utype="obscore:char.spectralaxis.coverage.bounds.limits.interval.lolim"
			ucd="em.wl;stat.min"
			verbLevel="10">
			<property name="std">1</property>
		</column>
																			
		<column name="emMax" type="double precision"
			description="Maximal wavelength represented within the data set"
			unit="m" utype="obscore:char.spectralaxis.coverage.bounds.limits.interval.hilim"
			ucd="em.wl;stat.max"
			verbLevel="10">
			<property name="std">1</property>
		</column>

		<column name="emResPower" type="double precision"
			description="Spectral resolving power delta lambda/lamda"
			utype="obscore:char.spectralaxis.resolution.resolpower.refval"
			ucd="spect.resolution"
			verbLevel="15">
			<property name="std">1</property>
		</column>

		<column name="oUCD" type="text"
			description="UCD for the product's observable"
			utype="obscore:char.observableaxis.ucd" ucd="meta.ucd"
			verbLevel="15">
			<property name="std">1</property>
		</column>

		<column name="polStates" type="text"
			description="List of polarization states in the data set"
			utype="obscore:Char.PolarizationAxis.stateList"
			ucd="meta.code;phys.polarization"
			verbLevel="15">
			<property name="std">1</property>
		</column>

		<column name="facilityName" type="text"
			description="Name of the facility at which data was taken"
			utype="obscore:Provenance.ObsConfig.facility.name"
			ucd="meta.id;instr.tel"
			verbLevel="15">
			<property name="std">1</property>
		</column>

		<column name="instName" type="text"
			description="Name of the instrument that produced the data"
			utype="obscore:Provenance.ObsConfig.instrument.name"
			ucd="meta.id;instr"
			verbLevel="15">
			<property name="std">1</property>
		</column>

		<column name="noise" type="real"
			description="Noise"
			ucd="meta.id;instr.det.noise"
			verbLevel="15">
			<property name="std">1</property>
		</column>

		<column name="redshift" type="real"
			description="Redshift"
			utype="spect.DopplerVeloc"
			ucd="src.redshift"
			verbLevel="15">
			<property name="std">1</property>
		</column>
		<column name="fitsName" type="text"
			description="Name of a fits associated to the data"
			ucd="meta.id.assoc"
			verbLevel="15">
			<property name="std">1</property>
		</column>
	</STREAM>

	<table id="asdm" onDisk="True" adql="True">

		<!--DESCRIPTION-->
		<meta name="description">
		  ASDM+OBSCORE
		</meta>
		<FEED source="obscore-columns"/>
	</table>


	<data id="import_content">
		<!--RECURSOS FITs-->
		<sources pattern="res/*.csv"></sources>


		<reGrammar>
			<names> prodType, calibLevel, collecName, obsId, targetName, sRa, sDec, sFov, sReg, sRes, tMin, tMax, tExptime, tResolution, emMin, emMax, emResPower, oUCD, polStates, facilityName, instName, noise, redshift, fitsName</names>
		</reGrammar>

    <!--SERVICIO TAP-->
    <register services="__system__/tap#run"/>

		<!--Crea tabla en la DB -->
		<make table="asdm">
			<rowmaker id="build_asdm" >
				<apply name="getApproximateCoverage">
					<code>
					# assume CRVAL1, CRVAL2 are approximate center and make a circle
					# from it
					vars["roughCircle"] = pgsphere.SCircle(
						pgsphere.SPoint.fromDegrees(@sRa, @sDec),
						1/60.*math.pi/180)
					</code>
				</apply>




		  	<map key="prodType">@prodType</map>
		  	<map dest="calibLevel">int(@calibLevel)</map>
		  	<map dest="collecName">@collecName</map>
		  	<map key="obsId">@obsId</map>
		  	<map dest="targetName">@targetName</map>
		  	<map dest="sRa">float(@sRa)</map>
		  	<map dest="sDec">float(@sDec)</map>
		  	<map dest="sFov">@sFov</map>
		  	<map dest="sReg">@sReg</map>
		  	<!--<map dest="sRes">@sRes.asPoly()</map>-->
		  	<map dest="sRes">@roughCircle.asPoly()</map>
		  	<map dest="tMin">long(@tMin)</map>
		  	<map dest="tMax">long(@tMax)</map>
		  	<map dest="tExptime">int(@tExptime)</map>
		  	<map dest="tResolution">@tResolution</map>
		  	<map dest="emMin">float(@emMin)</map>
		  	<map dest="emMax">float(@emMax)</map>
		  	<map dest="emResPower">@emResPower</map>
		  	<map dest="oUCD">@oUCD</map>
		  	<map dest="polStates">@polStates</map>
		  	<map dest="facilityName">@facilityName</map>
		  	<map dest="instName">@instName</map>
		  	<map dest="noise">@noise</map>
		  	<map dest="redshift">@redshift</map>
		  	<map dest="fitsName">@fitsName</map>
	  	</rowmaker>
	  </make>

  </data>
</resource>
