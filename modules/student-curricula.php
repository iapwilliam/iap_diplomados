<?php
$student->setUserId($_GET["id"]);
$activeCourses = $course->getCourses("AND course.finalDate >= NOW()");
$smarty->assign('activeCourses', $activeCourses); 
$activeCoursesStudent = $student->getCourses("AND user_subject.alumnoId = {$_GET['id']}");
$smarty->assign("activeCourseStudent", $activeCoursesStudent);
$smarty->assign("student", $_GET['id']);