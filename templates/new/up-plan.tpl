<div class="portlet box {$PORTLET_COLOR}">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-bullhorm"></i><b>Plan de Estudios</b> 
        </div>
		
         <div class="actions">
		 
	

        </div>
		<div class="actions">
            <!--<a href="javascript:;" class="btn green" id="btnAddMajor">
                <i class="fa fa-plus"></i> Sincronizar School Manager
            </a>-->
        </div>
    </div>
    <div class="portlet-body">

	<div id="msj">
	</div>

        {include file="boxes/status_no_ajax.tpl"}

		<div id='loader'></div>
		<div id='msj'></div>
		<div id='contenido'>
			<form class="form-horizontal" id="frmDoc_" method="post"  >
			<input type="hidden" id="type" name="type" value="adjuntarPlan"/>
			<input type="hidden"  name="id" value="{$id}"/>
			<input type="hidden"  name="cmId" value="{$cmId}"/>
				   <input type="file" name="comprobante">
			</form>
			<progress id="progress_" value="0" min="0" max="100"></progress>
			<div id="porcentaje_" >0%</div>
			<center><button  class="btn green" id="addMajor" name="addMajor" onClick="enviarArchivo()">Guardar</button></center>

		</div>
    </div>
</div>