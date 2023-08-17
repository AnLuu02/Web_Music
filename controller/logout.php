<?php
require('./connect.php');
session_start();
unset($_SESSION["id"]);
unset($_SESSION["role"]);
session_destroy();
setcookie("u_id", "", time() - 3600);
header("Location: ../index.php");
