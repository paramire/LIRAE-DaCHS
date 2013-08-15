<?xml version="1.0" encoding="iso-8859-1"?>

<resource schema="lmcextinct">
  <meta name="title">Extinction within the LMC</meta>
  <meta name="creationDate">2013-06-04T14:59:00Z</meta>
  <meta name="description" format="plain">
    LIRAE GROUP...
  </meta>
  <meta name="copyright">Free to use.</meta>
  <meta name="creator.name">Patricio Ramirez, S.; Other, A.</meta>

  <meta name="subject">Large Magellanic Cloud</meta>
  <meta name="subject">Interstellar medium, nebulae</meta>
  <meta name="subject">Extinction</meta>

  <meta name="coverage">
    <meta name="waveband">Optical</meta>
  </meta>

  <meta name="content.type">Catalog</meta>

	<table id="exts" onDisk="True" adql="True">
		<meta name="description">
		  Extinction values within certain areas on the sky.
		</meta>
		<column name="bbox" type="box"
		  unit="deg"
		  description="Bounding box for the extinction data"/>
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
		<column name="ev_i"
		  ucd="arith.diff;phys.absorption;em.opt.V;em.opt.I" unit="mag"
		  tablehead="E(V-I)"
		  description="Difference in extinction between V and I bands"
		  verbLevel="1"/>
		<column name="a_v"
		  ucd="phys.absorption;em.opt.V" unit="mag"
		  tablehead="A_V"
		  description="Extinction in V"
		  verbLevel="15"/>
		<column name="a_i"
		  ucd="phys.absorption;em.opt.I" unit="mag"
		  tablehead="A_I"
		  description="Extinction in I"
		  verbLevel="15"/>

	</table>
	<!--<publish service="lmcextinct/q#exts" />-->
	<data id="import_content">
    	<sources pattern="resources/*.txt"/>
    	<reGrammar topIgnoredLines="1">
      		<names>raMin, raMax, decMin, decMax, ev_i, a_v, a_i</names>
    	</reGrammar>
    	<register services="__system__/tap#run"/>

    <make table="exts">
      <rowmaker id="build_exts" idmaps="*">
        <var name="raMin">float(@raMin)</var>
        <var name="raMax">float(@raMax)</var>
        <var name="decMin">float(@decMin)</var>
        <var name="decMax">float(@decMax)</var>

        <map dest="centerAlpha">(@raMin+@raMax)/2.</map>
        <map dest="centerDelta">(@decMin+@decMax)/2.</map>
        <map dest="bbox">coords.Box((@raMin, @decMin),
              (@raMax, @decMax))</map>
      </rowmaker>
    </make>
  </data>
</resource>
