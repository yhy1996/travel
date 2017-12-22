//楼层滚动
function getTotalTop(elem){
  var sum=0;
  do{
    sum+=elem.offsetTop;
    elem=elem.offsetParent;
  }while(elem);
  return sum;
}
(()=>{
    //获得id为f1的元素距页面顶部的总距离totalTop
    var firstTop=getTotalTop(document.getElementById("f1"));
    //查找id为lift的div保存在变量lift中
    var lift=document.getElementById("lift");
    //为window添加滚动事件监听
    window.addEventListener("scroll",()=>{
      var scrollTop=document.body.scrollTop
          ||document.documentElement.scrollTop;
      lift.style.display=firstTop<=scrollTop+innerHeight/2?
          "block":"none";
			var floors=document.querySelectorAll(".floor");
			var footer=document.querySelector("#footer");
			if(lift.style.display=="block"){
				for(var i=0;i<floors.length-1;i++){
					var totalTop=getTotalTop(floors[i]);
					var start=totalTop-innerHeight/2;
					if(i==floors.length-1){
						var end=getTotalTop(document.getElementById("footer"))
					}else{
						var end=getTotalTop(floors[i+1])-innerHeight/2;	
					}
					if(scrollTop>=start && scrollTop<end){
						break;
					}
				}
				var item=lift.querySelector(".item_on");
				if(item){
					item.className="lift_item";
				}
				lift.querySelector(`li:nth-child(${i+1})`).className=`lift_item item_on`;
			}
    });
		var as=document.querySelectorAll("#floorName li");
		for(let j=0;j<as.length;j++){
			as[j].addEventListener("click",function(){
				var floorI=document.getElementById("f"+(j+1));
				var totalTop=getTotalTop(floorI);
				$("html,body").stop(true).animate({scrollTop:totalTop},500);
			})
		}
})(); 

//达人玩法
$(".size3").on("mouseenter","div:nth-child(n)",function(e){
  e.preventDefault();
  var detail=$(this).children("a.detail");
  var info=$(this).children(".info");
  detail.slideDown(200);
  info.fadeOut(100);
});
$(".size3").on("mouseleave","div:nth-child(n)",function(e){
  e.preventDefault();
  var detail=$(this).children("a.detail");
  var info=$(this).children(".info");
  detail.slideUp(300);
  info.fadeIn(150);
});






