<div>
    <h2>Musics Uploaded</h2>

    <table class="table table-bordered ">
        <thead>
            <tr>
                <th class="text-center">STT</th>
                <th class="text-center">Image</th>
                <th class="text-center">Name</th>
                <th class="text-center">artist</th>
                <th class="text-center">Category</th>
                <th class="text-center">Nation</th>
                <th class="text-center">Owner</th>

                <th class="text-center">Date</th>
                <th class="text-center">Time</th>

                <th class="text-center" colspan="2">Action</th>
            </tr>
        </thead>
        <?php
        include_once "../../../controller/connect.php";

        $sql = "SELECT musics.* from musics INNER JOIN uploads ON musics.m_id = uploads.m_id ";
        $result = $conn->query($sql);
        $count = 1;
        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
        ?>
        <tr>
            <td><?= $count ?></td>
            <td><img height='100px' src='../../<?= $row["img"] ?>'></td>
            <td><?= $row["name"] ?></td>
            <td><?= $row["artist"] ?></td>
            <td><?= $row["category"] ?></td>
            <td><?= $row["nation"] ?></td>
            <td><?= $row["owner"] ?></td>

            <td><?php
                        list($year, $month, $day) = explode('-', $row['date']);
                        echo "$day-$month-$year";
                        ?></td>
            <td><?= $row["time"] ?></td>
            <td><button class="btn btn-danger" style="height:40px" onclick="itemDelete('<?= $row['m_id'] ?>')"
                    data-toggle="modal" data-target="#staticBackdrop">Delete</button></td>
            <!-- modal delete music -->
            <!-- Modal -->
            <div class="modal" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1"
                aria-labelledby="staticBackdropLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="staticBackdropLabel">Cảnh báo</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">&times;</button>
                        </div>
                        <div class="modal-body">
                            Bạn chắc chắn muốn xóa bài hát này chứ?
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Không</button>
                            <button type="button" class="btn btn-primary" id="allowDel" id_del=""
                                category="uploaded">Có</button>
                        </div>
                    </div>
                </div>
            </div>
        </tr>
        <?php
                $count = $count + 1;
            }
        }
        ?>
    </table>



    <!-- Modal -->
    <div class="modal fade" id="myModal" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">New Music Item</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    <form enctype='multipart/form-data' method="POST">
                        <div class="form-group">
                            <label for="name">Music Name:</label>
                            <input type="text" placeholder="Nhập tên bài hát" class="form-control" id="m_name">
                        </div>
                        <div class="form-group">
                            <label for="name">Artist Name:</label>
                            <input type="text" placeholder="Nhập tên người thể hiện" class="form-control" id="m_a_name">
                        </div>
                        <div class="form-group">
                            <label for="name">Thời gian:</label>
                            <input type="text" placeholder="Nhập thời lượng bài hát theo định dạng (00:00)"
                                class="form-control" id="m_time">
                        </div>


                        <div class="form-group">
                            <label for="fileUploadIcon">Icon: </label>
                            <input type="file" name="fileUploadIcon" id="m_fileUploadIcon" class="form-control-file">
                        </div>

                        <div class=" form-group">
                            <label for="fileUploadMusic">Liên kết: </label>
                            <input type="file" name="fileUploadMusic" id="m_fileUploadMusic" class="form-control-file">
                        </div>
                        <div class="form-group">
                            <label for="name">Quốc gia:</label>
                            <input type="text" class="form-control" id="m_nation">
                        </div>
                        <div class="form-group">
                            <label for="name">Phân loại:</label>
                            <input type="text" class="form-control" id="m_category">
                        </div>

                        <div class="form-group">
                            <button type="submit" class="btn btn-secondary" id="upload" style="height:40px"
                                onclick="addItems(event)">Add
                                Music</button>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal"
                        style="height:40px">Close</button>
                </div>
            </div>

        </div>
    </div>


</div>