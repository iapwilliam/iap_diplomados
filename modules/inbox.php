<?php
		
	/* For Session Control - Don't remove this */
//	$user->allow_access(8);	

	if ($_SESSION['User']['type']=='student'){
		$module->setQuienEnviaId('personal');
		$smarty->assign('mnuSubmain','foro');
	}else{
		
		$module->setQuienEnviaId('alumno');
		$smarty->assign('mnuMain', "cursos");
	}
	$module->setStatusIn('activo');
	$module->setTipoReporte('entrada');
	$module->setRecibeId($_SESSION['User']['userId']);
	$module->setCMId($_GET["id"]);
	$lstMsj = $module->EnumerateInbox();
	
	// exit;
	// $smarty->assign('myModule', $myModule);
	
	// $forum->setCourseId($myModule["courseId"]);
	// $forum = $forum->Enumerate();
	// echo "<pre>"; print_r($infoC);
	// exit;
	// $smarty->assign('forum', $forum);
	
	$smarty->assign('id', $_GET["id"]);
	
	$smarty->assign('infoC', $infoC);
	$smarty->assign('courseMId', $_GET["id"]);
	$smarty->assign('lstMsj', $lstMsj);
	

?>