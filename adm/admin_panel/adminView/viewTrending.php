<div id="trend">
    <h3>Top Trending</h3>
    <!-- Trigger the modal with a button -->

    <table class="table table-bordered ">
        <thead>
            <tr>
                <th class="text-center">Top</th>
                <th class="text-center">Image</th>
                <th class="text-center">Name</th>
                <th class="text-center">Artist</th>
                <th class="text-center">Date</th>
                <th class="text-center">View</th>

            </tr>
        </thead>
        <?php
        include_once "../../../controller/connect.php";

        $sql = "SELECT * from musics ORDER BY quatityLis DESC ";
        $result = $conn->query($sql);
        $count = 1;
        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
        ?>
                <tr>
                    <td><?php if ($count >= 1 && $count <= 3) {
                            echo "Top " . $count;
                        } else {
                            echo $count;
                        } ?></td>
                    <td><img height='100px' src='../../<?= $row["img"] ?>'></td>
                    <td><?= $row["name"] ?></td>
                    <td><?= $row["artist"] ?></td>
                    <td><?php
                        list($year, $month, $day) = explode('-', $row['date']);
                        echo "$day-$month-$year";
                        ?></td>
                    <td><?= $row["quatityLis"] ?></td>


                </tr>
        <?php
                $count = $count + 1;
            }
        }
        ?>
    </table>
</div>