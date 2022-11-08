
function wantcheck(){
		$.ajax({
		method:"post",
		url:"/forTourist/checkWantPro.jsp",
		data:{
			type:"GET",
			firstimage:firstimage,
			addr1:addr1,
			url:"/forTourist/detailfestival?contentid=" + contentId + "&&title=" + title + "&&addr1=" + addr1 + "&&firstimage=" + firstimage,
			title:title,
			contentId:contentId		
		}
		}).done(function(){})
			}
		