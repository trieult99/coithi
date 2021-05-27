<section class="examschedule">
    <div class="container">
        <h2 class="heading">LỊCH THI</h2>

        <table id="TableSort" class="table table-bordered">
            <thead class="thead-light">
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Ngày giờ</th>
                    <th scope="col">Phòng thi</th>
                    <th scope="col">Môn thi</th>
                    <th scope="col">Đã lấy đề</th>
                    <th scope="col">GV có mặt</th>
                    <th scope="col"></th>

                </tr>
            </thead>
            <tbody>
                <?php if ($listSchedule) foreach ($listSchedule as $index => $schedule) { ?>
                <tr>
                    <th scope="row">
                        <?= $index ?>
                    </th>
                    <td>
                        <?= $schedule["time"] ?>
                    </td>
                    <td>
                        <?= $schedule["classroomcode"] ?>
                    </td>
                    <td>
                        <?= $schedule["subjectname"] ?>
                    </td>
                    <td>
                        <form action="">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox">
                            </div>
                        </form>
                    </td>
                    <td>
                        <form action="">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="">
                                <label class="form-check-label" for="flexCheckDefault">
                                    <?= $schedule["supervisor1name"] ?>
                                </label>
                            </div>
                        </form>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" disabled checked>
                            <label class="form-check-label" for="flexCheckDefault">
                                <?= $schedule["supervisor2name"] ?>
                            </label>
                        </div>
                    </td>
                    <td>
                        <div>
                            <a href="<?php HTTP_SERVER ?>/exam_schedule/student_list.gbe?classroomcode=<?=$schedule['classroomcode']?>"
                                target="_blank">Danh sách sinh
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
            }]
        });
    });
</script>