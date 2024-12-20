<?php
include_once('../../init.php');
include_once('../../config.php');
include_once(DOC_ROOT . '/libraries.php');
session_start();

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\IOFactory;

$licenciatura = $_GET['licenciatura'];
$grupo = $_GET['curso'];
$licenciaturas = $course->getCourses("AND course.courseId = $grupo");
$spreadsheet = new Spreadsheet();

// Set document properties
$spreadsheet->getProperties()->setCreator('William Ramírez')
    ->setLastModifiedBy('William Ramírez')
    ->setTitle('Evaluaciones Curso')
    ->setSubject('Alumnos')
    ->setDescription('Evaluaciones del Diplomado')
    ->setKeywords('Alumnos')
    ->setCategory('Cursos');
$sheet = $spreadsheet->getActiveSheet();

$ultimo_indice = count($licenciaturas) - 1;
foreach ($licenciaturas as $key => $item) {
    $course->setCourseId($item['courseId']);
    $courseData = $course->getCourse();
    $headings = $course->getModulesCourse("AND course_module.courseId = {$item['courseId']}");
    
    $students = $course->getStudents("AND user_subject.courseId = {$item['courseId']} AND user.userId <> 1");
    $sheet = $spreadsheet->getActiveSheet();
    $sheet->getDefaultColumnDimension()->setWidth(30);
    $titulo = mb_strtoupper($util->eliminar_acentos($item['subject_name']));
    $sheet->setTitle(substr($titulo, 0, 27) . "...");
    $sheet->setCellValue('A1', $titulo);
    $sheet->getStyle('A1')->getFont()->setSize(14)->setBold(true);

    $sheet->setCellValue('A2', 'Usuario');
    $sheet->setCellValue('B2', 'Nombre');
    $sheet->setCellValue('C2', 'Apellido Paterno');
    $sheet->setCellValue('D2', 'Apellido Materno');
    $sheet->setCellValue('E2', 'Correo');
    $sheet->setCellValue('F2', 'Teléfono');
    $sheet->setCellValue('G2', 'Curp');
    $sheet->setCellValue('H2', 'Curp Archivo');
    $auxHeading = "I";

    foreach ($headings as $item) {
        $sheet->setCellValue("{$auxHeading}2", $item['name']);
        $auxHeading++;
    }

    $sheet->mergeCells("A1:{$auxHeading}1")->getStyle("A1:{$auxHeading}1")->getAlignment()->setHorizontal('center')->setVertical('center');

    $auxRow = 3;
    for ($i = 0; $i < (count($students)); $i++) {
        $curp = json_decode($students[($i - 3)]['curpDrive'], true);
        $sheet->setCellValue("A" . ($i + 3), $students[$i]['controlNumber']);
        $sheet->setCellValue("B" . ($i + 3), mb_strtoupper($students[$i]['names']));
        $sheet->setCellValue("C" . ($i + 3), mb_strtoupper($students[$i]['lastNamePaterno']));
        $sheet->setCellValue("D" . ($i + 3), mb_strtoupper($students[$i]['lastNameMaterno']));
        $sheet->setCellValue("E" . ($i + 3), mb_strtoupper($students[$i]['email']));
        $sheet->setCellValue("F" . ($i + 3), mb_strtoupper($students[$i]['phone']));
        $sheet->setCellValue("G" . ($i + 3), mb_strtoupper($students[$i]['curp']));
        $sheet->setCellValue("H" . ($i + 3), "https://drive.google.com/open?id=" . $curp['googleId']);
        $sheet->getCell('H' . ($i + 3))->getHyperlink()->setUrl("https://drive.google.com/open?id=" . $curp['googleId']);
        $auxColumn = "I";
        foreach ($headings as $heading) {
            $where = "AND activity.courseModuleId = {$heading['courseModuleId']} AND activity_score.userId = {$students[$i]['userId']};";
            $total = $student->getModuleCalification($where);
            $sheet->setCellValue("{$auxColumn}{$auxRow}", number_format($total,2));
            $auxColumn++;
        }
        $auxRow++;
    }

    $sheet->getStyle("A2:$auxHeading" . (count($students) + 2))->getAlignment()->setHorizontal('center')->setVertical('center')->setWrapText(true);
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
