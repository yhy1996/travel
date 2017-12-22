function loadPage(pno,pageSize){
	$.ajax({
		type:"GET",
		url:"data/yj.php",
		data:{pno:pno,pageSize:pageSize},
		success:function(pager){
			console.log(pager);		
			var rows=pager.data;
			console.log(rows);
			var html="";
			for(var i=0;i<rows.length;i++){
				var obj=rows[i];
				html+=`
					<li>
							<a href="#" class="list-img">
								<img src="${obj.img}">
							</a>
							<div class="list-show">
								<a href="#">
									<div class="list-name">${obj.title}
									</div>
									<div class="list-des">${obj.subtitle}</div>
								</a>
								<div class="list-auther">
									<div class="auther-left">
										<a href="#">
											<img src="${obj.subimg}">
											<div class="auther-name">${obj.auther_name}</div>
										</a>
										<div class="list-scan">
											<i></i>
											${obj.list_scan}  
										</div>
										<div class="list-comment">
											<i></i>
											${obj.list_comment}  
										</div>
									</div>
									<div class="auther-right">
										<i></i>
										<span>${obj.auther_right}</span>
									</div>
								</div>
							</div>
					</li>
				`;
			}
			$(".list").html(html);
			var html="";
			html+=` <li class="${pager.pno<=1?'disabled':''}">
              <a href="${pager.pno>=2?pager.pno-1:1}">上一页</a>
      </li>`;
			if(pager.pno-2>0){
				html+=`
					<li><a href="#">${pager.pno-2}</a></li>	
				`;
			}
			if(pager.pno-1>0){
				html+=`
					<li><a href="#">${pager.pno-1}</a></li>	
				`;
			}
			html+=`
				<li class="active"><a href="#">${pager.pno}</a></li>	
			`;
			if(pager.pno+1<=pager.pageCount){
				html+=`
					<li><a href="#">${pager.pno+1}</a></li>	
				`;
			}
			if(pager.pno+2<=pager.pageCount){
				html+=`
					<li><a href="#">${pager.pno+2}</a></li>	
				`;
			}
			html+=`<li class="${pager.pno>=pager.pageCount?'disabled':''}">
             <a href="${pager.pno<pager.pageCount?pager.pno+1:'pager.pageCount'}">下一页</a>
      </li>`;
			$("#pages").html(html);
		},
		error:function(){
			alert("网络故障请检查");
		}
	});
}
loadPage(1,8);
$("#pages").on("click","li a",function(e){
	e.preventDefault();
	var text=$(this).html();
	if(text=="上一页"||text=="下一页"){
		var pnop=$(this).attr("href");
		loadPage(pnop,8);
	}else{
		var pno=$(this).html();
		loadPage(pno,8);
	}
})








