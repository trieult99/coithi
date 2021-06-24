<section class="studentlist">
    <div class="container">
        <div class="heading">
            <h2 class="d-inline">Danh sách sinh viên - Phòng <?= $classroom["classroomname"] ?></h2>
        </div>
        <div>
            <p><span class="fw-bold">Môn:</span> <?= $classroom["subjectname"] ?></p>
            <p><span class="fw-bold">Thời gian thi:</span> <?= $classroom["time"] ?></p>
            <p><span class="fw-bold">Giám thị 1:</span> <?= $classroom["supervisor1name"] ?></p>
            <p><span class="fw-bold">Giám thị 2:</span> <?= $classroom["supervisor2name"] ?></p>
            <p><span class="fw-bold">Sĩ số lớp:</span> <?= $classroom["number_of_students_present"] ?>/<?= $classroom["number_of_studens"] ?></p>
        </div>
        <!-- <hr> -->
        <table id="TableSort" class="table table-bordered">
            <thead class="thead-light">
                <tr>
                    <th scope="col">STT</th>
                    <th scope="col">MSSV</th>
                    <th scope="col">Họ và tên</th>
                    <th scope="col" style="width: 10%;">Vắng</th>
                    <th scope="col" style="width: 40%">Vi phạm</th>
                    <th scope="col"> Biên bản </th>
                </tr>
            </thead>
            <tbody>
                <?php if ($studentList) foreach ($studentList as $index => $student) { ?>
                    <tr>
                        <th scope="row">
                            <?= $index + 1 ?>
                        </th>
                        <td>
                            <a href="<?= HTTP_SERVER ?>/search/search_mssv.gbe?mssv=<?= $student['mssv'] ?>"><?= $student["mssv"] ?></a>
                        </td>
                        <td><?= $student["name"] ?></td>
                        <td>
                            <input data-classroomcode="<?= $classroomcode ?>" data-mssv="<?= $student["mssv"] ?>" data-name="<?= $student["name"] ?>" class="form-check-input" type="checkbox" <?= $session["loginusertypecode"] == "teacher" ? 'onclick="checkAbsent(this)"' : "disabled" ?> <?= $student["isabsent"] ? "checked" : ""  ?>>
                        </td>
                        <td>
                            <ul class="list-group list-group-flush" id="vp_<?= $index ?>">
                                <?php if ($student["note"]) foreach ($student["note"] as $idx => $note) { ?>
                                    <li class="list-group-item">
                                        <span><?= $note["content"] . ($note["solution"] ? (" - " . $note["solution"]) : "") ?></span>
                                    </li>
                                <?php } ?>
                                <?php if ($session["loginusertypecode"] == "teacher") { ?>
                                    <li name="handleaddevent" class="list-group-item" style="cursor: pointer" data-bs-toggle="modal" data-bs-target="#Modal" onclick="openModal(this)" data-mssv="<?= $student['mssv'] ?>" data-classroomcode="<?= $classroomcode ?>" data-ulid="vp_<?= $index ?>">
                                        <u>Add</u>
                                    </li>
                                <?php } ?>
                            </ul>
                        </td>
                        <td>
                            <?php if ($student["report"] != "") { ?>
                                <a href="<?= HTTP_SERVER . '/' . $student["report"] ?>" class="text-dark" download><i class="fas fa-file-download"></i> BBVP_<?= $student['mssv'] ?>.jpg</a>
                            <?php } ?>
                        </td>
                    </tr>
                <?php } ?>
            </tbody>
        </table>

        <div class="modal fade" id="Modal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="ModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="ModalLabel"></h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <label class="form-label" for="content">Nội dung vi phạm</label>
                        <select class="form-select" id="content">
                            <option value="CT001" selected>Quay cóp</option>
                            <option value="CT002">Xem tài liệu</option>
                        </select>

                        <label class="form-label mt-2" for="solution">Hình thức xử lý</label>
                        <select class="form-select" id="solution">
                            <option value="SL001" selected>Nhắc nhở</option>
                            <option value="SL002">Lập biên bản</option>
                        </select>

                        <div id="reportImgContainer" style="display: none">
                            <label class="form-label mt-2" for="reportImg">Biên bản (upload image)</label>
                            <input type="file" class="form-control" id="reportImg" accept="image/*">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" id="addNote">Add</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<script>
    $(document).ready(function() {
        $('#TableSort').DataTable({
            "paging": false,
            "info": false,
            "aaSorting": [],
            columnDefs: [{
                orderable: false,
                targets: [2, 3, 4, 5]
            }]
        });
    });
</script>