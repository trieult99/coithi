<section class="searchmssv">
    <div class="container">
        <h2 class="heading">TRA CỨU THÔNG TIN SINH VIÊN</h2>

        <form action="/search/search_mssv.gbe" class="searchbar">
            <div class="input-group">
                <input type="search" class="form-control" name="mssv" placeholder="Nhập mã số sinh viên ..." value="<?= $mssv ? $mssv : '' ?>" />
                <button type="submit" class="btn btn-outline-primary">Tìm kiếm</button>
            </div>
        </form>
        <?php if ($error) { ?>
            <div class="text-center text-danger"><?= $error ?></div>
        <?php } ?>
        <?php if ($studentInfo) { ?>
            <div id="searchmssv__info">
                <div class="row">
                    <div class="col-3 text-center">
                        <img width="100%" src="<?= IMAGE_SERVER . $mssv ?>.jpg" alt="">
                    </div>
                    <div class="col-8 offset-1">
                        <h4>Thông tin cá nhân</h4>
                        <div>Họ tên: <?= $studentInfo["name"] ?></div>
                        <div>MSSV: <?= $studentInfo["mssv"] ?></div>
                        <hr>
                        <h4>Lịch thi</h4>
                        <table id="TableSort" class="table table-bordered">
                            <thead class="thead-light">
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Thời gian thi</th>
                                    <th scope="col">Phòng thi</th>
                                    <th scope="col">Môn thi</th>
                                    <!-- <th scope="col">Đã lấy đề</th>
                                    <th scope="col">GV có mặt</th> -->
                                    <th scope="col"></th>

                                </tr>
                            </thead>
                            <tbody>
                                <?php if ($studentSchedules) foreach ($studentSchedules as $index => $schedule) { ?>
                                    <tr>
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
                                        <!-- <td>
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
                                        </td> -->
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
                </div>
            </div>
        <?php } ?>
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