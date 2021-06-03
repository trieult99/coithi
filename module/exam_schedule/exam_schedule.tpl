<section class="examschedule">
    <div class="container">
        <h2 class="heading">LỊCH THI</h2>
        <?php if ($session["loginusertypecode"] == "secretary") { ?>
            <div class="input-group mb-3">
                <input type="file" class="form-control" id="uploadschedulefile" aria-describedby="uploadschedule" aria-label="Upload" accept=".csv">
                <button class="btn btn-outline-primary" type="button" id="uploadschedule">Tạo lịch thi mới</button>
            </div>
        <?php } ?>
        <table id="TableSort" class="table table-bordered">
            <thead class="thead-light">
                <tr>
                    <th scope="col">STT</th>
                    <th scope="col">Thời gian thi</th>
                    <th scope="col">Phòng thi</th>
                    <th scope="col">Môn thi</th>
                    <th scope="col">Đã lấy đề</th>
                    <th scope="col">Giám thị có mặt</th>
                    <th scope="col">Giám thị bổ sung</th>
                    <th scope="col"></th>

                </tr>
            </thead>
            <tbody>
                <?php if ($listSchedule) foreach ($listSchedule as $index => $schedule) { ?>
                    <tr class="bg-light">
                        <th scope="row">
                            <?= $index + 1 ?>
                        </th>
                        <td>
                            <?= $schedule["time"] ?>
                        </td>
                        <td>
                            <?= $schedule["classroomname"] ?>
                        </td>
                        <td>
                            <?= $schedule["subjectname"] ?>
                        </td>
                        <td>
                            <input data-classroomname="<?= $schedule['classroomname'] ?>" data-classroomcode="<?= $schedule['classroomcode'] ?>" class="form-check-input" type="checkbox" <?= $session["loginusertypecode"] == "secretary" ? 'onclick="checkExam(this)"' : "disabled" ?> <?= $schedule["exampaperstatus"]  ? "checked" : "" ?>>
                        </td>
                        <td>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" disabled <?= $schedule["issupervisor1came"] ? "checked" : "" ?>>
                                <label class="form-check-label" for="flexCheckDefault" <?= $schedule["issupervisor1came"] ? "style='opacity: 1'" : ($schedule["issupervisor1block"] ? "style='color: red'" : "") ?>>
                                    <?= $schedule["supervisor1name"] ?>
                                    <?= $schedule["issupervisor1came"] ? '(' . $schedule["supervisor1checkintime"] . ')' : "" ?>
                                </label>
                            </div>

                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" disabled <?= $schedule["issupervisor2came"] ? "checked" : "" ?>>
                                <label class="form-check-label" for="flexCheckDefault" <?= $schedule["issupervisor2came"] ? "style='opacity: 1'" : ($schedule["issupervisor2block"] ? "style='color: red'" : "") ?>>
                                    <?= $schedule["supervisor2name"] ?>
                                    <?= $schedule["issupervisor2came"] ? '(' . $schedule["supervisor2checkintime"] . ')' : "" ?>
                                </label>
                            </div>

                        </td>
                        <td>
                            <?php if ($schedule["supervisorbackup"] != "") { ?>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="" disabled <?= $schedule["issupervisorbackupcame"] ? "checked" : "" ?>>
                                    <label class="form-check-label" for="flexCheckDefault" <?= $schedule["issupervisorbackupcame"] ? "style='opacity: 1'" : ($schedule["issupervisorbackupblock"] ? "style='color: red'" : "") ?>>
                                        <?= $schedule["supervisorbackupname"] ?>
                                        <?= $schedule["issupervisorbackupcame"] ? '(' . $schedule["supervisorbackupcheckintime"] . ')' : "" ?>
                                    </label>
                                </div>
                                <?php if ($session["loginusertypecode"] == "secretary") { ?>
                                    <div name="handleaddevent" style="cursor: pointer" data-bs-toggle="modal" data-bs-target="#Modal" onclick="openModal(this)" data-classroomname="<?= $schedule['classroomname'] ?>" data-classroomcode="<?= $schedule["classroomcode"] ?>">
                                        <small class="text-warning"><i class="fas fa-user-edit"></i> Edit</small>
                                    </div>
                                <?php } ?>
                                <?php } else {
                                if ($session["loginusertypecode"] == "secretary") { ?>
                                    <div name="handleaddevent" style="cursor: pointer" data-bs-toggle="modal" data-bs-target="#Modal" onclick="openModal(this)" data-classroomname="<?= $schedule['classroomname'] ?>" data-classroomcode="<?= $schedule["classroomcode"] ?>">
                                        <small class="text-success"><i class="fas fa-user-plus"></i> Add</small>
                                    </div>
                            <?php }
                            } ?>
                        </td>
                        <td>
                            <div>
                                <a href="<?php HTTP_SERVER ?>/exam_schedule/student_list.gbe?classroomcode=<?= $schedule['classroomcode'] ?>" target="_blank">Danh sách sinh viên</a>
                            </div>
                        </td>
                    </tr>
                <?php } ?>
            </tbody>
        </table>
    </div>

    <div class="modal fade" id="Modal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="ModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="ModalLabel"></h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <label class="form-label mt-2" for="teacherList">Supervisor</label>
                    <!-- <input class="form-control" id="teacherList" type="text"> -->
                    <select class="form-select" id="teacherList">
                    </select>

                    <!-- <input class="form-control" id="solution" type="text"> -->
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" id="addNote">Add</button>
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
                targets: [2, 3, 4, 5, 6, 7]
            }],
            "createdRow": function(row, data, index) {
                let currentDate = moment().format("DD-MM-YYYY");
                let dateData = moment(data[1], "HH:mm:ss DD-MM-YYYY").format("DD-MM-YYYY");
                if (currentDate == dateData) $(row).addClass("bg-white");
            }
        });
    });
</script>