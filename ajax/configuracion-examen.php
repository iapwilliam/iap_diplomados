<?php

// echo "<pre>"; print_r($_POST);

	include_once('../init.php');
	include_once('../config.php');
	include_once(DOC_ROOT.'/libraries.php');

	
	session_start();
	
	switch($_POST["type"])
	{
		case 'EditTest':
				
			// echo "lle";
			// echo "<pre>"; print_r($_POST);
			$activity->setPregunta($_POST["question"]);
			$activity->setOpcionA($_POST["opcionA"]);
			$activity->setOpcionB($_POST["opcionB"]);
			$activity->setOpcionC($_POST["opcionC"]);
			$activity->setOpcionD($_POST["opcionD"]);
			$activity->setOpcionE($_POST["opcionE"]);
			$activity->setRespuesta($_POST["answer"]);
			$activity->setTestId($_POST["Id"]);
			
			if($activity->EditTest()){
				echo "ok[#]";
				$test->setActivityId($_POST["activityId"]);
				$tests = $test->Enumerate();
				$smarty->assign('tests', $tests);
				$smarty->display(DOC_ROOT.'/templates/lists/questions.tpl');
			}else{
				echo "fail[#]";
				$smarty->display(DOC_ROOT.'/templates/boxes/status.tpl');
				// $smarty->display(DOC_ROOT.'/templates/boxes/status_on_popup.tpl');
			}
							
		break;

	
	}

?>
