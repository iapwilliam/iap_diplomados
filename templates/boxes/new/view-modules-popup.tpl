<div class="card mb-4">
    <div class="card-header bg-primary text-white">
        <a href="{$WEB_ROOT}/graybox.php?page=new-module&id={$id}" class="btn btn-info btn-sm float-right second-modal" data-target="#ajax" data-toggle="modal" onclick="CloseFview()">
            <i class="fas fa-plus-circle"></i> Click para agregar módulos a Currícula
        </a>
    </div>
    <div class="card-body">
        <div id="tblContent" class="table-responsive">
            {include file="{$DOC_ROOT}/templates/lists/new/modules.tpl"}
        </div>
    </div>
</div>