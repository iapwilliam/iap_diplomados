<?php
		
	/* For Session Control - Don't remove this */
	$user->allow_access(37);	

//	print_r($_SESSION); EXIT;
	if($_POST)
	{
	
  //print_r($_POST['ponderation']);exit;
  	    $activity->setActivityId($_GET["id"]);
		$actividad = $activity->Info();
		$group->setCourseModuleId($actividad["courseModuleId"]);
		$group->EditScore($_POST["modality"], $_GET["id"], $_POST["ponderation"], $_POST["retro"]);
	 
	 }

	$activity->setActivityId($_GET["id"]);
	$actividad = $activity->Info();
	$smarty->assign('actividad', $actividad);
	
	$module->setCourseModuleId($actividad["courseModuleId"]);
	$info = $module->InfoCourseModule();

	//grupo
	$group->setCourseModuleId($actividad["courseModuleId"]);
	$group->setCourseId($info["courseId"]);
	$theGroup = $group->ScoreGroup($actividad["modality"], $actividad["activityType"], $_GET["id"]);
	$smarty->assign('theGroup', $theGroup);


?>