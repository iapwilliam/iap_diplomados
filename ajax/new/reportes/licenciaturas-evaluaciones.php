<?php
include_once('../../init.php');
include_once('../../config.php');
include_once(DOC_ROOT . '/libraries.php');
session_start();

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\IOFactory;

$licenciatura = $_GET['licenciatura'];
$grupo = $_GET['grupo'];
 
if ($licenciatura == 0) {
    $licenciaturas = $course->getCourses("AND subject.tipo = 4");
}elseif ($licenciatura != 0 && $grupo == 0) { 
    $licenciaturas = $course->getCourses("AND subject.subjectId = $licenciatura");
}else{
    $licenciaturas = $course->getCourses("AND course.courseId = $grupo");
}

foreach ($licenciaturas as $key => $licenciatura) {
    $licenciaturas[$key]['registrados'] = $course->getStudents("AND user_subject.courseId = {$licenciatura['courseId']}");
}



$spreadsheet = new Spreadsheet();

// Set document properties
$spreadsheet->getProperties()->setCreator('William Ramírez')
    ->setLastModifiedBy('William Ramírez')
    ->setTitle('Evaluaciones Curso')
    ->setSubject('Alumnos')
    ->setDescription('Evaluaciones del Curso Formación Académica Continua')
    ->setKeywords('Alumnos')
    ->setCategory('Cursos');
$sheet = $spreadsheet->getActiveSheet();

$ultimo_indice = count($licenciaturas) - 1;
foreach ($licenciaturas as $key => $item) {
    $course->setCourseId($item['courseId']);
    $courseData = $course->getCourse();
    $headings = $course->getHeadersActivities("AND course_module.courseId = {$item['courseId']} ORDER BY activity.resumen ASC");
    $students = $course->getStudents("AND user_subject.courseId = {$item['courseId']}");
    $sheet = $spreadsheet->getActiveSheet(); 
    $sheet->getDefaultColumnDimension()->setWidth(30);
    $sheet->setTitle($item['subject_name']. " GRUPO ". $item['group']);
    $sheet->setCellValue('A1', 'Usuario');
    $sheet->setCellValue('B1', 'Nombre');
    $sheet->setCellValue('C1', 'Apellido Paterno');
    $sheet->setCellValue('D1', 'Apellido Materno'); 
    $auxHeading = "E";

    foreach ($headings as $item) {
        $sheet->setCellValue("{$auxHeading}1", $item['resumen']);
        $auxHeading++;
    } 

    $auxRow = 2;
    for ($i = 0; $i < (count($students)); $i++) {
        $curp = json_decode($students[$i]['curpDrive'], true);
        $sheet->setCellValue("A" . ($i + 2), $students[$i]['controlNumber']);
        $sheet->setCellValue("B" . ($i + 2), mb_strtoupper($students[$i]['names']));
        $sheet->setCellValue("C" . ($i + 2), mb_strtoupper($students[$i]['lastNamePaterno']));
        $sheet->setCellValue("D" . ($i + 2), mb_strtoupper($students[$i]['lastNameMaterno'])); 
        $auxColumn = "E";
        foreach ($headings as $heading) {
            if ($heading['activityType'] == "Tarea") {
                $data = $student->getActivityScore($heading['activityType'], "AND userId = {$students[$i]['userId']} AND activityId = {$heading['activityId']}");
                $sheet->setCellValue("{$auxColumn}{$auxRow}", (!isset($data['homeworkId'])  ? "NO ENTREGÓ" : $data['countUpdate'])); 
            }
            if ($heading['activityType'] == "Examen") {
                $data = $student->getActivityScore($heading['activityType'], "AND userId = {$students[$i]['userId']} AND activityId = {$heading['activityId']}");
                $sheet->setCellValue("{$auxColumn}{$auxRow}", ($data ? $data['try'] : 0));
            }
            $auxColumn++;
        }
        $auxRow++;
    }

    $sheet->getStyle("A2:$auxHeading" . (count($students) + 1))->getAlignment()->setHorizontal('center')->setVertical('center')->setWrapText(true);
    if ($ultimo_indice !== $key) {
        $spreadsheet->createSheet();
        $spreadsheet->setActiveSheetIndex($key + 1);
    }
}

$fileName = bin2hex(random_bytes(4));
// Redirect output to a client’s web browser (Xls)
header('Content-Type: application/vnd.ms-excel; charset=utf-8');
header('Content-Disposition: attachment;filename="evaluaciones_cursos_' . $fileName . '.xls"');
header('Cache-Control: max-age=0');
// If you're serving to IE 9, then the following may be needed
header('Cache-Control: max-age=1');

// If you're serving to IE over SSL, then the following may be needed
header('Expires: Mon, 26 Jul 1997 05:00:00 GMT'); // Date in the past
header('Last-Modified: ' . gmdate('D, d M Y H:i:s') . ' GMT'); // always modified
header('Cache-Control: cache, must-revalidate'); // HTTP/1.1
header('Pragma: public'); // HTTP/1.0

$writer = IOFactory::createWriter($spreadsheet, 'Xls');
$writer->save('php://output');
