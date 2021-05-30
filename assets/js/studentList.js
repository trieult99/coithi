function classroom_updateStudent(formData, e) {
    xhr(main_http_server + "ajax/updateStudent.gbe", formData, (res) => {
        // var response = JSON.parse(res);
        // if (response.error == '') {
        //     console.log(response)
        // }

    });
}

function checkAbsent(e) {
    // var studentData = 
    let formData = new FormData();
    formData.append("classroomcode", e.getAttribute("data-classroomcode"));
    formData.append("mssv", e.getAttribute("data-mssv"));

    if (e.checked == 1) {
        if (confirm("Xác nhận sinh viên " + formData.get("mssv") + " vắng mặt?")) {
            formData.append("isabsent", e.checked ? 1 : 0);
            classroom_updateStudent(formData, e);
        }
        else e.checked = !e.checked
    } else {
        // formData.append("isabsent", e.checked ? 1 : 0);
        // classroom_updateStudent(formData, e);
        e.checked = !e.checked;
        alert("Bạn không thể thay đổi trạng thái đã vắng của sinh viên")
    }

}

function addViolation(e) {
    console.log(e.parentElement);
}