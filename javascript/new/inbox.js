function cargaInbox(tipo,courseMId){  
	
	// alert(tipo)

	$.ajax({
	  	type: "POST",
	  	url: WEB_ROOT+'/ajax/student.php',
	  	data: $("#editStudentForm").serialize(true)+'&type=cargaInbox&tipo='+tipo+'&courseMId='+courseMId,
		beforeSend: function(){			
			
		},
	  	success: function(response) {	
		
			console.log(response)
			var splitResp = response.split("[#]");
			

			$("#contentInbox").html(response);
			if (tipo=='enviados'){
				$("#linkEnviado").addClass("active");
				$("#linkEntrada").removeClass("active");
				$("#linkBorrador").removeClass("active");
				$("#linkEliminado").removeClass("active");
			}else if (tipo=='entrada'){
				$("#linkEntrada").addClass("active");
				$("#linkEnviado"). removeClass("active");
				$("#linkBorrador").removeClass("active");
				$("#linkEliminado").removeClass("active");
			}else if (tipo=='borrador'){
				$("#linkBorrador").addClass("active");
				$("#linkEntrada").removeClass("active");
				$("#linkEnviado"). removeClass("active");
				$("#linkEliminado").removeClass("active");
			}else if (tipo=='eliminados'){
				$("#linkEliminado").addClass("active");
				$("#linkBorrador").removeClass("active");
				$("#linkEntrada").removeClass("active");
				$("#linkEnviado"). removeClass("active");
				
			}
			
				
		},
		error:function(){
			alert(msgError);
		}
    });
	
}//cargaInbox



function deleteInbox(Id,courseId){
	
	var resp = confirm("Seguro de  elimina el mensaje?");
	
	if(!resp)
		return;

	$.ajax({
	  	type: "POST",
	  	url: WEB_ROOT+'/ajax/foro.php',
	  	data: $("#frmFiltro").serialize(true)+'&Id='+Id+'&type=deleteInbox',
		beforeSend: function(){			
			// $('#tblContent').html(LOADER3);
		},
	  	success: function(response) {	
		
			console.log(response)
			var splitResp = response.split("[#]");
			cargaInbox('entrada',courseId);
			
		},
		error:function(){
			alert(msgError);
		}
    });
	
}//deleteInbox