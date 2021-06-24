// $("#teacher_department").onchange(() => {
    
//     let form_data = new FormData();
//     form_data.append('image', file_data);

//     xhr(main_http_server + "uploadschedule.php", form_data, (res) => {
//         var response = JSON.parse(res);
//     if (response[0].status == 'sucess') {
//         console.log(response[0].url);
//         formData.append("image", response[0].url);

//         // Gọi xhr api tại đây

//         location.reload();
//     }
//  })


// });



$('#teacher_department').change(function (e) {
    $departmentcode = $(this).val();
    //showLoading();
    let form_data = new FormData();
    form_data.append('departmentcode', $departmentcode);

    xhr(main_http_server + "ajax/getTeacherListGroupByDepartment.gbe", form_data, (res) => {
        var response = JSON.parse(res);
    if (response.status == true) {
        $teacherelement = $("#teacher_list");
        $teacherelement.html("");
        $.each(response['data'], function (index, value) {
            $html = "<option value='" + value['usercode'] + "'>" + value['fullname'] + "</option>";
            $("#teacher_list").append($html);
        });
        $teacherelement.trigger('change');
    }
 })
});