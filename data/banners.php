<?php
header("Content-Type:application/json");
require_once("init.php");
$sql="select * from ly_index_carousel";
echo json_encode(sql_execute($sql));