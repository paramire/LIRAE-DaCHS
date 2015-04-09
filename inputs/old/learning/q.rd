<?xml version="1.0" encoding="iso-8859-1"?>

<!-- Este ejemplo crea la tabla vacia, no agrega datos a la tabla -->

<resource schema="learning">	<!-- schema igual que nombre de carpeta que lo contenga -->
	<meta name="title">Titulo Ejemplo</meta>
	<meta name="creationDate">2014-04-12T22:10:00</meta> <!-- AAAA-MM-DD-->
	<meta name="description" format="plain">
    		Texto de Descripcion Schema Ejemplo
 		</meta>
  	<meta name="copyright">Free to use.</meta>
  	<meta name="creator.name">hcalquin</meta>

	<meta name="subject">Subject 1</meta>
  	<meta name="subject">Subject 2</meta>
  	<meta name="subject">Subject 3</meta>

  	<meta name="coverage">
  		<meta name="profile">Profile</meta>
    		<meta name="waveband">Waveband</meta>
  	</meta>

  	<meta name="content.type">Catalog</meta>


<!-- DEFINICION DE LA TABLA -->
	<table id="NOMBRE_TABLA" onDisk="True" adql="True">
		  <meta name="description">
		    	Texto de Descripcion Tabla Ejemplo
		  </meta>
		  <column name="COLUMNA_1"
		    	description="Descripcion Columna 1"
 			unit="deg"/>
		  <column name="COLUMNA_2"
		  	description="Descripcion Columna 2"
 			unit="deg"/>
	</table>



	<!-- INGRESO DE DATOS A LA TABLA -->
	 <data >
		<make table="NOMBRE_TABLA">
			<rowmaker id="NOMBRE_ROWMAKER">

			</rowmaker>
		</make>




	</data>



</resource>
