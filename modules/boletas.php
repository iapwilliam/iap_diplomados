<?php
$student->setUserId($_SESSION['User']["userId"]);
$infoStudent   = $student->GetInfo();
$course->setCourseId($_GET['id']);
$courseInfo = $course->Info();
$qualificationsTmp = $student->GetLastQualifications($_GET['id']);
$qualifications = [];
$evaluations = [];
foreach($qualificationsTmp as $item)
{
    $qualifications[$item['semesterId']] = $item;
    $totalEval = $student->GetTotalEvalDocente($_GET['id'], $item['semesterId']);
    $evaluations[$item['semesterId']] = $totalEval;
}
echo "<pre>";
print_r($evaluations);
exit;
$smarty->assign("infoStudent", $info);
$smarty->assign("courseInfo", $courseInfo);
$smarty->assign("qualifications", $qualifications);