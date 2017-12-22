(()=>{
	var lid=location.search.split("=")[1];
	if(lid!=undefined){
		ajax("get","data/detail.php?lid="+lid,"")
			.then(data=>{
				//console.log(data);
				var jingdian=data.jingdian;
				console.log(jingdian);
				//加载左上角的图片
				var mImg=document.getElementById("mImg"),
					largeDiv=document.getElementById("largeDiv");
				 icon_list=document.getElementById("icon_list");
					//console.log(mImg,icon_list);
					//设置mImg的src为当前景点的第一张图片的中图片
					mImg.src=jingdian.pics[0].md;
					largeDiv.style.backgroundImage=`url(${jingdian.pics[0].lg})`;
					//定义空字符串html
					var html="";
					//遍历当前景点的每张图片
					for(var pic of jingdian.pics){
						//向HTML中拼接
						html+=`
							<li class="gallery-thumb">
								<img src="${pic.sm}" data-md="${pic.md}" data-lg="${pic.lg}">
							</li>	
						`
					}
					//设置icon_list的内容为html
					icon_list.innerHTML=html;
					var title=document.querySelector(".title"),
					price=document.querySelector(".price>.money"),
					address=document.querySelector(".detail-address>span"),
					time=document.querySelector(".open-time>p>.con"),
					btm=document.querySelector(".btm");
					mb=document.querySelector(".mb");
					title.innerHTML=jingdian[0].title;
					price.innerHTML=jingdian[0].price;
					address.innerHTML=jingdian[0].address;
					time.innerHTML=jingdian[0].open_date;
					var html="";
					html+=`
						<p class="accountChose">
									<span>出游人数：</span>
									<button class="numberMinus">-</button>
									<input type="text" value="1" class="number" id="buy-num">
									<button class="numberAdd">+</button>
								</p>
							<div class="cmt">
								<button class="btns">立即预定</button>
							</div>	
					`
					btm.innerHTML=html;	

					var html="";
					for(var detail of jingdian.detail){
						console.log(detail);
						//向HTML中拼接
						html+=`
							<div class="lct_1">
								<p class="l_name name_color">
									<a href="#">
										<label>
											<span class="admission">${detail.title}</span>
											${detail.subtitle}
										</label>
										<span class="direc_icon">▼</span>
									</a>
								</p>
								<p class="l_time product_com">${detail.timer}</p>
								<p class="l_g_price g_price_color">
									<strike>¥${detail.bazaar}</strike>
								</p>
								<p class="l_price price_color">¥${detail.tuniu}
									<span style="font-size:12px;">起</span>
								</p>
								<p class="product_com product_prom">
									<span class="coupon">优惠券</span>
								</p>
								<p class="paytype">
									<span class="methods">网上支付</span>
									<button class="btn">预定</button>
								</p>
							</div>
					`;
					}
					mb.innerHTML=html;
				//加减
					//减
					var n = $("#buy-num").val() * 1;
					$(".accountChose").on("click",".numberMinus",function(){
						if (n >= 1) {
							$(this).next().val(n -= 1);
						}
					})
					//加
					$(".accountChose").on("click",".numberAdd",function(){
						$(this).prev().val(n += 1);
					})


					//添加购物车
					$("body").on('click', ".btns", function (e) {
						e.preventDefault();
						//获取购买数量
						var buyCount = $("#buy-num").val();
						$.ajax({
							type: 'POST',
							url: 'data/cart/cart.php',
							data: {lid:location.search.split('=')[1],buyCount:buyCount},
							success: function(result){
								if(result.code===200){
									
									alert('添加成功！');
									location.href = 'cart.html';
								}else if(result.code===300){
									alert('您尚未登录！');
									location.href = 'login.html';
								}else {
									alert('<b添加失败！</b><p>错误原因为：'+result.msg+'</p>');
								}
							}
						})

					})

					var aBackward=document.querySelector(
						"#gallery-nav>.gallery-prev");
					//查找id为preview下的h1下的class为backward的a保存到aBackward
					var aForward=document.querySelector(
						"#gallery-nav>.gallery-next");
					//定义变量
					var moved=0,LIWIDTH=110;
					//为aForward绑定单击事件
					aForward.onclick=function(){
						if(this.className.indexOf("disabled")==-1){
							moved++;move();
							if(moved>0){
								aBackward.className="gallery-prev";
							}
						}
					};
					aBackward.onclick=function(){
						if(this.className.indexOf("disabled")==-1){
							moved--;move();
							if(moved==0){
								aBackward.className="gallery-prev disabled";
							}
						}
					};
					function move(){
						icon_list.style.left=-moved*LIWIDTH+4+"px";
						checkA();
					} 
					function checkA(){
						if(jingdian.pics.length-moved==4){
							aForward.className="gallery-next disabled";
						}else if(jingdian.pics.length>4){
							aForward.className="gallery-next";
						}else{
							//设置aForward的class为forward
							aForward.className="gallery-next";
							//设置aBackward的class为backward
							aBackward.className="gallery-prev";
						}
					}
					 //如果当前商品的图片张数<=5
					if(jingdian.pics.length<=4)
						//设置aForward的class为"forward disabled"
						aForward.className="gallery-next disabled";
					/*****鼠标进入小图片切换中图片和大图片*****/
					//为父元素icon_list绑定鼠标进入事件
					icon_list.onmouseover=function(e){
						var tar=e.target;//获得目标元素tar
						//如果目标元素是img时
						if(tar.nodeName=="IMG"){
							//设置mImg的src为tar的dataset中的md属性
							mImg.src=tar.dataset.md;
							//设置largeDiv的backgroundImage为url(tar的dataset中的lg)
							largeDiv.style.backgroundImage=
								`url(${tar.dataset.lg})`;
						}
					}
					/****鼠标进入中图片启动放大镜****/
					var superMask=document.getElementById("superMask");
					var mask=document.getElementById("mask");
					//为superMask绑定鼠标进入事件
					superMask.onmouseover=function(){
						mask.style.display="block";//让mask显示
						largeDiv.style.display="block";//让largeDiv显示
					}
					//为superMask绑定鼠标移出事件
					superMask.onmouseout=function(){
						mask.style.display="none";
						largeDiv.style.display="none";
					}
					//定义变量MSIZE=175保存mask的宽高
					var MSIZE=250;
					var SMSIZE=500;//保存superMask的大小
					var MSIZES=140;
					var SMSIZES=280;//保存superMask的大小
					//为superMask绑定鼠标移动事件
					superMask.onmousemove=function(e){
						//获得相对于当前元素的x,y
						var x=e.offsetX,y=e.offsetY;
						//计算top和left
						var top=y-MSIZE/2;
						var left=x-MSIZES/2;
						//如果top<0 就改回0
						if(top<0) top=0;
						else if(top>SMSIZES-MSIZES)
							top=SMSIZES-MSIZES;
						//如果left<0 就改回0
						if(left<0) left=0;
						else if(left>SMSIZE-MSIZE)
							left=SMSIZE-MSIZE;
					//设置mask的top为top，left为left
					mask.style.top=top+"px";
					mask.style.left=left+"px";
					largeDiv.style.backgroundPosition=
						`${-left*2}px ${-top*2}px`;
					}
		})
	}
})()

