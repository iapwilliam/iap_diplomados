<!DOCTYPE html>
<html lang="en">

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<title>Sistema de Educaci&oacute;n en Linea | IAP Chiapas</title>

		{*<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css" />*}
		<link href="{$WEB_ROOT}/assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
		<link href="{$WEB_ROOT}/assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
		{*<link href="{$WEB_ROOT}/assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />*}
		<link href="{$WEB_ROOT}/assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css" />
		{*<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">*}
		{* END GLOBAL MANDATORY STYLES *}
		{* BEGIN THEME GLOBAL STYLES *}
		{*<link href="{$WEB_ROOT}/assets/global/css/components-md.css" rel="stylesheet" id="style_components" type="text/css" />*}
		<link href="{$WEB_ROOT}/assets/global/css/plugins-md.min.css" rel="stylesheet" type="text/css" />
		{* END THEME GLOBAL STYLES *}
		{if ($page == 'homepage' && $User.type == 'student') || ($page == 'homepage' && $User.type == 'Docente') || $page == 'docente'}
			<link href="{$WEB_ROOT}/assets/pages/css/profile.min.css" rel="stylesheet" type="text/css" />
		{/if}
		{if $page == 'inbox' or $page == 'reply-inbox' or $page == 'view-inbox'}
			<link href="{$WEB_ROOT}/css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css"  />
		{/if}
		{* BEGIN THEME LAYOUT STYLES *}
		{*<link href="{$WEB_ROOT}/assets/layouts/layout/css/layout.min.css" rel="stylesheet" type="text/css" />*}
		{*<link href="{$WEB_ROOT}/assets/layouts/layout/css/themes/light2.css" rel="stylesheet" type="text/css" id="style_color" />*}
		{*<link href="{$WEB_ROOT}/assets/layouts/layout/css/custom.min.css" rel="stylesheet" type="text/css" />*}
		<link href="{$WEB_ROOT}/assets/global/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.css" rel="stylesheet" type="text/css" />
		<link href="{$WEB_ROOT}/assets/global/plugins/jquery-multi-select/css/multi-select.css" rel="stylesheet" type="text/css" />
		{* END THEME LAYOUT STYLES *}
		<link rel="shortcut icon" href="{$WEB_ROOT}/images/favicon_iap.ico" />
		<link href="{$WEB_ROOT}/GreyBox/greybox/gb_styles.css" rel="stylesheet" type="text/css" />
		<link href="{$WEB_ROOT}/css/inbox.css" rel="stylesheet" type="text/css"  />
		{*<link href="{$WEB_ROOT}/css/radiobutton.css" rel="stylesheet" type="text/css"  />*}
		{*<style>
			.modal-dialog {
				width: 70%;
			}
			i.icon-green {
				color: #32c5d2;
			}
		</style>*}
		<link href="{$WEB_ROOT}/assets/fullcalendar/fullcalendar.css" rel="stylesheet" type="text/css"/>
		{if $page == 'reply-inbox' or 
			$page == 'view-inbox' or
			$page == 'edit-modules-course' or
			$page == 'info-docente' or 
			$page == 'lst-docentes' or 
			$page == 'prog-materia' or 
			$page == 'report-docentes' or 
			$page == 'perfil' or 
			$page == 'materias'}
			<style type="text/css">
				.btn-file {
					position: relative;
					overflow: hidden;
					border: 1px solid #00BCD4;
					color:  #00BCD4;
				}
				.btn-file input[type=file] {
					position: absolute;
					top: 0;
					right: 0;
					min-width: 100%;
					min-height: 100%;
					font-size: 100px;
					text-align: right;
					filter: alpha(opacity=0);
					opacity: 0;
					outline: none;
					background: red;
					cursor: inherit;
					display: block;
				}
			</style>
		{/if}
		{* New styles *}
        <link rel="stylesheet" href="{$WEB_ROOT}/assets/vcz/vendor/sweetalert2/dist/sweetalert2.min.css">
		<link rel="stylesheet" href="{$WEB_ROOT}/assets/vcz/vendor/fontawesome/css/all.min.css">
		<link rel="stylesheet" href="{$WEB_ROOT}/assets/vcz/vendor/iconfonts/mdi/css/materialdesignicons.min.css">
  		<link rel="stylesheet" href="{$WEB_ROOT}/assets/vcz/vendor/css/vendor.bundle.base.css">
		<link rel="stylesheet" href="{$WEB_ROOT}/assets/vcz/vendor/jodit/build/jodit.css">
		<link rel="stylesheet" href="{$WEB_ROOT}/assets/vcz/vendor/flatpickr/flatpickr.min.css">
        <link rel="stylesheet" href="{$WEB_ROOT}/assets/vcz/css/style.css">
		<link rel="shortcut icon" href="{$WEB_ROOT}/images/logos/iconIap.png" />
		{* End new styles *}
	</head>
	<body>
		<div class="container-scroller">
			{* Header *}
			{include file="new/header.tpl"}
			<div class="container-fluid page-body-wrapper">
				{* Sidebar *}
				{if $vistaPrevia eq 1}
					{include file="new/sidebar_vp.tpl"}
				{else}
					{if ($User.type ne "Docente" or $page ne 'homepage')}
						{include file="new/sidebar.tpl"}
					{/if}
				{/if}
				{* End sidebar *}
				<div class="main-panel">
					{* Container *}
					<div class="content-wrapper">
						{include file="new/container.tpl"}
					</div>
					{* End container *}
					<div id="frmModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true"></div>
					{* Footer *}
					{include file="new/footer.tpl"}
					{* End footer *}
				</div>
			</div>
		</div>

		{* New scripts *}
		<script src="{$WEB_ROOT}/assets/vcz/vendor/js/vendor.bundle.base.js"></script>
		<script src="{$WEB_ROOT}/assets/vcz/vendor/js/vendor.bundle.addons.js"></script>
		<script src="{$WEB_ROOT}/assets/vcz/js/off-canvas.js"></script>
		{*<script src="{$WEB_ROOT}/assets/vcz/js/hoverable-collapse.js"></script>*}
		<script src="{$WEB_ROOT}/assets/vcz/js/misc.js"></script>
		<script src="{$WEB_ROOT}/assets/vcz/vendor/fontawesome/js/all.min.js"></script>
		<script src="{$WEB_ROOT}/assets/vcz/js/bootbox.min.js"></script>
		<script src="{$WEB_ROOT}/assets/vcz/vendor/jodit/build/jodit.js"></script>
		<script src="{$WEB_ROOT}/assets/vcz/vendor/flatpickr/flatpickr.js"></script>
		<script src="{$WEB_ROOT}/assets/vcz/js/dashboard.js"></script>
		{* End new scripts *}

		{* Scripts headers *}
		<script type="text/javascript" src="{$WEB_ROOT}/tinymce/tiny_mce.js"></script>
		<script type="text/javascript">
			var GB_ROOT_DIR = "{$WEB_ROOT}/GreyBox/greybox/";
		</script>
		<script type="text/javascript" src="{$WEB_ROOT}/GreyBox/greybox/AJS.js"></script>
		<script type="text/javascript" src="{$WEB_ROOT}/GreyBox/greybox/AJS_fx.js"></script>
		<script type="text/javascript" src="{$WEB_ROOT}/GreyBox/greybox/gb_scripts.js"></script>
		<script type="text/javascript" src="{$WEB_ROOT}/javascript/inbox.js"></script>
		<script src="{$WEB_ROOT}/assets/jquery.multiple.select.js"></script>
		<script>
			$(function() {
				$('#ms').change(function() {
					console.log($(this).val());
				}).multipleSelect({
					width: '100%'
				});
			});
		</script>
		{* End scripts headers *}
		{* BEGIN CORE PLUGINS *}
		<script src="{$WEB_ROOT}/assets/global/plugins/jquery.min.js" type="text/javascript"></script>
		<script src="{$WEB_ROOT}/assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
		<script src="{$WEB_ROOT}/assets/global/plugins/js.cookie.min.js" type="text/javascript"></script>
		<script src="{$WEB_ROOT}/assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
		<script src="{$WEB_ROOT}/assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
		<script src="{$WEB_ROOT}/assets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
		{* END CORE PLUGINS *}
		<script>
			//$j = jQuery.noConflict();
			//$.noConflict(true);
		</script>
		{* BEGIN THEME GLOBAL SCRIPTS *}
		<script src="{$WEB_ROOT}/assets/global/scripts/app.js" type="text/javascript"></script>
		{* END THEME GLOBAL SCRIPTS *}
		{* BEGIN THEME LAYOUT SCRIPTS *}
		<script src="{$WEB_ROOT}/assets/layouts/layout/scripts/layout.js" type="text/javascript"></script>
		<script src="{$WEB_ROOT}/assets/global/plugins/moment.min.js" type="text/javascript"></script>
		<script src="{$WEB_ROOT}/assets/global/plugins/bootstrap-daterangepicker/daterangepicker.min.js" type="text/javascript"></script>
		<script src="{$WEB_ROOT}/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js?sdfdddddasd" type="text/javascript"></script>
		<script src="{$WEB_ROOT}/assets/global/plugins/bootstrap-timepicker/js/bootstrap-timepicker.min.js" type="text/javascript"></script>
		<script src="{$WEB_ROOT}/assets/global/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js?jjsadasd" type="text/javascript"></script>
		<script src="{$WEB_ROOT}/assets/global/plugins/clockface/js/clockface.js" type="text/javascript"></script>
		{include file="{$DOC_ROOT}/templates/config.tpl"}
		<script src="{$WEB_ROOT}/javascript/new/functions.js?{$timestamp}" type="text/javascript"></script>
		<script src="{$WEB_ROOT}/assets/global/plugins/bootstrap-wysihtml5/wysihtml5-0.3.0.js" type="text/javascript"></script>
		<script src="{$WEB_ROOT}/assets/global/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.js" type="text/javascript"></script>
		{*<script src="{$WEB_ROOT}/assets/global/plugins/bootbox/bootbox.min.js" type="text/javascript"></script>*}
		<script src="{$WEB_ROOT}/assets/global/plugins/bootstrap-growl/jquery.bootstrap-growl.min.js" type="text/javascript"></script>
		<script src="{$WEB_ROOT}/assets/global/plugins/jquery-multi-select/js/jquery.multi-select.js" type="text/javascript"></script>
		<script src="{$WEB_ROOT}/assets/global/plugins/jquery.sparkline.min.js" type="text/javascript"></script>
		{if $page eq "calendar-image-modules-student"}
			<script src="{$WEB_ROOT}/assets/fullcalendar/fullcalendar.min.js" type="text/javascript"></script>
			<script src="{$WEB_ROOT}/assets/fullcalendar/app.js" type="text/javascript"></script>
		{/if}
		<script src="{$WEB_ROOT}/javascript/new/{$page}.js?{$timestamp}" type="text/javascript"></script>
		<script src="{$WEB_ROOT}/assets/pages/scripts/profile.min.js" type="text/javascript"></script>
	</body>

</html>
