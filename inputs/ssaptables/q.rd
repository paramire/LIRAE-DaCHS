<?xml version="1.0" encoding="iso-8859-1"?>

<resource schema="siapobsexample">
  <meta name="title">SIAP ObcCoreDM Examples</meta>
  <meta name="creationDate">2013-11-26T14:59:00Z</meta>
  <meta name="description" format="plain">
    LIRAE GROUP
    SSAP ObsCoreDM Ejemplo
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

  <table id="spe" onDisk="True" adql="True">
    <mixin>
      //ssap#hcd
    </mixin>
    <meta name="description">
      Ejemplo SIAP+ObsCore.
    </meta>
  </table>

   <rowmaker id="build_sst">
    <var name="imageTitle">
      "%s %s"%(@TELESCOP,@DATE_OBS) 
    </var>
    <apply procDef="//ssap#computePGS"/>
    <apply procDef="//ssap#setMeta">
      <!-- Falta como completar info -->
      <bind name="title">vars["imageTitle"]</bind>
      <bind name="instrument">vars["TELESCOP"]</bind>
    </apply>
    <map dest="centerDelta">@OBSDEC</map>
    <map dest="centerAlpha">@OBSRA</map>
  </rowmaker>