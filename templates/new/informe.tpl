<div class="portlet box {$PORTLET_COLOR}">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-bullhorm"></i>Informe Final
        </div>
        <div class="actions">
			<!--<a class="btn red" href="#" title="IMPRIMIR" onClick="onImprimirCarta('{$info.courseModuleId}')">
			Imprimir
			</a>-->
        </div>
    </div>
	
    <div class="portlet-body" style='text-align:justify'>
			
	<center>
	
	{if $info.rutaInforme eq ''}
		<form class="form-horizontal" id="frmGral" name="frmGral" method="post" onsubmit="return false;">
			<input type="hidden" name='type' value="onSendContrato">
			<input type="hidden" id="personalId" name="personalId" value="{$personalId}"/>
			<input type="hidden" id="id" name="id" value="{$id}" /> 
			<div style=''>
			<span class="btn btn-default btn-file">
			<input type="file" name='cedula' id='cedula' class="btn-file" onChange="onSendInforme({$id})">
			Subir Informe
			</span>
			</div>
			<progress id="progress" value="0" min="0" max="100"></progress>
			<div id="porcentaje" >0%</div>
		</form>
	{else}
		<a type="button" target='_blank' href='{$WEB_ROOT}/docentes/informe/{$info.rutaInforme}'  class="btn default blue" style="width:211px">Visualizar</a><br>
		<br>
		<a type="button" href="javascript:void(0)" class="btn default red" style="width:211px" onClick="onDeleteInforme({$id})">Eliminar</a><br>
	{/if}
	</center>
			
	<form id="frmGral" >
		<input type="hidden" name="mId" value="{$mId}">
		
	</form>

    </div>
</div>
