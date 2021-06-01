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