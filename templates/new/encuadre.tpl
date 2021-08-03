<div class="card mb-4">
    <div class="card-header bg-primary text-white">
		<i class="far fa-object-group"></i> Encuadre
    </div>
    <div class="card-body text-center">
		{if $info.rutaEncuadre eq ''}
			<form id="frmGral" name="frmGral" method="post" onsubmit="return false;">
				<input type="hidden" name="type" value="onSendContrato" />
				<input type="hidden" id="personalId" name="personalId" value="{$personalId}" />
				<input type="hidden" id="id" name="id" value="{$id}" />
				<span class="btn btn-outline-info btn-file">
					<input type="file" name='cedula' id='cedula' class="btn-file" onChange="onSendEncuadre({$id})" />
					Subir Encuadre
				</span><br>
				<progress id="progress" value="0" min="0" max="100"></progress>
				<div id="porcentaje" >0%</div>
			</form>
		{else}
			<a type="button" target="_blank" href="{$WEB_ROOT}/docentes/encuadre/{$info.rutaEncuadre}" class="btn btn-info">
				Visualizar
			</a><br><br>
			<a type="button" href="javascript:void(0)" class="btn btn-danger" onClick="onDeleteEncuadre({$id})">
				Eliminar
			</a><br>
		{/if}
		<form id="frmGral">
			<input type="hidden" name="mId" value="{$mId}">
		</form>
    </div>
</div>