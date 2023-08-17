<?php
if (!empty($_POST['key']) && $_POST['key'] === 'music') {

?>
<div>
    <h2>Musics Items</h2>
    <!-- Trigger the modal with a button -->
    <button type="button" class="btn btn-secondary " style="height:40px;margin:6px 0" data-toggle="modal"
        data-target="#myModal">
        Add musics
    </button>
    <table class="table table-bordered ">
        <thead>
            <tr>
                <th class="text-center">STT</th>
                <th class="text-center">Image</th>
                <th class="text-center">Name</th>
                <th class="text-center">artist</th>
                <th class="text-center">Category</th>
                <th class="text-center">Nation</th>

                <th class="text-center">Date</th>
                <th class="text-center">Time</th>

                <th class="text-center" colspan="2">Action</th>
            </tr>
        </thead>
        <?php
            include_once "../../../controller/connect.php";

            $value = $_POST['value'];
            // SQL Statement
            $sql = "SELECT * FROM musics WHERE name LIKE '%" . $value . "%'";
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

            <td><?php
                        list($year, $month, $day) = explode('-', $row['date']);
                        echo "$day-$month-$year";
                        ?></td>
            <td><?= $row["time"] ?></td>

            <td><button class="btn btn-primary" style="height:40px" onclick="oldDataMusic('<?= $row['m_id'] ?>')"
                    data-toggle="modal" data-target="#my_Modal_edit">Edit</button></td>
            <!-- Modal -->
            <div class="modal fade" id="my_Modal_edit" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">New Music Item</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        <div class="modal-body">
                            <form enctype='multipart/form-data' method="POST">
                                <input type="text" id="m_edit_id" style="display: none;">
                                <div class="form-group">
                                    <label for="name">Musics Name:</label>
                                    <input type="text" placeholder="Nhập tên bài hát" class="form-control"
                                        id="m_edit_name">
                                </div>
                                <div class="form-group">
                                    <label for="name">Artist Name:</label>
                                    <input type="text" placeholder="Nhập tên người thể hiện" class="form-control"
                                        id="m_edit_a_name">
                                </div>
                                <div class="form-group">
                                    <label for="name">Thời gian:</label>
                                    <input type="text" placeholder="Nhập thời lượng bài hát theo định dạng (00:00)"
                                        class="form-control" id="m_edit_time">
                                </div>


                                <div class="form-group">
                                    <label for="fileUploadIcon">Icon: </label>
                                    <input type="file" name="fileUploadIcon" id="m_edit_fileUploadIcon"
                                        class="form-control-file">
                                </div>

                                <div class=" form-group">
                                    <label for="fileUploadMusic">Liên kết: </label>
                                    <input type="file" name="fileUploadMusic" id="m_edit_fileUploadMusic"
                                        class="form-control-file">
                                </div>
                                <div class="form-group">
                                    <label for="name">Quốc gia:</label>
                                    <input type="text" class="form-control" id="m_edit_nation">
                                </div>
                                <div class="form-group">
                                    <label for="name">Phân loại:</label>
                                    <input type="text" class="form-control" id="m_edit_category">
                                </div>
                                <input type="text" class="form-control" id="old_edit_Icon" hidden>
                                <input type="text" class="form-control" id="old_edit_Video" hidden>

                                <div class="form-group">
                                    <button type="submit" class="btn btn-secondary" id="upload" style="height:40px"
                                        onclick="updateItems()">Update</button>
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
                            <button type="button" class="btn btn-primary" id="allowDel" id_del="">Có</button>
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
                            <label for="name">Musics Name:</label>
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
<?php } else if (!empty($_POST['key']) && $_POST['key'] === 'user') { ?>
<div>
    <h3>All Users</h3>
    <table class="table table-bordered ">
        <thead>
            <tr>
                <th class="text-center">STT</th>
                <th class="text-center">Name </th>
                <th class="text-center">Email</th>
                <th class="text-center">Birthday</th>
                <th class="text-center">Gender</th>
                <th class="text-center">Image</th>
                <th class="text-center">Action</th>

            </tr>
        </thead>
        <tbody>
            <?php
                include_once "../../../controller/connect.php";


                $value = $_POST['value'];
                // SQL Statement
                $sql = "SELECT * from users where role='user' AND name LIKE '%" . $value . "%'";
                $result = $conn->query($sql);
                $count = 1;
                if ($result->num_rows > 0) {
                    while ($row = $result->fetch_assoc()) {

                ?>
            <tr>
                <td><?= $row['u_id'] ?></td>
                <td><?= $row["name"] ?></td>
                <td><?= $row["email"] ?></td>
                <td><?= $row["birthday"] ?></td>
                <td><?= $row["gender"] ?></td>

                <td><img src="../../../uploads/<?= $row["img"] ?>" alt=""></td>
                <td>

                    <button type="button" class="btn btn-primary" data-toggle="modal"
                        data-target="#myModal">Details</button>
                    <button type="button" class="btn btn-danger" type="button" data-toggle="modal"
                        data-target="#staticBackdrop" onclick="deleteUser(<?= $row['u_id'] ?>)">Delete</button>
                </td>
                <!-- modal delete music -->
                <!-- Modal -->
                <div class="modal" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1"
                    aria-labelledby="staticBackdropLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="staticBackdropLabel">Cảnh báo</h5>
                                <button type="button" class="close" data-dismiss="modal"
                                    aria-label="Close">&times;</button>
                            </div>
                            <div class="modal-body">
                                Bạn chắc chắn muốn xóa người dùng này chứ?
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Không</button>
                                <button type="button" class="btn btn-primary" id="allowDel" id_del="">Có</button>
                            </div>
                        </div>
                    </div>
                </div>
            </tr>
            <!-- Modal -->
            <div class="modal fade" id="myModal" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">All Details</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        <div class="modal-body">
                            <h3>Danh sách playlist</h3>
                            <ul>
                                <?php
                                            $result1 = $conn->query("SELECT * FROM playlist WHERE u_id ='" . $row["u_id"] . "'");
                                            if ($result1->num_rows > 0) {
                                                while ($row1 = $result1->fetch_assoc()) {
                                                    echo "<li>'" . $row['name'] . "'</li>";
                                                }
                                            } else {
                                                echo "<li>Trong</li>";
                                            }
                                            ?>
                            </ul>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal"
                                style="height:40px">Close</button>
                        </div>
                    </div>

                </div>
            </div>
            <?php $count = $count + 1;
                    }
                }
                ?>

        </tbody>
    </table>
    <div>
        <?php } else { ?>
        <div>
            <h2>Musics Items</h2>
            <!-- Trigger the modal with a button -->
            <button type="button" class="btn btn-secondary " style="height:40px;margin:6px 0" data-toggle="modal"
                data-target="#myModal">
                Add musics
            </button>
            <table class="table table-bordered ">
                <thead>
                    <tr>
                        <th class="text-center">STT</th>
                        <th class="text-center">Image</th>
                        <th class="text-center">Name</th>
                        <th class="text-center">artist</th>
                        <th class="text-center">Category</th>
                        <th class="text-center">Nation</th>

                        <th class="text-center">Date</th>
                        <th class="text-center">Time</th>

                        <th class="text-center" colspan="2">Action</th>
                    </tr>
                </thead>
                <?php
                    include_once "../../../controller/connect.php";

                    $value = $_POST['value'];
                    // SQL Statement
                    $sql = "SELECT * FROM musics WHERE name LIKE '%" . $value . "%'";
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

                    <td><?php
                        list($year, $month, $day) = explode('-', $row['date']);
                        echo "$day-$month-$year";
                        ?></td>
                    <td><?= $row["time"] ?></td>

                    <td><button class="btn btn-primary" style="height:40px"
                            onclick="oldDataMusic('<?= $row['m_id'] ?>')" data-toggle="modal"
                            data-target="#my_Modal_edit">Edit</button></td>
                    <!-- Modal -->
                    <div class="modal fade" id="my_Modal_edit" role="dialog">
                        <div class="modal-dialog">

                            <!-- Modal content-->
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4 class="modal-title">New Music Item</h4>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                <div class="modal-body">
                                    <form enctype='multipart/form-data' method="POST">
                                        <input type="text" id="m_edit_id" style="display: none;">
                                        <div class="form-group">
                                            <label for="name">Musics Name:</label>
                                            <input type="text" placeholder="Nhập tên bài hát" class="form-control"
                                                id="m_edit_name">
                                        </div>
                                        <div class="form-group">
                                            <label for="name">Artist Name:</label>
                                            <input type="text" placeholder="Nhập tên người thể hiện"
                                                class="form-control" id="m_edit_a_name">
                                        </div>
                                        <div class="form-group">
                                            <label for="name">Thời gian:</label>
                                            <input type="text"
                                                placeholder="Nhập thời lượng bài hát theo định dạng (00:00)"
                                                class="form-control" id="m_edit_time">
                                        </div>


                                        <div class="form-group">
                                            <label for="fileUploadIcon">Icon: </label>
                                            <input type="file" name="fileUploadIcon" id="m_edit_fileUploadIcon"
                                                class="form-control-file">
                                        </div>

                                        <div class=" form-group">
                                            <label for="fileUploadMusic">Liên kết: </label>
                                            <input type="file" name="fileUploadMusic" id="m_edit_fileUploadMusic"
                                                class="form-control-file">
                                        </div>
                                        <div class="form-group">
                                            <label for="name">Quốc gia:</label>
                                            <input type="text" class="form-control" id="m_edit_nation">
                                        </div>
                                        <div class="form-group">
                                            <label for="name">Phân loại:</label>
                                            <input type="text" class="form-control" id="m_edit_category">
                                        </div>
                                        <input type="text" class="form-control" id="old_edit_Icon" hidden>
                                        <input type="text" class="form-control" id="old_edit_Video" hidden>

                                        <div class="form-group">
                                            <button type="submit" class="btn btn-secondary" id="upload"
                                                style="height:40px" onclick="updateItems()">Update</button>
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
                                    <button type="button" class="close" data-dismiss="modal"
                                        aria-label="Close">&times;</button>
                                </div>
                                <div class="modal-body">
                                    Bạn chắc chắn muốn xóa bài hát này chứ?
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Không</button>
                                    <button type="button" class="btn btn-primary" id="allowDel" id_del="">Có</button>
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
                            <h4 class="modal-title">New Product Item</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        <div class="modal-body">
                            <form enctype='multipart/form-data' method="POST">
                                <div class="form-group">
                                    <label for="name">Musics Name:</label>
                                    <input type="text" placeholder="Nhập tên bài hát" class="form-control" id="m_name">
                                </div>
                                <div class="form-group">
                                    <label for="name">Artist Name:</label>
                                    <input type="text" placeholder="Nhập tên người thể hiện" class="form-control"
                                        id="m_a_name">
                                </div>
                                <div class="form-group">
                                    <label for="name">Thời gian:</label>
                                    <input type="text" placeholder="Nhập thời lượng bài hát theo định dạng (00:00)"
                                        class="form-control" id="m_time">
                                </div>


                                <div class="form-group">
                                    <label for="fileUploadIcon">Icon: </label>
                                    <input type="file" name="fileUploadIcon" id="m_fileUploadIcon"
                                        class="form-control-file">
                                </div>

                                <div class=" form-group">
                                    <label for="fileUploadMusic">Liên kết: </label>
                                    <input type="file" name="fileUploadMusic" id="m_fileUploadMusic"
                                        class="form-control-file">
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

        <div>
            <h3>All Users</h3>
            <table class="table table-bordered ">
                <thead>
                    <tr>
                        <th class="text-center">STT</th>
                        <th class="text-center">Name </th>
                        <th class="text-center">Email</th>
                        <th class="text-center">Birthday</th>
                        <th class="text-center">Gender</th>
                        <th class="text-center">Image</th>
                        <th class="text-center">Action</th>

                    </tr>
                </thead>
                <tbody>
                    <?php
                        include_once "../../../controller/connect.php";


                        $value = $_POST['value'];
                        // SQL Statement
                        $sql = "SELECT * from users where role='user' AND name LIKE '%" . $value . "%'";
                        $result = $conn->query($sql);
                        $count = 1;
                        if ($result->num_rows > 0) {
                            while ($row = $result->fetch_assoc()) {

                        ?>
                    <tr>
                        <td><?= $row['u_id'] ?></td>
                        <td><?= $row["name"] ?></td>
                        <td><?= $row["email"] ?></td>
                        <td><?= $row["birthday"] ?></td>
                        <td><?= $row["gender"] ?></td>

                        <td><img src="../../../uploads/<?= $row["img"] ?>" alt=""></td>
                        <td>

                            <button type="button" class="btn btn-primary" data-toggle="modal"
                                data-target="#myModal">Details</button>
                            <button type="button" class="btn btn-danger" type="button" data-toggle="modal"
                                data-target="#staticBackdrop" onclick="deleteUser(<?= $row['u_id'] ?>)">Delete</button>
                        </td>
                        <!-- modal delete music -->
                        <!-- Modal -->
                        <div class="modal" id="staticBackdrop" data-backdrop="static" data-keyboard="false"
                            tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="staticBackdropLabel">Cảnh báo</h5>
                                        <button type="button" class="close" data-dismiss="modal"
                                            aria-label="Close">&times;</button>
                                    </div>
                                    <div class="modal-body">
                                        Bạn chắc chắn muốn xóa người dùng này chứ?
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary"
                                            data-dismiss="modal">Không</button>
                                        <button type="button" class="btn btn-primary" id="allowDel"
                                            id_del="">Có</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </tr>
                    <!-- Modal -->
                    <div class="modal fade" id="myModal" role="dialog">
                        <div class="modal-dialog">
                            <!-- Modal content-->
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4 class="modal-title">All Details</h4>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                <div class="modal-body">
                                    <h3>Danh sách playlist</h3>
                                    <ul>
                                        <?php
                                                    $result1 = $conn->query("SELECT * FROM playlist WHERE u_id ='" . $row["u_id"] . "'");
                                                    if ($result1->num_rows > 0) {
                                                        while ($row1 = $result1->fetch_assoc()) {
                                                            echo "<li>'" . $row['name'] . "'</li>";
                                                        }
                                                    } else {
                                                        echo "<li>Trong</li>";
                                                    }
                                                    ?>
                                    </ul>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal"
                                        style="height:40px">Close</button>
                                </div>
                            </div>

                        </div>
                    </div>
                    <?php $count = $count + 1;
                            }
                        }
                        ?>

                </tbody>
            </table>
            <div>
                <?php } ?>