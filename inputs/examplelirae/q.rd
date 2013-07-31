<?xml version="1.0" encoding="iso-8859-1"?>

<resource schema="examplelirae">
  <meta name="title">Example LIRAE</meta>
  <meta name="creationDate">2012-07-31T15:00:00Z</meta>
  <meta name="description" format="plain">
    Example for LIRAE UTFSM
  </meta>
  <meta name="copyright">Free to use.</meta>
  <meta name="creator.name">Author, S.; Other, A.</meta>

  <meta name="subject">Large Magellanic Cloud</meta>
  <meta name="subject">Interstellar medium, nebulae</meta>
  <meta name="subject">Extinction</meta>

  <meta name="coverage">
    <meta name="waveband">Optical</meta>
  </meta>

  <meta name="content.type">Catalog</meta>

  <table id="example" onDisk="True" adql="True">
    <meta name="description">
      Example table
    </meta>
    <column
	name="bbox"
	type="box"
      description="Column 1"/>
    <column 
	name="centerAlpha"
      ucd="pos.eq.ra;meta.main"
	unit="deg"
      tablehead="RA"
      description="Column 2"/>
    <column 
	name="centerDelta"
      ucd="pos.eq.dec;meta.main"
	unit="deg"
      tablehead="Dec"
      description="Column 3"/>
    <column
	name="ev_i"
      ucd="arith.diff;phys.absorption;em.opt.V;em.opt.I"
	unit="mag"
      tablehead="E(V-I)"
      description="Difference in extinction between V and I bands"/>
    <column
	name="a_v"
      ucd="phys.absorption;em.opt.V"
	unit="mag"
      tablehead="A_V"
      description="Extinction in V"/>
    <column
	name="a_i"
      ucd="phys.absorption;em.opt.I" unit="mag"
      tablehead="A_I"
      description="Extinction in I"/>
  </table>

  <data id="import_content">
	<!--Los datos se encuentran en la carpeta data	-->
    <sources pattern="data/*.txt"/>
	<!--  reGrammar es la forma de hacer un grammar a la primera linea datos del .txt-->
    <reGrammar topIgnoredLines="1">
      <names>raMin, raMax, decMin, decMax, ev_i, a_v, a_i</names>
    </reGrammar>


    <make table="example">
	<!-- Parse de los datos del .txt a los elementos de la columna-->
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
