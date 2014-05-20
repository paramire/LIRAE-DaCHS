<?xml version="1.0" encoding="iso-8859-1"?>

<resource schema="ssaptables">
  <meta name="title">SSAP Examples</meta>
  <meta name="creationDate">2013-11-26T14:59:00Z</meta>
  <meta name="description" format="plain">
    LIRAE GROUP
    SSAP Ejemplo
    Probar implementar una tabla Simple Spectral Access Protocol, junto con una tabla ObsCore
  </meta>
  <meta name="copyright">Free to use.</meta>
  <meta name="creator.name">Patricio Ramirez</meta>
  <meta name="subject">Ejemplo</meta>
  <meta name="facility">The Dispair Telescope</meta>

  <meta name="coverage">
    <meta name="waveband">Optical</meta>
  </meta>
  <meta name="content.type">Catalog</meta>

  <table id="sat" onDisk="True" adql="True">
    <mixin
      fluxSI=" "
      spectralSI="10**-10 m"
      fluxCalibration="ABSOLUTE" >
      //ssap#hcd
    </mixin>
    <meta name="description">
      Ejemplo SIAP+ObsCore.
    </meta>
  </table>



  <data id="import_content">
    <sources pattern="res/*.fits">
    </sources>
      
    <!-- qnd: Hack para hacer fitsProdGrammar mas rapido-->
    <fitsProdGrammar qnd="True">
    
      <!-- Al utilizar productos es necesario //products#define, nos agrega ciertas culmanas a la tabla-->
      <rowfilter procDef="__system__/products#define">
        <bind key="table">"ssaptable.sat"</bind>
      </rowfilter>
    </fitsProdGrammar>
    
    <!--SERVICIO TAP-->
    <register services="__system__/tap#run"/>

    <!--Crea tabla en la DB -->
    <make table="sat" >
      <rowmaker idmaps="ssa_*">
        <apply procDef="//ssap#setMeta">
          <bind name="dstitle">@OBSERVAT</bind>
          <bind name="pubDID">"ivo://org.gavo.dc/ssaptables/q#"+@OBSERVAT</bind>
          <bind name="targname">@OBSERVAT</bind>
        </apply>
      </rowmaker>
    </make>
  </data>



  <service id="ssat" allowed="form,ssap.xml">
    <meta name="shortName">SIAP EXAMPLE</meta>
    <meta name="title">"Sample image access"</meta>
    <meta name="ssap.dataSource">theory</meta>
    <meta name="ssap.creationType">archival</meta>
    <meta name="ssap.testQuery">MAXREC=1</meta>


    <publish render="ssap.xml" sets="local"/>
    <publish render="form" sets="local" />
    <!-- CORES -->
    <ssapCore id="query_images" queriedTable="sat">
      <FEED source="//ssap#hcd_condDescs"/>
    </ssapCore>
  </service>
</resource>