<div class="page-header">
    <h3 class="page-title">
        <span class="page-title-icon bg-gradient-primary text-white mr-2">
            <i class="mdi mdi-home"></i>                 
        </span>
        {$myModule.majorName}: {$myModule.subjectName}
    </h3>
    <nav aria-label="breadcrumb">
        <ul class="breadcrumb">
        <li class="breadcrumb-item active" aria-current="page">
            <span></span>IAP Chiapas
            <i class="mdi mdi-checkbox-marked-circle-outline icon-sm text-primary align-middle"></i>
        </li>
        </ul>
    </nav>
</div>
<div class="row">
    <div class="col-md-3">
        {include file="new/student-menu.tpl"}
    </div>
    <div class="col-md-9">
        <div class="row">
            <div class="col-md-12 mb-3">
                <h3 class="page-title">
                    <span class="page-title-icon bg-gradient-primary text-white mr-2">
                        <i class="mdi mdi-tag"></i>                 
                    </span>
                    <b>Exámenes</b>
                </h3>
            </div>
            <div class="col-lg-12 grid-margin stretch-card">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">
                            Calificación acumulada:</b> {$totalScore}%
                        </h4>
                        <div class="progress mb-4">
                            <div class="progress-bar bg-success" role="progressbar" style="width: {$totalScore}%" aria-valuenow="{$totalScore}" aria-valuemin="0" aria-valuemax="100">{$totalScore}%</div>
                        </div>
                        <input type="hidden" value="0" id="recarga" name="recarga" />
                        <div class="table-responsive">
                            <table class="table table-bordered table-sm">
                                <thead>
                                    <tr class="text-center">
                                        <th width="5%"><b>#</b></th>
                                        <th width="40%"><b>Actividad</b></th>
                                        <th width="20%"><b>Progreso</b></th>
                                        <th width="16%"><b>Entregable</b></th>
                                        <th width="19%"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {foreach from=$actividades item=item}
                                        <tr class="{if $timestamp > $item.initialDateTimestamp && $timestamp < $item.finalDateTimestamp} table-success {/if} {if $timestamp > $item.finalDateTimestamp} table-danger {/if} {if $timestamp < $item.initialDateTimestamp} table-danger {/if}">
                                            <td class="text-center">{$item.count}</td>
                                            <td>{include file="{$DOC_ROOT}/templates/lists/new/module-calendar-td.tpl"}</td>
                                            <td>
                                                {if $item.ponderation}
                                                    <p>
                                                        <b>Calificación:</b> {$item.ponderation}<br />
                                                        <b>Porcentaje obtenido: </b>{$item.realScore}%
                                                    </p>
                                                    <div class="progress">
                                                        <div class="progress-bar bg-primary" role="progressbar" style="width: {$item.realScore}%" aria-valuenow="{$item.realScore}" aria-valuemin="0" aria-valuemax="100">{$item.realScore}%</div>
                                                    </div>
                                                {/if}
                                            </td>
                                            <td class="text-center">
                                                {if $item.homework.path ne ''}
                                                    <span class="badge badge-success">Tarea entregada</span>
                                                    {if $item.homework.path ne ''}
                                                        <br><br>
                                                        <button class="btn btn-outline-info btn-xs" onclick="window.location.href='{$WEB_ROOT}/download.php?file=homework/{$item.homework.path}&mime={$item.homework.mime}'" class="bb">
                                                            <i class="far fa-file-alt"></i> Ver Tarea
                                                        </button>
                                                        {if $timestamp < $item.finalDateTimestamp}  
                                                            {if $item.homework.countUpdate ne 1}
                                                                {if $item.modality eq 'Individual'}
                                                                    <br><br>
                                                                    <button class="btn btn-outline-danger btn-xs" onclick="deleteActividad('{$item.activityId}')" class="bb">
                                                                        <i class="fas fa-trash-alt"></i> Eliminar
                                                                    </button>
                                                                {/if}
                                                            {/if}
                                                        {/if}
                                                    {/if}
                                                {/if}
                                            </td>
                                            <td class="text-center">
                                                <a href="{$WEB_ROOT}/graybox.php?page=view-description-activity&id={$item.activityId};" class="btn btn-info btn-xs" data-target="#ajax" data-toggle="modal" >
                                                    <i class="fas fa-info-circle"></i> Descripción
                                                </a>
                                            </td>
                                        </tr>
                                        {* {include file="{$DOC_ROOT}/templates/lists/new/module-calendar.tpl"} *}
                                    {/foreach}
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>























<div class="portlet box red">
    
    <div class="portlet-body">
        {foreach from=$actividades item=item}
        {if $timestamp > $item.initialDateTimestamp && $timestamp < $item.finalDateTimestamp}
        <div class="portlet box red">
            {/if}
            {if $timestamp > $item.finalDateTimestamp}
            <div class="portlet box red-mint">
                {/if}
                {if $timestamp < $item.initialDateTimestamp}
                <div class="portlet box red-mint">
                    {/if}
                     <div class="portlet-title">
                        <!-- TODO Poner al centro el título-->
                        <div class="caption" >
                            <!-- TODO Ver Descripción ponerlo en blanco y subrayado-->
                            <b>Examen  {$item.count} </b> 
                        </div>
                        <div class="actions">
                            <a href="{$WEB_ROOT}/graybox.php?page=view-description-activity&id={$item.activityId}" class="btn btn-default btn-sm" data-target="#ajax" data-toggle="modal" >

                                <i class="fa fa-plus"></i> Ver Descripción </a>


                        </div>
                    </div>
                    <div class="portlet-body">
                        {include file="{$DOC_ROOT}/templates/lists/new/module-calendar.tpl"}
                    </div>
                </div>
                {/foreach}
            </div>
        </div>

