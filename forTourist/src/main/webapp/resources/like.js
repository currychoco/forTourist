
function likecheck(){
		$.ajax({
		method:"post",
		url:"/forTourist/checkLikePro2.jsp",
		data:{
			type:"GET",
			firstimage:firstimage,
			addr1:addr1,
			url:"/forTourist/detailfestival?contentid=" + contentId + "&&title=" + title + "&&addr1=" + addr1 + "&&firstimage=" + firstimage,
			title:title,
			contentId:contentId		
		}
		}).done(function(){
			if($(".like").show()){
				$(".like").hide();
				$(".liked").show();
			}else if($(".liked").show()){
				$(".liked").hide();
				$(".like").show();
			}
		})}