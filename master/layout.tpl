<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <?php include("master/head.php")?>
</head>

<body>
<div class="modalLoading"><!--Loading--></div>
<!-- Header -->
<?php if($gbeFunction != "login") include("master/header.php") ?>
<!-- End Header -->

<!-- Main -->
<?php include($gbeTemplatePath)?>
<!-- End Main -->

<!-- Footer -->

<!-- End Footer -->

<?php include("master/foot.php")?>
</body>

</html>
