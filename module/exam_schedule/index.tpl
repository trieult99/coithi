<section class="examschedule">
    <div class="container">
        <h2 class="heading">LỊCH THI</h2>
        <!-- Button trigger modal -->
        <!-- <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
            Launch demo modal
        </button>

        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        ...
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Save changes</button>
                    </div>
                </div>
            </div>
        </div> -->
        <!-- ------------------- -->
        <table id="TableSort" class="table table-bordered">
            <thead class="thead-light">
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Thời gian thi</th>
                    <th scope="col">Phòng thi</th>
                    <th scope="col">Môn thi</th>
                    <th scope="col">Đã lấy đề</th>
                    <th scope="col">GV có mặt</th>
                    <th scope="col"></th>

                </tr>
            </thead>
            <tbody>
                <?php if ($listSchedule) foreach ($listSchedule as $index => $schedule) { ?>
                    <tr class="bg-light">
                        <th scope="row">
                            <?= $index ?>
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
                            <input class="form-check-input" type="checkbox" <?= $session["loginusertypecode"] == "secretary" ? "" : "disabled" ?> <?= $schedule["exampaperstatus"]  ? "checked" : "" ?>>
                        </td>
                        <td>
                            <?php if ($schedule["supervisor1"] == $session["loginusercode"]) ?>
                            <form action="" class="mb-0">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="" disabled <?= $schedule["supervisor1came"]  ? "checked" : "" ?>>
                                    <label class="form-check-label" for="flexCheckDefault">
                                        <?= $schedule["supervisor1name"] ?>
                                        <?= $schedule["supervisor1came"] ? '(' . $schedule["supervisor1checkintime"] . ')' : "" ?>
                                    </label>
                                </div>

                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="" disabled <?= $schedule["supervisor1came"]  ? "checked" : "" ?>>
                                    <label class="form-check-label" for="flexCheckDefault">
                                        <?= $schedule["supervisor2name"] ?>
                                        <?= $schedule["supervisor2came"] ? '(' . $schedule["supervisor2checkintime"] . ')' : "" ?>
                                    </label>
                                </div>
                            </form>
                        </td>
                        <td>
                            <div>
                                <a href="<?php HTTP_SERVER ?>/exam_schedule/student_list.gbe?classroomcode=<?= $schedule['classroomcode'] ?>" target="_blank">Danh sách sinh
                                    viên</a> -
                                <a href="#" class="text-success"><i class="fas fa-download"></i></a>
                            </div>
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
                targets: [2, 3, 4, 5, 6]
            }],
            "createdRow": function(row, data, index) {
                let currentDate = moment().format("DD-MM-YYYY");
                let dateData = moment(data[1], "HH:mm:ss DD-MM-YYYY").format("DD-MM-YYYY");
                if (currentDate == dateData) $(row).addClass("bg-white");
            }
        });
    });
</script>