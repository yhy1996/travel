<?php
	header("Content-Type:application/json");
	require("init.php");
	$output=[];
	@$lid=$_REQUEST["lid"];
	if($lid){
		$sql="select * from ly_view where lid=$lid";
		$output["jingdian"]=sql_execute($sql);
		$sql="select * from ly_scenery_pic where scenery_id=$lid";
		$output["jingdian"]["pics"]=sql_execute($sql);
		$sql="select * from ly_admission_ticket where scene_id=$lid";
		$output["jingdian"]["detail"]=sql_execute($sql);
		echo json_encode($output);
	}else{
		echo "[]";
	}
?>