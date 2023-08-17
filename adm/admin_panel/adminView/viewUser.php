<div>
    <h3>All Users</h3>
    <table class="table table-bordered">
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

            $sql = "SELECT * from users where role='user'";
            $result = $conn->query($sql);
            $count = 1;
            if ($result->num_rows > 0) {
                while ($row = $result->fetch_assoc()) {
            ?>
                    <tr>
                        <td><?= $count ?></td>
                        <td style="color: red;"><?= $row["name"] ?></td>
                        <td><?= $row["email"] ?></td>
                        <td>
                            <?php
                            list($year, $month, $date) = explode('-', $row['birthday']);
                            echo "$date-$month-$year";
                            ?></td>
                        <td><?= $row["gender"] ?></td>

                        <td><img src="../../../uploads/<?= $row["img"] ?>" alt=""></td>
                        <td>

                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal" onclick="getAllDetails(<?= $row['u_id'] ?>)">Details</button>

                            <button type="button" class="btn btn-danger" type="button" data-toggle="modal" data-target="#staticBackdrop" onclick="deleteUser(<?= $row['u_id'] ?>)">Delete</button>
                        </td>
                        <!-- modal delete music -->
                        <!-- Modal -->
                        <div class="modal" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="staticBackdropLabel">Cảnh báo</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">&times;</button>
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
                                    <div>
                                        <div id="lb" style="display:flex;align-items: center;justify-content: space-between;margin-bottom: 10px;">
                                            <h4></h4>
                                            <button type="button" class="btn btn-primary">+</button>
                                        </div>
                                        <div id="pl" style="display:flex;align-items: center;justify-content: space-between;margin-bottom: 10px;">
                                            <h4></h4>
                                            <button type="button" class="btn btn-primary">+</button>
                                        </div>
                                        <div id="ul" style="display:flex;align-items: center;justify-content: space-between;margin-bottom: 10px;">
                                            <h4></h4>
                                            <button type="button" class="btn btn-primary">+</button>
                                        </div>
                                    </div>

                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal" style="height:40px">Close</button>
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