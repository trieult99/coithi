function classroom_updateExamPaperStatus(formData) {
    xhr(main_http_server + "ajax/updateExamPaperStatus.gbe", formData, (res) => {
        var response = JSON.parse(res);
        if (response.error != '') {
            alert(response.error)
        }
    });
}

function checkExam(e) {

    if (e.checked == 1) {
        if (confirm("Xác nhận lớp " + e.getAttribute("data-classroomname") + " đã lấy đề?")) {
            let formData = new FormData();
            formData.append("classroomcode", e.getAttribute("data-classroomcode"));
            classroom_updateExamPaperStatus(formData);
        }
        else e.checked = !e.checked
    } else {
        e.checked = !e.checked;
        alert("Bạn không thể thay đổi trạng thái đã lấy đề")
    }

}

function openModal(e) {
    $("#ModalLabel").html("Bổ sung giám thị coi thi phòng " + $(e).attr("data-classroomname"));
    $('#Modal').attr({ "data-classroomcode": $(e).attr("data-classroomcode") });
    // teacherList
    let formData = new FormData();
    formData.append("classroomcode", $(e).attr("data-classroomcode"));
    xhr(main_http_server + "ajax/getTeacherList.gbe", formData, (res) => {
        var response = JSON.parse(res);
        if (response.error == '') {
            let arr = "";
            (response.data).forEach(teacher => {
                arr += `<option value="${teacher.usercode}" selected>${teacher.fullname} - ${teacher.usercode}</option>`;
            });
            $("#teacherList").html(arr);
        }
    });
}


function classroom_addSupervisorBackup(formData) {
    xhr(main_http_server + "ajax/addSupervisorBackup.gbe", formData, (res) => {
        var response = JSON.parse(res);
        if (response.error != '') {
            alert(response.error)
        }
    });
}
$("#addNote").click(() => {
    let classroomcode = $('#Modal').attr("data-classroomcode");
    let teachercode = $("#teacherList").val();
    if (confirm("Xác nhận bổ sung giám thị?")) {
        let formData = new FormData();
        formData.append("classroomcode", classroomcode);
        formData.append("teachercode", teachercode);
        classroom_addSupervisorBackup(formData);
        location.reload();
    }
})

$("#uploadschedule").click(() => {
    if (confirm("Xác nhận đăng tải lịch thi?") && $("#uploadschedulefile")[0].files.length != 0) {
        var file_data;
        file_data = $('#uploadschedulefile').prop('files')[0];

        let form_data = new FormData();
        form_data.append('image', file_data);

        xhr(main_http_server + "uploadschedule.php", form_data, (res) => {
            var response = JSON.parse(res);
            if (response[0].status == 'sucess') {
                console.log(response[0].url);
                formData.append("image", response[0].url);
                
                // Gọi xhr api tại đây

                location.reload();
            }
        })

    }
});