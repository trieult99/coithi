<?php
error_reporting(E_ERROR | E_PARSE);
function reArrayFiles(&$file_post)
{
    $file_ary = array();
    $file_count = count($file_post['name']);
    $file_keys = array_keys($file_post);

    for ($i = 0; $i < $file_count; $i++) {
        foreach ($file_keys as $key) {
            $file_ary[$i][$key] = $file_post[$key][$i];
        }
    }
    return $file_ary;
}

$response = array();
//--------------------- CONFIG ---------------------------
$mtypes = array(
    'jpg' => 'image/jpeg',
    'png' => 'image/png',
    'gif' => 'image/gif'
); // mimetype
$limitFileSize = 30000000; // 3000000 = 30MB.
$root_dir = "assets/img/report/"; // chỗ lưu file
$createDir_permission = true; // quyền tạo subfolder
$sub_dir = $root_dir;
//--------------------- END CONFIG ---------------------------


if (!empty(@$_GET['subdir'])) {
    $sub_dir = $root_dir . @$_GET['subdir'] . "/"; //thêm subfolder
}

if ($createDir_permission == true) {
    if (!is_dir($sub_dir)) {
        mkdir($sub_dir);
    }
} else {
    $response["error"] = "Folder không tồn tại";
    echo json_encode($response);
    exit;
}

$files_post = reArrayFiles($_FILES['imagepath']);
foreach ($files_post as $file) {
    $finfo = new finfo(FILEINFO_MIME_TYPE);
    $ext = pathinfo($file["name"], PATHINFO_EXTENSION);
    $filesize = $file['size'];
    $fileName = str_replace("." . $ext, "-" . uniqid() . "." . $ext, $file["name"]);
    $target_file = $sub_dir . $fileName;
    $filetype = $finfo->file($file['tmp_name']);
    $res_item = array(
        "type" => $filetype,
        //"filename" => $file["name"] . uniqid(),
        "filename" => $fileName,
        "url" => $target_file,
        "status" => "",
        "message" => ""
    );

    // validate file type
    if (!array_search($filetype, $mtypes, true)) {
        $res_item["status"] = "failed";
        $res_item["message"] = "Định dạng file không đúng";
        array_push($response, $res_item);
        continue;
    };

    // validate file size
    if ($filesize > $limitFileSize) {
        $res_item["status"] = "failed";
        $res_item["message"] = "File quá nặng";
        array_push($response, $res_item);
        continue;
    }

    // check upload success
    if (!move_uploaded_file($file["tmp_name"], $target_file)) {
        $res_item["status"] = "failed";
        $res_item["message"] = "Có lỗi xảy ra khi upload file";
        array_push($response, $res_item);
        continue;
    } else {
        $res_item["status"] = "sucess";
        $res_item["message"] = "File đã được upload thành công";
        array_push($response, $res_item);
    }
}
echo json_encode($response);
?>