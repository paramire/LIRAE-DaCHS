<?xml version="1.0" encoding="iso-8859-1"?>

<resource schema="ssaptables">
  <meta name="title">SIAP Tables</meta>
  <meta name="creationDate">2013-11-26T14:59:00Z</meta>
  <meta name="description" format="plain">
  	SSAP Tables
  </meta>
  <meta name="copyright">Free to use.</meta>
  <meta name="creator.name">Patricio Ramirez</meta>
  <meta name="subject">Ejemplo</meta>
  <meta name="facility">The Dispair Telescope</meta>

  <meta name="coverage">
    <meta name="waveband">Optical</meta>
  </meta>
  <meta name="content.type">Catalog</meta>

    <table id="sst" onDisk="True" adql="True">
    <mixin>
      //ssap#hcd
    </mixin>

    <meta name="description">
      Ejemplo SIAP+ObsCore.
    </meta>
  </table>

  <data id="import_content">
      <!--RECURSOS FITs-->
    <sources recurse="True" pattern="res/*.fits">
    </sources>
      
    <!-- qnd: Hack para hacer fitsProdGrammar mas rapido-->
	<fitsProdGrammar qnd="True">
      <!-- Al utilizar productos es necesario //products#define, nos agrega ciertas culmanas a la tabla-->
      <rowfilter procDef="__system__/products#define">
        <bind key="table">"ssaptable.sst"</bind>
      </rowfilter>
    </fitsProdGrammar>
    <!--SERVICIO TAP-->
    <register services="__system__/tap#run"/>
    <!--Crea tabla en la DB -->
    <make table="st" rowmaker="build_st"/>
  </data>

  <rowmaker id="build_sst">
    <var name="imageTitle">
      "%s %s"%(@TELESCOP,@DATE_OBS) 
    </var>
    <!--CAMBIAR-->
    <apply procDef="//ssap#computePGS"/>
    <apply procDef="//ssap#setMeta">
      <!-- Falta como completar info -->
      <bind name="title">vars["imageTitle"]</bind>
      <bind name="instrument">vars["TELESCOP"]</bind>
   </apply>
  </rowmaker>

</resource>
