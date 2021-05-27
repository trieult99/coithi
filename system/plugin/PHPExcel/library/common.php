<?php
function readExcelToArray($inputFileName)
{
    //  Read your Excel workbook
    try {
        $inputFileType = PHPExcel_IOFactory::identify($inputFileName);
        $objReader = PHPExcel_IOFactory::createReader($inputFileType);
        $objPHPExcel = $objReader->load($inputFileName);
    } catch (Exception $e) {
        die('Error loading file "' . pathinfo($inputFileName, PATHINFO_BASENAME) . '": ' . $e->getMessage());
    }

    //  Get worksheet dimensions
    $sheet = $objPHPExcel->getSheet(0); //get data of sheet 0
    $highestRow = $sheet->getHighestRow(); //get maxRowIndex
    $highestColumn = $sheet->getHighestColumn(); //get maxColumnIndex

    $columns = array();
    $dataIndex = 0;
    $data = array();
    for ($rowIndex = 1; $rowIndex <= $highestRow; $rowIndex++) {
        $rowData = $sheet->rangeToArray('A' . $rowIndex . ':' . $highestColumn . $rowIndex, NULL, TRUE, FALSE);
        if($rowIndex == 1) {
            foreach($rowData[0] as $colIndex => $colValue) {
                $columns[] = $colValue;
            }
        } else {
            if(count($columns) > 0) {
                $data[$dataIndex] = array();
                foreach($rowData[0] as $colIndex => $colValue) {
                    $data[$dataIndex][$columns[$colIndex]] = $colValue;
                }
                $dataIndex++;
            }

        }
    }

    unset($objPHPExcel);
    unset($objReader);

    return $data;
}
