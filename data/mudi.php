<?php
	header("Content-Type:application/json");
	require("init.php");
	$output=[];
	$sql="SELECT * FROM ly_md_content WHERE seq_recommended>0 order by seq_recommended limit 8";
	$output["rm"]=sql_execute($sql);
	echo json_encode($output);
?>