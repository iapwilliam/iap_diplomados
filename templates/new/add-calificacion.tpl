<div class="portlet box red">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-bullhorm"></i>Acta de Calificaciones
        </div>
        <div class="actions">
		 <button  class="btn green submitForm" onClick="descargarActa({$id})">Descargar Acta</button>
        </div>
    </div>
    <div class="portlet-body">
        <div id="tblContent">
            {include file="{$DOC_ROOT}/templates/lists/add-calificacion.tpl"}
        </div>
    </div>
</div>
