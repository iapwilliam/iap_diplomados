<div class="page-header">
    <h3 class="page-title">
        <span class="page-title-icon bg-gradient-primary text-white mr-2">
            <i class="mdi mdi-percent"></i>
        </span>
        Reporte de Becas
    </h3>
    <nav aria-label="breadcrumb">
        <ul class="breadcrumb">
            <li class="breadcrumb-item active" aria-current="page">
                <span></span>Reportes
                <i class="mdi mdi-alert-circle-outline icon-sm text-primary align-middle"></i>
            </li>
        </ul>
    </nav>
</div>

<div class="card mb-4">
    <div class="card-header bg-primary text-white">
        {* <a href="#" class="btn btn-info float-right" onClick="onImprimir()" title="Imprimir">
            <i class="fas fa-print"></i> Imprimir
        </a> *}
    </div>
    <div class="card-body">
        <form id="frmGral" target="_blank" action="{$WEB_ROOT}/ajax/new/reportes.php?page=export-excel" method="post">
            <input type="hidden" value="becas" name="opcion">
            <div class="row">
                <div class="col-md-3 form-group">
                    <label for="posgrado">Posgrado</label>
                    <select class="form-control" name="posgrado" id="posgrado" data-url="{$WEB_ROOT}/ajax/new/becas.php">
                        <option value="">Todos</option>
                        {foreach from=$posgrados item=item}
                            <option value="{$item.subjectId}">[{$item.nivelPosgrado}]{$item.posgrado}</option>
                        {/foreach}
                    </select>
                </div>
                <div class="col-md-3 form-group">
                    <label for="grupo">Grupo</label>
                    <select class="form-control" name="grupo" id="grupo" data-url="{$WEB_ROOT}/ajax/new/becas.php">
                        <option value="">Todos</option> 
                    </select>
                </div>
                <div class="col-md-3 form-group">
                    <label for="concepto">Conceptos</label>
                    <select class="form-control" name="concepto" id="concepto">
                        <option value="">Todos</option>
                        {foreach from=$conceptos item=concepto}
                            <option value="{$concepto.concepto_id}">{$concepto.nombre}</option>
                        {/foreach}
                    </select>
                </div>
                <div class="col-md-3 form-group">
                    <label for="periodo">Periodos</label>
                    <select class="form-control" name="periodo" id="periodo">
                        <option value="">Todos</option> 
                    </select>
                </div>
                <div class="col-md-12 text-center">
                    <button type="submit" class="btn btn-primary">Buscar</button>
                </div>
            </div>
        </form>
        <div id="contenedor-reportes">
        </div>
    </div>
</div>