<?php
header("Content-Type:application/json");
require("init.php");
@$uname=$_REQUEST["uname"];

//@$upwd=$_REQUEST["upwd"];
//@$email=$_REQUEST["email"];
if($uname==""||$uname==null){
    die('{"code":-1,"msg":"用户名不能为空"}');
}
@$phone=$_REQUEST["phone"];
if($phone==""||$phone==null){
    die('{"code":-1,"msg":"手机号不能为空"}');
}else if(!preg_match("/^\d{11}$/",$phone)){
    die('{"code":-1,"msg":"手机号格式不对"}');
}
@$upwd=$_REQUEST["upwd"];
if($upwd==""||$upwd==null){
    die('{"code":-1,"msg":"密码不能为空"}');
}else if(!preg_match("/^\d{6,12}$/",$upwd)){
    die('{"code":-1,"msg":"密码格式不对"}');
}
@$email=$_REQUEST["email"];
if($email==""||$email==null){
    die('{"code":-1,"msg":"邮箱不能为空"}');
}else if(!preg_match("/^[\da-zA-Z]{3,11}([@][q][q][.][c][o][m])$/",$email)){
    die('{"code":-1,"msg":"邮箱格式不对"}');
}
$sql="INSERT INTO ly_user(uname,phone,upwd,email)";
$sql.=" VALUES('$uname','$phone','$upwd','$email')";
$result=mysqli_query($conn,$sql);
if($result>0){
    echo '{"code":1,"msg":"注册成功"}';
}else{
    echo '{"code":-1,"msg":"注册失败"}';
}
?>