function pageLoad(){
	$.ajax({
		type:"GET",
		url:"data/dingpiao.php",
		success:function(pager){
			console.log(pager);
			var html="";
			var rows=pager.data;
			for(var i=0;i<rows.length;i++){
				var obj=rows[i];
				html+=`<div class="jingdian-item">
							<div class="jingdian-img">
								<a href="detail.html?lid=${obj.lid}">
									<img src="${obj.pic}" alt="">
								</a>
								<div class="jingdian-mask"></div>
								<div class="jingdian-data">
									<div class="satisfy-rate">${obj.sat}</div>	
									<div class="toueist-rate">
										${obj.appraise}
									</div>
								</div>
							</div>
							<div class="jingdian-meta">
								<div class="meta-name">
									<a href="detail.html?lid=${obj.lid}">${obj.lname}</a>
								</div>
								<div class="meta-price">
									￥<strong>${obj.price}</strong><span class="smaller">起</span>
								</div>
							</div>	
						</div>
								`;
							$(".block").html(html);
			}
		},
		error:function(){
      alert("网络故障，请检查");
    }
	})
}
pageLoad();