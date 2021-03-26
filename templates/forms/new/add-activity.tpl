<form id="addMajorForm" name="addMajorForm" method="post" action="{$WEB_ROOT}/add-activity/id/{$id}">
    <input type="hidden" id="auxTpl" name="auxTpl" value="{$auxTpl}" />
    <input type="hidden" id="id" name="id" value="{$id}" />
    <input type="hidden" id="type" name="type" value="saveAddMajor" />
    <div class="row">
        <div class="form-group col-md-12">
            <label for="activityType">Tipo de Actividad:</label>
            <select id="activityType" name="activityType" class="form-control">
                <option value="Lectura">Lectura</option>
                <option value="Tarea">Tarea</option>
                <option value="Examen">Examen</option>
                <option value="Foro">Foro</option>
                <option value="Otro">Otro</option>
            </select>
        </div>
    </div>
    <div class="row">
        <div class="form-group col-md-6">
            <label for="initialDate">Fecha Inicial:</label>
            <input type="text" name="initialDate" id="initialDate" value="{$date}" class="form-control i-calendar" />
        </div>
		<div class="form-group col-md-6">
            <label for="horaInicial">Hora Inicial:</label>
            <input type="time" name="horaInicial" id="horaInicial" class="form-control" />
        </div>
    </div>
    <div class="row">
        <div class="form-group col-md-6">
            <label for="finalDate">Fecha Final:</label>
            <input type="text" name="finalDate" id="finalDate" value="{$date}" class="form-control i-calendar" />
        </div>
		<div class="form-group col-md-6">
            <label for="hora">Hora Final:</label>
            <input type="time" name="hora" id="hora" {if $actividad.horaFinal eq ''} value="23:59:00" {else} value="{$actividad.horaFinal}" {/if} class="form-control" />
        </div>
    </div>
    <div class="row">
        <div class="form-group col-md-6">
            <label for="modality">Modalidad:</label>
            <select id="modality" name="modality" class="form-control">
                <option value="Individual">Individual</option>
                <option value="Por Equipo">Por Equipo</option>
            </select>
        </div>
        <div class="form-group col-md-6">
            <label for="resumen">Titulo:</label>
            <input type="text" name="resumen" id="resumen" maxlength="30" class="form-control" />
        </div>
    </div>
    <div class="row">
        <div class="form-group col-md-12">
            <label for="">Descripcion:</label>
            <textarea name="description" id="description"></textarea>
        </div>
    </div>
    <div class="row">
        <div class="form-group col-md-6">
            <label for="requiredActivity">Actividad Requerida:</label>
            <select id="requiredActivity" name="requiredActivity" class="form-control">
                <option value="0">Ninguna</option>
                {foreach from=$actividades item=item}
                    <option value="{$item.activityId}">{$item.resumen}</option>
                {/foreach}
            </select>
        </div>
        <div class="form-group col-md-6">
            <label for="ponderation">Ponderación:</label>
            <input type="text" name="ponderation" id="ponderation" maxlength="3" class="form-control"/>
        </div>
    </div>
    <div class="row">
        <div class="form-group col-md-12 text-center">
            <input type="submit" class="btn btn-success submitForm" id="addMajor" name="addMajor" />
            <button type="button" class="btn btn-danger closeModal">Cancelar</button>
        </div>
    </div>
</form>

<script>
    var editor = new Jodit('#description', {
        language: "es",
        toolbarButtonSize: "small",
        autofocus: true,
        toolbarAdaptive: false
    });

    flatpickr('.i-calendar', {
        dateFormat: "d-m-Y"
    });
</script>