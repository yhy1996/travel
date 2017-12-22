/*******
  加载banner和左右方向按钮以及indicators
********/
(()=>{
  var bannerImgs=$("[data-load=bannerImgs]")[0],
      bannerInds=$("[data-load=bannerInds]")[0],
      n=0,LIWIDTH=1920,TRANS=300,INTERVAL=2000,
      timer=null;
  ajax("get","data/banners.php","")
    .then(data=>{
      var banners=[...data];
	   console.log(banners);
      banners.push(banners[0]);
      var strImgs="";
      for(var img of banners){
        strImgs+=
          `<li class="banner-list" id="banner-img">
			  <a href="${img.href}">
				  <img src="${img.img}"  title="${img.title}">
			  </a>
			</li>`
      }
      var strInds="<li></li>".repeat(banners.length-1);
      bannerImgs.innerHTML=strImgs;
      bannerImgs.style.width=1920*banners.length+"px";
      bannerInds.innerHTML=strInds;
      bannerInds.children[0].className="hover";
      return new Promise(resolve=>resolve());
    })
    .then(()=>{
      function moveOnce(){
        n++;
        var left=LIWIDTH*n;
        bannerImgs.style.left=-left+"px";
        bannerInds.children[n-1].className="";
        if(n==bannerImgs.children.length-1){
          bannerInds.children[0].className="hover";
          setTimeout(()=>{  
            bannerImgs.style.transition="";
            bannerImgs.style.left=0;
            n=0;
            setTimeout(()=>{
              bannerImgs.style.transition=
                "all ."+TRANS/100+"s linear";
            },100);
          },TRANS);
        }else
          bannerInds.children[n].className="hover";
      }
      timer=setInterval(moveOnce,INTERVAL+TRANS);
      return new Promise(resolve=>resolve(moveOnce));
    })
    .then((moveOnce)=>{
      bannerImgs.parentNode.onmouseover=function(){
        clearInterval(timer);
        timer=null;
      }
      bannerImgs.parentNode.onmouseout=function(){
        timer=setInterval(moveOnce,INTERVAL+TRANS);
      }
      for(let i=0;i<bannerInds.children.length;i++){
        bannerInds.children[i].onclick=function(){
          n=i;
          bannerImgs.style.left=-n*LIWIDTH+"px";
          bannerInds.find(".hover")[0].className="";
          bannerInds.children[i].className="hover";
        }
      }
      $("[data-move=left]")[0].onclick=function(e){
        e.preventDefault();
        if(n>0){
          n--;
          bannerImgs.style.left=-n*LIWIDTH+"px";
          bannerInds.children[n+1].className="";
          bannerInds.children[n].className="hover";
        }else{
          bannerImgs.style.transition="";
          n=bannerImgs.children.length-1;
          bannerImgs.style.left=-n*LIWIDTH+"px";
          setTimeout(()=>{
            bannerImgs.style.transition="all ."+TRANS/100+"s linear";
            n--;
            bannerImgs.style.left=-n*LIWIDTH+"px";
            bannerInds.children[0].className="";
            bannerInds.children[n].className="hover";
          },100)
        }
      }
      $("[data-move=right]")[0].onclick=function(e){
        e.preventDefault();
        n++;
        bannerImgs.style.left=-n*LIWIDTH+"px";
        if(n<bannerImgs.children.length-1){ 
          bannerInds.children[n-1].className="";
          bannerInds.children[n].className="hover";
        }else{
          bannerInds.lastElementChild.className="";
          bannerInds.firstElementChild.className="hover";
          setTimeout(()=>{
            bannerImgs.style.transition="";
            bannerImgs.style.left=0;
            n=0;
            setTimeout(()=>{
              bannerImgs.style.transition=
                "all ."+TRANS/100+"s linear";
            },100)
          },TRANS)
        }
      }
    })
    .catch(err=>console.log(err))
})();