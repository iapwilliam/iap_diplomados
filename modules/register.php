<?php
	
	/* For Session Control - Don't remove this */
	//$user->allow_access(4);	
	/* End Session Control */

$paises=$student->EnumeratePaises();	
		$smarty->assign('paises',$paises);

$prof = $profesion->Enumerate();
				$prof = $util->EncodeResult($prof);
				$smarty->assign('prof',$prof);
	$activeCourses = $course->EnumerateActive();
	$smarty->assign("activeCourses", $activeCourses);	
	
?>