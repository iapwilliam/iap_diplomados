<div class="portlet box red">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-bullhorm"></i>Personal Academico
        </div>

    </div>
    <div class="portlet-body">
        <div id="tblContent">
			<div style="left:30%; position:relative">
			{**include file="lists/new/resources.tpl"**}


			 {foreach from=$docente item=item key=key}
				
				
					<div style="float:left; width:285px">
								<div style="width:215px; height:115px; text-align:center">
									<img src='{$item.foto}' style='width: 100px !important'>
								</div>
								<br>
								<div style="width:215px; height:115px; text-align:center; font-size:11px">
								<font style="font-weight: bold; font-size:11px">
								{$item.name|upper} {$item.lastname_materno|upper} {$item.lastname_paterno|upper} </font><br>
								{if $item.correo eq ''}SIN INFORMACIÓN{else} {$item.correo|upper} {/if}<br>
								{if $item.puesto eq ''}SIN INFORMACIÓN{else} {$item.puesto|upper} {/if}<br>
								{$item.descripcion|upper}<br>
								</div>
					</div>
					
				{if ($key+1) % 2  eq 0}
				<div style="clear:both">
				</div>
				
					<br>	
					<br>	
					<br>	

				{/if}
			 {/foreach}
			</div>
			<div style="clear:both">
				</div>
		</div>
	</div>