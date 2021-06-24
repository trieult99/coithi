<div class="header">
    <nav class="navbar navbar-expand-sm navbar-light bg-light">
        <div class="container">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-lg-0">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Lịch thi
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDarkDropdownMenuLink">
                            <li><a class="dropdown-item" href="<?php HTTP_SERVER ?>/exam_schedule/exam_schedule.gbe?type=today">Trong ngày</a></li>
                            <li><a class="dropdown-item" href="<?php HTTP_SERVER ?>/exam_schedule/exam_schedule.gbe?type=all">Cả mùa thi</a></li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<?php HTTP_SERVER ?>/search/search_mssv.gbe">Tra cứu thông tin sinh viên</a>
                    </li>

                   

                    <?php if ($_SESSION["loginusertypecode"] == "secretary") { ?>
                        <li class="nav-item">
                            <a class="nav-link" href="<?php HTTP_SERVER ?>/fingerprint/add_fingerprint.gbe">Update/Test dữ liệu vân tay</a>
                        </li>
                    <?php } ?>
                </ul>
                <div class="dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <span><i class="fas fa-user"></i> <?= $_SESSION["loginuserfullname"] ?></span>
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="<?php HTTP_SERVER ?>/logout.php">Log Out</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </nav>
</div>