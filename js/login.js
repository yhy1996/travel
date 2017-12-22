//功能模块一：用户登录
//1.1 当前用户点击登录按钮，获取参数
//1.2 验证用户输入值
//1.3 发送ajax请求，完成登录业务
$("[name='usubmit']").click(function(e){
    //1.1:阻止事件默认行为 a
    e.preventDefault();
    //2:获取用户名和密码
    var h=$("[name='phone']").val();
    var p=$("[name='upwd']").val();
    //3:发送ajax请求
    $.ajax({
        type:"post",
        url:"data/login.php",
        data:{phone:h,upwd:p},
        success:function(data){
            if(data.code>0){
                alert(data.msg);
                location.href="index.html";
            }else{
                alert(data.msg);
            }
        },
        error:function(){
            alert("网络出现故障，请检查");
        }
    });
    //4:获取服务器返回数据
    //5:判断登录是否成功->跳转main.html
});
