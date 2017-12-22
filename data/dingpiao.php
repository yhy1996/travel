<?php
header("Content-Type:application/json");
require("init.php");
$sql="SELECT lid,lname,price,sat,appraise FROM ly_scenery";
$result=mysqli_query($conn,$sql);
$list=mysqli_fetch_all($result,MYSQLI_ASSOC);
//查询每个商品的第一幅小图片
foreach($list as $i=>$p){
$sql="SELECT sm FROM ly_scenery_pic WHERE scenery_id=$p[lid] LIMIT 1";
$result=mysqli_query($conn,$sql);
$row=mysqli_fetch_row($result);
$list[$i]['pic']=$row[0];
}
$output=[
	'code'=>200,
	'data'=>$list
];
echo json_encode($output);
?>