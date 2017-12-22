(()=>{
	ajax("get","data/detail.php?lid="+lid,"").then(
		data=>{
			console.log(data);
//			var jingdian=data.jisngdian,
//				family=data.family;
//			var 
		}	
	)
})()

//(()=>{
//	var lid=location.search.split("=")[1];
//	if(lid!=undefined)
//	ajax("get",
//		"data/05-product-details/details.php?lid="+lid,
//		""
//	).then(data=>{
//		var laptop=data.laptop,
//			family=data.family;
//
//		var mImg=document.getElementById("mImg"),
//				largeDiv=document.getElementById("largeDiv"),
//				icon_list=document.getElementById("icon_list");
//		console.log(mImg,largeDiv,icon_list);
//
//		mImg.src=laptop.pics[0].md;
//		largeDiv.style.backgroundImage=
//			`url(${laptop.pics[0].lg})`;
//		var html="";
//		for(var pic of laptop.pics){
//			html+=`<li class="i1">
//							<img src="${pic.sm}" 
//							data-md="${pic.md}" 
//							data-lg="${pic.lg}">
//						</li>`	
//		}
//		icon_list.innerHTML=html;
//
//		var title=document.querySelector(
//			"#show-details>h3>a"	
//		),
//				price=document.querySelector(
//			"#show-details>.price>.stu-price>span"
//		),
//				promise=document.querySelector(
//			"#show-details>.price>.promise"	
//		),
//				spec=document.querySelector(
//			"#show-details>.spec>div"	
//		);
//		console.log(title,price,promise,spec);
//		title.innerHTML=laptop.title;
//		price.innerHTML="￥"+laptop.price;
//		promise.innerHTML+=laptop.promise;
//		var html="";
//		for(var l of family.laptop_list){
//			html+=`<a href="05-product-details.html?lib=${laptop.lid}" 
//				class=${
//              laptop.lid===details.lid?"active":""
//              }>${laptop.spec}</a>`;
//		}
//		spec.innerHTML=html;
