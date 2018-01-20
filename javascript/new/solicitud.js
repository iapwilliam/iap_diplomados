function cargaCalendario(Id){
	// $.datepicker.setDefaults( $.datepicker.regional['es'] );
		$('#fecha_'+Id).datepicker({
		 dateFormat: 'yy-mm-dd',
		}).focus();
}



function buscarSolicitud(){
	
	$.ajax({
	  	type: "POST",
	  	url: WEB_ROOT+'/ajax/solicitud.php',
	  	data: "type=buscarSolicitud&"+$("#frmFiltro").serialize(true),
		beforeSend: function(){			
			$("#loader").html(LOADER3);
		},
	  	success: function(response) {

		$("#loader").html('');
			console.log(response)
			var splitResp = response.split("[#]");
											
				$("#contenido").html(response);

		},
		error:function(){
			alert(msgError);
		}
    });
	

	
}//addHeredero


function enviarArchivo(){


// En esta var va incluido $_POST y $_FILES
	var fd = new FormData(document.getElementById("addMajorForm"));
	$.ajax({
		url: WEB_ROOT+'/ajax/solicitud.php',
		data: fd,
		processData: false,
		contentType: false,
		type: 'POST',
		beforeSend: function(){		
			$("#loader3").html(LOADER3);
			$("#addMajor").hide();
		},
		success: function(response){
			
			console.log(response);
			var splitResp = response.split("[#]");

			// $("#loader").html("");
			
			if($.trim(splitResp[0]) == "ok"){
				$("#msj").html(splitResp[1]);
				$("#contenido").html(splitResp[2]);
				closeModal();
			}else if($.trim(splitResp[0]) == "fail"){
					$("#addMajor").show();
					$("#msj").html(splitResp[1]);			
			}else{
				// alert(msgFail);
			}
		},
	})
	
}



function closeModal(){
	
	$("#ajax").hide();
	$("#ajax").modal("hide");
	
}




function realizarBaja(Id){
	
	var resp = confirm("¿Estás seguro de dar de baja a este alumno?");
	
	if(!resp)
		return;
	
	$.ajax({
	  	type: "POST",
	  	url: WEB_ROOT+'/ajax/solicitud.php',
	  	data: "type=realizarBaja&"+$("#frmFiltro").serialize(true)+'&Id='+Id,
		beforeSend: function(){			
			$("#loader").html(LOADER3);
		},
	  	success: function(response) {

		$("#loader").html('');
			console.log(response)
			var splitResp = response.split("[#]");
				buscarSolicitud()				
				// $("#contenido").html(response);

		},
		error:function(){
			alert(msgError);
		}
    });
	

	
}//realizarBaja





function validarPago(Id){
	
	var resp = confirm("¿Estás seguro de validar el pago?");
	
	if(!resp)
		return;
	
	$.ajax({
	  	type: "POST",
	  	url: WEB_ROOT+'/ajax/solicitud.php',
	  	data: "type=validarPago&"+$("#frmFiltro").serialize(true)+'&Id='+Id,
		beforeSend: function(){			
			$("#loader").html(LOADER3);
		},
	  	success: function(response) {

		$("#loader").html('');
			console.log(response)
			var splitResp = response.split("[#]");
			descargarConstancias(Id);
			buscarSolicitud();	
		},
		error:function(){
			alert(msgError);
		}
    });
		
}//validarPago

function descargarConstancias(q){
	url=WEB_ROOT+"/ajax/formato-constancia.php?"+$('#frmfiltro').serialize(true)+'&q='+q;
	open(url,"Constancia de Estudios","toolbal=0,width=0,resizable=1");
	// window.open(WEB_ROOT+"/alumnos/solicitud/solicitud_"+Id+".pdf", '_blank'); 
}


// function verConstancia(q){
	// url=WEB_ROOT+"/ajax/formato-constancia.php?"+$('#frmfiltro').serialize(true)+'&q='+q;
	// open(url,"Constancia de Estudios","toolbal=0,width=800,resizable=1");
// }
