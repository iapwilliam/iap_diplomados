<?php
$estados = $student->EnumerateEstados(); 
$course->setCourseId(15);
$dataCourse = $course->getCourse(); 
$smarty->assign("estados", $estados);
$smarty->assign("curso", $dataCourse);