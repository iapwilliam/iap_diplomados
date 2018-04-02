<?php
	include_once('../initPdf.php');
	include_once('../config.php');
	include_once(DOC_ROOT.'/libraries.php');

	session_start();
	
		// actualizar ruta de documento adjunto
		$solicitud->actulizarRutaBoleta($_GET['q']);
		

		$contenido .=	"<center><b>Instituto de administración pública del estado de chiapas</b></center><br>";
		$contenido .=	"<center><b>incorporada a la secretaria de educacion pública del estado</b></center><br>";
		$contenido .=	"<center><b>Clave: 07psu0129j</b></center><br>";
		$contenido .=	"<center><b>Libramiento norte Pte. No. 2718 Col. ladera de la loma, tuxtla Gutiérrez, chiapas</b></center><br>";
		$contenido .=	"<center><b>Boleta de Calificaciones</b></center><br><br>";


		$contenido .=	"<table width='100%' >
                         <tr>
                            <td>Nombre del Alumno</td>
                            <td>".$infoSol['names']." ".$infoSol['lastNamePaterno']." ".$infoSol['lastNameMaterno']."</td>
                            <td>Matricula</td>
                            <td>".$infoSol['controlNumber']." </td>
                         </tr>
                         <tr>
                            <td>Posgrado:</td>
                            <td>".$infoSol['name']."</td>
                            <td>Ciclo</td>
                            <td>".$ii[0]." - ".$if[0]." </td>
                         </tr>
                          <tr>
                            <td>Cuatrimestre:</td>
                            <td>".$infoSol['tipoPeriodo']."</td>
                            <td>Periodo</td>
                            <td>".$infoSol['tipoPeriodo']." Grupo: ".$infoSol['group']."</td>
                         </tr>
                        </table>";


		foreach($lstCal8 as $key=>$aux){
			$contenido .= "<table width='100%' >";
			$contenido .= "<tr>
				<td width='70%'><b>Materias</b></td>
				<td colspan='' style='text-align:center'><b>Calificacion</b></td>
				</tr>";
			$contenido .= "<tr><td>".$aux['semesterId']." ".$aux['tipoPeriodo']."</td><td style='text-align:center'><b>En numero</b></td><td style='text-align:center'><b>En Letra</b></td><td></td></tr>";
			foreach($aux['materias'] as $key2=>$aux2){
			$h =  $util->num2letras($aux2['calificacion']);
			$contenido .= "
			<tr>
			<td>".$aux2['name']."</td>
			<td style='text-align:center'>".$aux2['calificacion']."</td>
			<td style='text-align:center'>".$h."</td>
			</tr>";
			}
			$contenido .= "</table>
			<br><br>";
		}
		

	
	
	$html .= "
	<html>
	<head>
	<title>CONSTANCIA</title>
	<style type='text/css'>
	.txtTicket{
			font-size:12px;
			 font-family: sans-serif;
			text-transform: uppercase;
			/*font:bold 12px 'Trebuchet MS';*/ 
		}
		table,td {
		border: 1px solid black;
		border-collapse: collapse;
	}
	.notas{
			font-size:10px;
			 font-family: sans-serif;
			text-transform: uppercase;
			/*font:bold 12px 'Trebuchet MS';*/ 
		}
		table,td {
		border: 1px solid black;
		 border-collapse: collapse;
	}
	.line{
		border-bottom: 1px solid; border-left: 0px; border-right: 0px;	
	}
		</style>
	</head>
	<body>
	<br>	
	<br>	
	
	
	
		<table align='center' width='100%' border='0' class ='txtTicket'>
			<tr>
				<td  align='left'>
					<img src='".DOC_ROOT."/images/logo_correo.jpg'>
				</td>
			</tr>
		
			
			<tr>
			<td>
			";

	$html .= $contenido;	
	
	$html .= "</td></tr>";	
	$html .= "	
	</body>
	</html>

	";
	// echo $html;
	// exit;
	# Instanciamos un objeto de la clase DOMPDF.
	$mipdf = new DOMPDF();
	 
	# Definimos el tamaño y orientación del papel que queremos.
	# O por defecto cogerá el que está en el fichero de configuración.
	$mipdf ->set_paper("A4", "portrait");
	 
	# Cargamos el contenido HTML.
	$mipdf ->load_html(utf8_decode($html));
	 
	# Renderizamos el documento PDF.
	$mipdf ->render();
	 
	# Enviamos el fichero PDF al navegador.
	// $mipdf ->stream('certificadodeValidez.pdf',array('Attachment' => 0));
	$pdf = $mipdf->output();
	file_put_contents(DOC_ROOT.'/alumnos/solicitud/solicitud_'.$_GET['q'].'.pdf', $pdf);		
	header("Location:".WEB_ROOT."/alumnos/solicitud/solicitud_".$_GET["q"].".pdf");
	exit;

?>