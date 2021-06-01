function classroom_updateStudent(formData) {
    xhr(main_http_server + "ajax/updateStudent.gbe", formData, (res) => {
        var response = JSON.parse(res);
        if (response.error != '') {
            alert(response.error)
        }
    });
}

function checkAbsent(e) {

    if (e.checked == 1) {
        if (confirm("Xác nhận sinh viên " + e.getAttribute("data-mssv") + " vắng mặt?")) {
            let formData = new FormData();
            formData.append("classroomcode", e.getAttribute("data-classroomcode"));
            formData.append("mssv", e.getAttribute("data-mssv"));
            formData.append("isabsent", e.checked ? 1 : 0);
            classroom_updateStudent(formData);
        }
        else e.checked = !e.checked
    } else {
        e.checked = !e.checked;
        alert("Bạn không thể thay đổi trạng thái đã vắng của sinh viên")
    }

}

function openModal(e) {
    $("#ModalLabel").html("Thí sinh " + $(e).attr("data-mssv") + " vi phạm:");
    $('#Modal').attr({ "data-mssv": $(e).attr("data-mssv"), "data-classroomcode": $(e).attr("data-classroomcode"), "data-ulid": $(e).attr("data-ulid") });
}

$("#addNote").click(() => {
    let mssv = $('#Modal').attr("data-mssv");
    let classroomcode = $('#Modal').attr("data-classroomcode");
    let note = $("#content").val() + " - " + $("#solution").val();
    // var file_data;

    // if ($("#solution").val() != "")
    //     file_data = $('#reportImg').prop('files')[0];

    if ($("#reportImg").val() == "") {
        alert("Đăng tải biên bản dưới dạng hình ảnh cho biện pháp 'Lập biên bản'");
    } else
        if (note != "" && confirm("Xác nhận sinh viên " + mssv + " vi phạm?")) {
            let formData = new FormData();
            // -------------------------------------------
            // if (file_data) {
            //     let form_data = new FormData();
            //     form_data.append('image', file_data);
            //     xhr(main_http_server + "uploadimage.php", form_data, (res) => {
            //         var response = JSON.parse(res);
            //         // if (response.error != '') {
            //         alert(response)
            //         // }
            //     });
            // }
            // -------------------------------------------
            formData.append("classroomcode", classroomcode);
            formData.append("mssv", mssv);
            formData.append("note", note);
            classroom_updateStudent(formData);
            location.reload();
            // $ulEle = $('#' + $('#Modal').attr("data-ulid"));
            // $liEle = $('#' + $('#Modal').attr("data-ulid") + ' li').last();
            // $ulEle.append(`<li name="handleaddevent" class="list-group-item" style="cursor: pointer" data-bs-toggle="modal" data-bs-target="#Modal" onclick="openModal(this)" data-mssv="{mssv}" data-classroomcode="<?= $classroomcode ?>" data-ulid="vp_<?= $index ?>"><u>Add</u></li>`);
            // $liEle.replaceWith('<li class="list-group-item">' + note + '</li>');
        }
})
// var file_data = $('#file').prop('files')[0];
$('#solution').on('change', function () {
    console.log(this.value);
    if (this.value == "Lập biên bản")
        $("#reportImgContainer").show();
    else
        $("#reportImgContainer").hide();
})