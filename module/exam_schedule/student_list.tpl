<section class="studentlist">
    <div class="container">
        <div class="heading">
            <h2 class="d-inline">Danh sách sinh viên - Phòng <?= $classroom["classroomname"] ?></h2>
            <a href="/data/dssv/<?= $classroomcode ?>.csv" download class="text-secondary"><i class="fas fa-file-download"></i> DSSV.csv</a>
        </div>
        <div>
            <p><span class="fw-bold">Môn:</span> <?= $classroom["subjectname"] ?></p>
            <p><span class="fw-bold">Thời gian thi:</span> <?= $classroom["time"] ?></p>
            <p><span class="fw-bold">Giám thị 1:</span> <?= $classroom["supervisor1name"] ?></p>
            <p><span class="fw-bold">Giám thị 2:</span> <?= $classroom["supervisor2name"] ?></p>
            <p><span class="fw-bold">Sĩ số lớp:</span> <?= $classroom["number_of_students_present"] ?>/<?= $classroom["number_of_studens"] ?></p>
        </div>
        <!-- <hr> -->
        <!-- <div class="text-end">
            <a href="ajax/pdf_server.php?file=student" class="text-info">Download DSSV</a>
        </div> -->
        <table id="TableSort" class="table table-bordered">
            <thead class="thead-light">
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">MSSV</th>
                    <th scope="col">Họ và tên</th>
                    <th scope="col" style="width: 10%;">Vắng</th>
                    <th scope="col" style="width: 40%">Vi phạm</th>

                </tr>
            </thead>
            <tbody>
                <?php if ($studentList) foreach ($studentList as $index => $student) { ?>
                    <tr>
                        <th scope="row">
                            <?= $index ?>
                        </th>
                        <td><?= $student["mssv"] ?></td>
                        <td><?= $student["name"] ?></td>
                        <td>
                            <input onclick="checkAbsent(this)" data-classroomcode="<?= $classroomcode ?>" data-mssv="<?= $student["mssv"] ?>" data-name="<?= $student["name"] ?>" class="form-check-input" type="checkbox" <?= $session["loginusertypecode"] == "teacher" ? "" : "disabled" ?> <?= $student["isabsent"] ? "checked" : ""  ?>>
                        </td>
                        <td>
                            <ul class="list-group list-group-flush" id="vp_<?= $index ?>">
                                <?php if ($student["note"]) foreach ($student["note"] as $idx => $note) { ?>
                                    <li class="list-group-item">
                                        <span><?= $note["content"] . ($note["solution"] ? (" - " . $note["solution"]) : "") ?></span>
                                    </li>
                                <?php } ?>
                                <li class="list-group-item">
                                    <!-- onclick="addViolation(this)" -->
                                    <div class="btn btn-secondary btn-sm">
                                        Add
                                    </div>
                                </li>
                            </ul>
                        </td>
                    </tr>
                <?php } ?>
            </tbody>
        </table>
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
                targets: [2, 3, 4]
            }]
        });
    });
</script>