<?php
		header("Content-Type:application/json");
    //1:加载init.php
    require("init.php");
    //2:获取参数pno，并且判断
    @$pno=$_REQUEST["pno"];
    if(!$pno){
        $pno=1;
    }else{
        $pno=intval($pno);
    }
    //3:获取参数pageSize，并且判断
    @$pageSize=$_REQUEST["pageSize"];
    if(!$pageSize){
        $pageSize=8;
    }else{
        $pageSize=intval($pageSize);
    }
    //4:创建SQL语句查询总记录数，发送执行
    $sql="SELECT count(*) FROM ly_yj_left";
    $result=mysqli_query($conn,$sql);
    $row=mysqli_fetch_row($result);
    $recordCount=$row[0];
		//var_dump($recordCount);
    //总页数
    $pageCount=ceil($recordCount/$pageSize);
    //开始记录数
    $start=($pno-1)*$pageSize;
    //5:创建SQL语句查询当前页内容，发送执行
    $sql="SELECT lid,img,title,subtitle,subimg,auther_name,list_scan,list_comment,auther_right FROM ly_yj_left ORDER BY lid LIMIT $start,$pageSize";
    $result=mysqli_query($conn,$sql);
    $rows=mysqli_fetch_all($result,MYSQLI_ASSOC);
    //6:创建output数据保存所有数值
    $output=[
        "pno"=>$pno,

        "pageSize"=>$pageSize,
        "pageCount"=>$pageCount,
        "data"=>$rows,
        "recordCount"=>$recordCount
    ];
    //7:发送json
    echo json_encode($output);

//header("Content-Type:application/json");
//require("init.php");
//@$pno=$_REQUEST["pno"];
//$output=[
//	"count"=>0,
//	"pageSize"=>8,
//	"pageCount"=>0,
//	"pageNo"=>0,
//	"data"=>[]
//];
//if(!$pno){
//	$pno=1;
//}
//else{
//	$pno=intval($pno);
//}
//@$pageSize=$_REQUEST["pageSize"];
//if(!$pageSize){
//    $pageSize=8;
//}else{
//    $pageSize=intval($pageSize);
//}
//$sql="SELECT * FROM ly_yj_left";
//$output["count"]=count(sql_execute($sql));
//$sql=$sql." limit ".(($pno-1)*$output["pageSize"]).",".$output["pageSize"];
//$result=sql_execute($sql);
//$output["pageCount"]=ceil($output["count"]/$output["pageSize"]);
//$output["pageNo"]=$pno;
//$output["data"]=$result;
//echo json_encode($output);
?>