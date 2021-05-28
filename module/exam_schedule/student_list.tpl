<section class="studentlist">
    <div class="container">
        <h2 class="heading">Danh sách sinh viên - Phòng <?= $classroom["classroomname"] ?></h2>
        <div>
            <p>Môn: <?= $classroom["subjectname"] ?></p>
            <p>Thời gian: <?= $classroom["time"] ?></p>
            <p>Giám thị 1: <?= $classroom["supervisor1name"] ?></p>
            <p>Giám thị 2: <?= $classroom["supervisor2name"] ?></p>
        </div>
        <div class="text-end">
            <!-- <a href="#" class="text-warning">Chỉnh sửa thông tin</a> -->
            <a href="ajax/pdf_server.php?file=student" class="text-info">Download DSSV</a>
        </div>
        <table id="TableSort" class="table table-bordered">
            <thead class="thead-light">
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">MSSV</th>
                    <th scope="col">Họ và tên</th>
                    <th scope="col" style="width: 10%;">Vắng</th>
                    <th scope="col" style="width: 40%">Ghi chú</th>

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
                            <input class="form-check-input" type="checkbox" disabled <?= $student["isabsent"] ? "checked" : ""  ?>>
                        </td>
                        <td>
                            <ul class="list-group list-group-flush">
                                <?php if ($student["note"]) foreach ($student["note"] as $index => $note) { ?>
                                    <li class="list-group-item">
                                        <span><?= $note["content"] . ($note["solution"] ? (" - " . $note["solution"]) : "") ?></span>
                                    </li>
                                <?php } ?>
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