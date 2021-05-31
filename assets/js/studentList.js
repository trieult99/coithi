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
    // $(e.parentElement).append('<li class="list-group-item" style="cursor: pointer" onclick="addViolation(this)"><u>Add</u></li>');
    // $("1").replace(e)
    console.log(1111);
    $("#ModalLabel").html("Thí sinh " + $(e).attr("data-mssv") + " vi phạm:");
    $('#Modal').attr({ "data-mssv": $(e).attr("data-mssv"), "data-classroomcode": $(e).attr("data-classroomcode"), "data-ulid": $(e).attr("data-ulid") });
}

$("#addNote").click(() => {
    let mssv = $('#Modal').attr("data-mssv");
    let classroomcode = $('#Modal').attr("data-classroomcode");
    let note = $("#content").val() + " - " + $("#solution").val();
    if ($("#content").val() == "" || $("#solution").val() == "") {
        alert("Vui lòng nhập đây đủ sai phạm và biện pháp xử lý");
    } else
        if (note != "" && confirm("Xác nhận sinh viên " + mssv + " vi phạm?")) {
            let formData = new FormData();
            formData.append("classroomcode", classroomcode);
            formData.append("mssv", mssv);
            formData.append("note", note);
            classroom_updateStudent(formData);
            $ulEle = $('#' + $('#Modal').attr("data-ulid"));
            $liEle = $('#' + $('#Modal').attr("data-ulid") + ' li').last();
            $ulEle.append('<li class="list-group-item" style="cursor: pointer" onclick="addViolation(this)"><u>Add</u></li>');
            $liEle.replaceWith('<li class="list-group-item">' + note + '</li>');
        }
})