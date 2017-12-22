<?php
session_start();
///1:设置响应头 json
header("Content-Type:application/json;charset='utf-8'");
header('Access-Control-Allow-Origin:*');
//2:连接数据库
require_once("init.php");
//4:获取用户名参数
@$h=$_REQUEST["phone"];
@$p=$_REQUEST["upwd"];

//5.1通过正则表达式在PHP对用户参数再验证
$hPattern='/[a-zA-Z0-9]{3,12}/';
$pPattern='/[a-zA-Z0-9]{3,9}/';
if(!preg_match($hPattern,$h)){
    echo '{"code":-2,"msg":"用户名或密码有误"}';
    exit;//停止PHP运行
}
if(!preg_match($pPattern,$p)){
    echo '{"code":-2,"msg":"密码格式不正确"}';
    exit;//停止PHP运行
}

//6:创建SQL并且发送SQL语句
$sql="SELECT * FROM ly_user WHERE phone='$h' AND upwd='$p'";

//7:获取数据库返回结果
$result=mysqli_query($conn,$sql);
//8:判断并且输出结果信息
$row=mysqli_fetch_assoc($result);
if($row==null){
    echo '{"code":-1,"msg":"用户名或密码错误"}';
}else{
    $_SESSION["uid"]=$row["uid"];
    echo '{"code":1,"msg":"登录成功"}';
}
?>