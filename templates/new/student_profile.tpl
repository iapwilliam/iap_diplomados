<!-- BEGIN PAGE BAR -->
<div class="page-bar">
    <ul class="page-breadcrumb">
        <li>
            <a href="{$WEB_ROOT}">Inicio</a>
            <i class="fa fa-circle"></i>
        </li>
        <li>
            <span>Perfil</span>
        </li>
    </ul>
    <div class="page-toolbar">
{*        <div class="btn-group pull-right">
            <button type="button" class="btn green btn-sm btn-outline dropdown-toggle" data-toggle="dropdown"> Actions
                <i class="fa fa-angle-down"></i>
            </button>
            <ul class="dropdown-menu pull-right" role="menu">
                <li>
                    <a href="#">
                        <i class="icon-bell"></i> Action</a>
                </li>
                <li>
                    <a href="#">
                        <i class="icon-shield"></i> Another action</a>
                </li>
                <li>
                    <a href="#">
                        <i class="icon-user"></i> Something else here</a>
                </li>
                <li class="divider"> </li>
                <li>
                    <a href="#">
                        <i class="icon-bag"></i> Separated link</a>
                </li>
            </ul>
        </div>*}
    </div>
</div>
<!-- END PAGE BAR -->
<!-- BEGIN PAGE TITLE-->
<h1 class="page-title"> Bienvenido
    <small></small>
</h1>
{if $msjC eq 'si'}
<div class="alert alert-info alert-dismissable">
  <button type="button" class="close" data-dismiss="alert">&times;</button>
  <strong>El perfil se actualizo correctamente</strong>
</div>
{/if}

{if $msjCc eq 'si'}
<div class="alert alert-info alert-dismissable">
  <button type="button" class="close" data-dismiss="alert">&times;</button>
  <strong>La contrasela se actualizo correctamente</strong>
</div>
{/if}

<!-- END PAGE TITLE-->
<!-- END PAGE HEADER-->
<div class="row">
    <div class="col-md-12">
        <!-- BEGIN PROFILE SIDEBAR -->
        <div class="profile-sidebar">
            <!-- PORTLET MAIN -->
            <div class="portlet light profile-sidebar-portlet ">
                <!-- SIDEBAR USERPIC -->
                <div class="profile-userpic">
                    <img src="{{$infoStudent.imagen}}" class="img-responsive" alt=""> </div>
                <!-- END SIDEBAR USERPIC -->
                <!-- SIDEBAR USER TITLE -->
                <div class="profile-usertitle">
                    <div class="profile-usertitle-name"> {$User.username} </div>
                    <div class="profile-usertitle-job"> Alumno </div>
                </div>
                <!-- END SIDEBAR USER TITLE -->
                <!-- SIDEBAR BUTTONS -->
{*
                <div class="profile-userbuttons">
                    <button type="button" class="btn btn-circle green btn-sm">Follow</button>
                    <button type="button" class="btn btn-circle red btn-sm">Message</button>
                </div>
*}
                <!-- END SIDEBAR BUTTONS -->
                <!-- SIDEBAR MENU -->
                <div class="profile-usermenu">
                    <ul class="nav">
						<li>
                            <a href="{$WEB_ROOT}/perfil" >
                               <i class="fa fa-user" aria-hidden="true"></i>Perfil
							</a>
                        </li>
                        <li class="">
                            <a href="{$WEB_ROOT}/alumn-services ">
                                <i class="icon-settings"></i> Actualizar Información</a>
                        </li>
                        <!--<li>
                            <a href="{$WEB_ROOT}/tv ">
                                <i class="fa fa-video-camera"></i> VideoConferencias </a>
                        </li>
                        <li>
                            <a href="{$WEB_ROOT}/recorded ">
                                <i class="fa fa-camera"></i> Grabaciones </a>
                        </li>-->
						<!--
						<li>
                            <a href="{$WEB_ROOT}/view-solicitud" >
                               <i class="fa fa-folder-open" aria-hidden="true"></i>Solicitudes
							</a>
                        </li>-->
						<li>
						<a href="{$WEB_ROOT}/graybox.php?page=formato-reinscripcion" data-target="#ajax" data-toggle="modal" data-width="1000px">
						  <i class="fa fa-file-text" aria-hidden="true"></i>Descargar Formatos de Inscripción/Reinscripción
						</a>
						</li>
						<li>
						<!--<a href="{$WEB_ROOT}/ver-calendario" ><onClick="verCalendario()"
						   <i class="fa fa-calendar"></i>Calendario de Pagos
						</a>
						</li>-->
						<li>
						<a href="{$WEB_ROOT}/finanzas">
						  <i class="fa fa-dollar"></i> Finanzas
						</a>
						</li>
						<li>
						<a href="{$WEB_ROOT}/inbox/or/h" >
						 <i class="fa fa-comments"></i>Inbox
						</a>
						</li>
						<li>
						<a href="{$WEB_ROOT}/graybox.php?page=contra" data-target="#ajax" data-toggle="modal" data-width="1000px">
						   <i class="fa fa-unlock-alt"></i>Cambiar Contraseña
						</a>
						</li>
						<li>
						<a href="{$WEB_ROOT}/personal-academico" >
						   <i class="fa fa-sitemap"></i>Personal Academico
						</a>
                        </li>
                        {if $showRegulation}
                            <li>
                                <a href="{$WEB_ROOT}/reglamento">
                                    <i class="fa fa-balance-scale"></i> Reglamento General de Posgrado
                                </a>
                            </li>
                        {/if}
                    </ul>
                </div>
                <!-- END MENU -->
            </div>
            <!-- END PORTLET MAIN -->
            <!-- PORTLET MAIN -->
            <div class="portlet light ">
{*
                <!-- STAT -->
                <div class="row list-separated profile-stat">
                    <div class="col-md-4 col-sm-4 col-xs-6">
                        <div class="uppercase profile-stat-title"> 37 </div>
                        <div class="uppercase profile-stat-text"> Projects </div>
                    </div>
                    <div class="col-md-4 col-sm-4 col-xs-6">
                        <div class="uppercase profile-stat-title"> 51 </div>
                        <div class="uppercase profile-stat-text"> Tasks </div>
                    </div>
                    <div class="col-md-4 col-sm-4 col-xs-6">
                        <div class="uppercase profile-stat-title"> 61 </div>
                        <div class="uppercase profile-stat-text"> Uploads </div>
                    </div>
                </div>
                <!-- END STAT -->
*}
                <div>
                    <h4 class="profile-desc-title">Acerca del IAP Chiapas</h4>
                    <span class="profile-desc-text"> El <b>Instituto de Administración Pública del Estado de Chiapas, A. C.</b><br />te da la mas cordial bienvenida a nuestro Sistema de Educación en Línea.</span>
                    <div class="margin-top-20 profile-desc-link">
                        <i class="fa fa-globe"></i>
                        <a href="http://www.iapchiapas.org.mx">www.iapchiapas.edu.mx</a>
                    </div>
                    <div class="margin-top-20 profile-desc-link">
                        <i class="fa fa-facebook"></i>
                        <a href="https://www.facebook.com/IAPChiapas">iapchiapas</a>
                    </div>
                </div>
            </div>
            <!-- END PORTLET MAIN -->
        </div>
        <!-- END BEGIN PROFILE SIDEBAR -->
        <!-- BEGIN PROFILE CONTENT -->
        <div class="profile-content">
            <div class="row">
                <div class="col-md-12">
                    <!-- BEGIN PORTLET -->
                    <div class="portlet light ">
                        <div class="portlet-title tabbable-line">
                            <div class="caption caption-md">
                                <i class="icon-globe theme-font hide"></i>
                                <span class="caption-subject font-blue-madison bold uppercase">Bitácora</span>
                            </div>
                            <ul class="nav nav-tabs">
                                <li class="active">
                                    <a href="#tab_1_1" data-toggle="tab"> Notificaciones </a>
                                </li>
                                <li >
                                    <a href="#tab_1_2" data-toggle="tab"> Avisos </a>
                                </li>
                            </ul>
                        </div>
                        <div class="portlet-body">
                            <!--BEGIN TABS-->
                            <div class="tab-content">
                                <div class="tab-pane " id="tab_1_2">
                                    <div class="scroller" style="height: 320px;" data-always-visible="1" data-rail-visible1="0" data-handle-color="#D7DCE2">
                                        <ul class="feeds">

                                            {foreach from=$announcements item=item}
                                            <li>
                                                <div class="col1">
                                                    <div class="cont">
                                                        <div class="cont-col1">
                                                            <div class="label label-sm label-success">
                                                                <i class="fa fa-bell-o"></i>
                                                            </div>
                                                        </div>
                                                        <div class="cont-col2">
                                                            <div class="desc">
                                                                <b>{$item.title}</b>: {$item.description}
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col2">
                                                    <div class="date"> {$item.date|date_format:"%d %b '%y"} </div>
                                                </div>
                                            </li>
                                            {/foreach}

                                        </ul>
                                    </div>
                                </div>
                                <div class="tab-pane active" id="tab_1_1">
                                    <div class="scroller" style="height: {$div_height}px;" data-always-visible="1" data-rail-visible1="0" data-handle-color="#D7DCE2">
                                        {if $download}
                                            <h2 class="text-center">Tú título electrónico está <b>disponible</b> para la descarga.</h2>
                                            <center>
                                                <a href="{$WEB_ROOT}/files/titulos/{$fileCer}" target="_blank">
                                                    <img src="{$WEB_ROOT}/images/downCer.png" class="img-responsive" />
                                                </a>
                                            </center>
                                        {/if}
                                        {*<ul class="feeds">
                                            {foreach from=$notificaciones item=reply}
                                                {if $reply.vistaPermiso==1}

                                                <li>
                                                <a href="{$WEB_ROOT}{$reply.enlace}">
                                                    <div class="col1">
                                                        <div class="cont">
                                                            <div class="cont-col1">
                                                                <div class="label label-sm label-success">
                                                                    <i class="fa fa-bell-o"></i>
                                                                </div>
                                                            </div>
                                                            <div class="cont-col2">
                                                                <div class="desc">
                                                                    {$reply.actividad} por {$reply.nombre}
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col2">
                                                        <div class="date"> {$reply.fecha_aplicacion|date_format:"%d %b '%y"} </div>
                                                    </div>
                                                </a>
                                            </li>
                                                {/if}
                                            {/foreach}
                                        </ul>*}
                                    </div>
                                </div>
                            </div>
                            <!--END TABS-->
                        </div>
                    </div>
                    <!-- END PORTLET -->
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <!-- BEGIN PORTLET -->
                    <div class="portlet light ">
                        <div class="portlet-title">
                            <div class="caption caption-md">
                                <i class="icon-bar-chart theme-font hide"></i>
                                <span class="caption-subject font-blue-madison bold uppercase">Curricula Activa</span>
                            </div>
                        </div>
                        <div class="portlet-body">
                            <div class="table-scrollable table-scrollable-borderless">
                                <table class="table table-hover table-light" >
                                    <thead>
                                    <tr class="uppercase">

                                        <th style="text-align: center"> Tipo </th>
                                        <th style="text-align: center"> Nombre </th>
										 <th style="text-align: center"> Grupo </th>
                                        <th style="text-align: center"> Modalidad </th>
                                        <th style="text-align: center"> Fecha Inicial </th>
                                        <th style="text-align: center"> Fecha Final </th>
{*
                                        <th style="text-align: center"> Pagos </th>
*}

                                        <th style="text-align: center"> Modulos </th>

                                        <th style="text-align: center"> Acciones </th>
                                    </tr>
                                    </thead>
                                    {foreach from=$activeCourses item=subject}
                                    <tr>

                                        <td align="center">{$subject.majorName}</td>
                                        <td align="center">{$subject.name}</td>
										  <td align="center">{$subject.group}
                                        <td align="center">{$subject.modality}</td>
                                        <td align="center">{$subject.initialDate|date_format:"%d-%m-%Y"}</td>
                                        <td align="center">{$subject.finalDate|date_format:"%d-%m-%Y"}</td>

{*
                                        <td align="center">{$subject.payments}</td>
*}
                                        <td align="center">{$subject.courseModule}

                                        <td align="center">
                                            <a href="{$WEB_ROOT}/graybox.php?page=view-modules-course-student&id={$subject.courseId}" data-target="#ajax" data-toggle="modal" data-width="1000px">
                                            <i class="fa fa-sign-in fa-lg"></i>
                                            </a>
                                            {*if $subject.totalPeriods > 0}
                                                <a href="{$WEB_ROOT}/graybox.php?page=calendar-student&id={$subject.courseId}&user={$subject.alumnoId}" data-target="#ajax" data-toggle="modal" data-width="1000px" title="Calendario de Pagos">
                                                    <i class="fa fa-dollar fa-lg"></i>
                                                </a>
                                            {/if*}
                                        </td>
                                     </tr>
                                        {foreachelse}
                                        <tr>
                                            <td colspan="12" align="center">No se encontr&oacute; ning&uacute;n registro.</td>
                                        </tr>

                                    {/foreach}

                                </table>
                            </div>
                        </div>
                    </div>
                    <!-- END PORTLET -->
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <!-- BEGIN PORTLET -->
                    <div class="portlet light ">
                        <div class="portlet-title">
                            <div class="caption caption-md">
                                <i class="icon-bar-chart theme-font hide"></i>
                                <span class="caption-subject font-blue-madison bold uppercase">Curricula Inactiva</span>
                            </div>
                        </div>
                        <div class="portlet-body">
                            <div class="table-scrollable table-scrollable-borderless">
                                <table class="table table-hover table-light">
                                    <thead>
                                    <tr class="uppercase">
                                        <th style="text-align: center"> Clave </th>
                                        <th style="text-align: center"> Tipo </th>
                                        <th style="text-align: center"> Nombre </th>
                                        <th style="text-align: center"> Modalidad </th>
                                        <th style="text-align: center"> Fecha Inicial </th>
                                        <th style="text-align: center"> Fecha Final </th>
                                        {*
                                                                                <th> Pagos </th>
                                        *}
                                        <th style="text-align: center"> Dias Activo </th>
                                        <th style="text-align: center"> Modulos </th>
{*
                                        <th> Acciones </th>
*}
                                    </tr>
                                    </thead>
                                    {foreach from=$inactiveCourses item=subject}

                                    <tr>
                                        <td align="center">{$subject.clave}</td>
                                        <td align="center">{$subject.majorName}</td>
                                        <td align="center">{$subject.name}</td>
                                        <td align="center">{$subject.modality}</td>
                                        <td align="center">{$subject.initialDate|date_format:"%d-%m-%Y"}</td>
                                        <td align="center">{$subject.finalDate|date_format:"%d-%m-%Y"}</td>
                                        <td align="center">{$subject.daysToFinish}</td>
                                        {*
                                                                                <td align="center">{$subject.payments}</td>
                                        *}
                                        <td align="center">{$subject.courseModule}
{*
                                        <td align="center">
                                            <a href="{$WEB_ROOT}/graybox.php?page=view-modules-course-student&id={$subject.courseId}" data-target="#ajax" data-toggle="modal">
                                                <i class="fa fa-sign-in fa-lg"></i>
                                            </a>
                                        </td>
*}
                                        </tr>
                                        {foreachelse}
                                        <tr>
                                            <td colspan="12" align="center">No se encontr&oacute; ning&uacute;n registro.</td>
                                        </tr>
                                        {/foreach}

                                </table>
                            </div>
                        </div>
                    </div>
                    <!-- END PORTLET -->
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <!-- BEGIN PORTLET -->
                    <div class="portlet light ">
                        <div class="portlet-title">
                            <div class="caption caption-md">
                                <i class="icon-bar-chart theme-font hide"></i>
                                <span class="caption-subject font-blue-madison bold uppercase">Curricula Finalizada</span>
                            </div>
                        </div>
                        <div class="portlet-body">
                            <div class="table-scrollable table-scrollable-borderless">
                                <table class="table table-hover table-light">
                                    <thead>
                                    <tr class="uppercase">
                                        <th style="text-align: center"> Clave </th>
                                        <th style="text-align: center"> Tipo </th>
                                        <th style="text-align: center"> Nombre </th>
                                        <th style="text-align: center"> Modalidad </th>
                                        <th style="text-align: center"> Fecha Inicial </th>
                                        <th style="text-align: center"> Fecha Final </th>
                                        {*
                                                                                <th> Pagos </th>
                                        *}
                                        <th style="text-align: center"> Dias Activo </th>
                                        <th style="text-align: center"> Modulos </th>
                                        <th style="text-align: center"> Calificación </th>
                                    </tr>
                                    </thead>
                                    {foreach from=$finishedCourses item=subject}

                                    <tr>
                                        <td style="text-align: center">{$subject.clave}</td>
                                        <td style="text-align: center">{$subject.majorName}</td>
                                        <td style="text-align: center">{$subject.name}</td>
                                        <td style="text-align: center">{$subject.modality}</td>
                                        <td style="text-align: center">{$subject.initialDate|date_format:"%d-%m-%Y"}</td>
                                        <td style="text-align: center"style="text-align: center">{$subject.finalDate|date_format:"%d-%m-%Y"}</td>
                                        <td >{$subject.daysToFinish}</td>
                                        {*
                                                                                <td align="center">{$subject.payments}</td>
                                        *}
                                        <td style="text-align: center">{$subject.courseModule}
                                        <td style="text-align: center">{$subject.mark}</td>
                                     </tr>
                                        {foreachelse}
                                        <tr>
                                            <td colspan="12" align="center">No se encontr&oacute; ning&uacute;n registro.</td>
                                        </tr>
                                    {/foreach}

                                </table>
                            </div>
                        </div>
                    </div>
                    <!-- END PORTLET -->
                </div>
            </div>
        </div>
        <!-- END PROFILE CONTENT -->
    </div>
</div>
