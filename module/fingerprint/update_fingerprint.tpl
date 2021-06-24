


<section class="searchmssv">
    <div class="container">
        <h2 class="heading">TEST/UPDATE THÔNG TIN VÂN TAY CỦA GIÁO VIÊN</h2>

        <form action="/fingerprint/add_fingerprint.gbe" class="searchbar">
            <div class="input-group">
                <select class="form-select" aria-label="Default select example" name = "teacher_department" id = "teacher_department">
                    <?php foreach ($Department_List as $department) { ?>
                        <option value=<?php echo $department['departmentcode'] ?>><?php echo $department['departmentname'] ?></option>
                    <?php } ?>
                </select>

                <select class="form-select" aria-label="Default select example" name = "teacher_code" id="teacher_list">
                    <?php foreach ($Teacher_List as $teacher) { ?>
                        <option value=<?php echo $teacher['usercode'] ?>><?php echo $teacher['fullname'] ?></option>
                    <?php } ?>
                </select>

                <select class="form-select" aria-label="Default select example" name = "number">
                    <option value="1">Thêm dấu vân tay 1</option>
                    <option value="2">Thêm dấu vân tay 2</option>
                    <option value="3">Thêm dấu vân tay 3</option>
                    <option value="4">Thêm dấu vân tay 4</option>
                    <option value="5">Thêm dấu vân tay 5</option>
                </select>


                <button type="submit" class="btn btn-outline-primary">ADD</button>
            </div>
        </form>


        <form action="/fingerprint/update_fingerprint.gbe" class="searchbar">
            <button type="submit" class="btn btn-outline-primary">TEST</button>
        </form>
        <?php if ($error) { ?>
            <div class="text-center text-danger"><?= $error ?></div>
        <?php } else { 
            if(empty($resources)) { ?>
            <div class="text-center text-danger"><?= $message ?></div>
       <?php } else { ?>
       <div class="text-center text-danger"><?= $message ?></div>
       <?php }}; ?>

        
    </div>
</section>
<!-- <script>
    <!--$(document).ready(function(e) {
        e.preventDefault();
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
</script> -->