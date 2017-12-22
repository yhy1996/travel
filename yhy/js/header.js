(()=>{
    $("#header").load("header.html",()=>{
        var $login=$("#listLogin"),
            $welcome=$("#listWelcome");
        $.get("data/isLogin.php").then(data=>{
            if(data.ok){
                $("#uname").text(data.uname);
                $welcome.show();
                $login.hide();
            }else{
                $welcome.hide();
                $login.show();
            }
        });
        $welcome.find("a").last().click((e)=>{
						e.preventDefault();
            $.get("data/logout.php")
                .then(()=>location.reload());
        });
    })
})();

//导航栏点击事件
$(".nav_center").on("click","li",function(e){
	e.preventDefault();
	$(this).addClass("active").siblings().removeClass("active");
	var li=$(this).children().attr("href");
	location.href=li;
});


