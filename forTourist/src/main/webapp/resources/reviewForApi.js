let contentId = $("#contentId").val();
let title = $("#title").val();
let addr1 = $("#addr1").val();
let firstimage = $("#firstimage").val();


 console.log(contentId);
 console.log(typeof(contentId));
 const userid = $("#userid").val();

review();
function review(){
    $.ajax({
       method:"post",
       url:"/forTourist/FestivalReviewAction",
       data:{
			contentId : contentId
       }
   }).done(function(response){
		let list = response;
		if(list.length == 0){
			$('.review').append(
			`
			<p>첫 리뷰를 달아주세요~</p>
			`
       		 );
		}else{
			console.log(list);
			let htmlText = "";
			
			htmlText += `<table>`;
        
	        list.forEach(e=>{
				
				
				htmlText += `
				<tr>
					<td>${e.userid}</td>
				`;
				
				if(e.modDate != "null"){
					htmlText += `<td><span>(수정일)</span>${e.modDate}</td>
						<td class="reviewContent" data-id="${e.no}">${e.content}</td>
					`;
				}else{
					htmlText += `<td><span>(작성일)</span>${e.resDate}</td>
						<td class="reviewContent" data-id="${e.no}">${e.content}</td>
					`;
				}
				if(userid === e.userid){
					htmlText += `
						<td><button onclick="modifyValidation('${e.userid}',${e.no})">수정</button></td>
						<td><button onclick="deleteValidation('${e.userid}',${e.no})">삭제</button></td>
					`;
				} else {
					htmlText += `
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					`;
				}
				htmlText += `</tr>`;
			});
			
			htmlText += `</table>`;
			$('.review').append(htmlText);
		}
   }).fail(function(err){
		console.log(err);	
	});  
}
function deleteValidation(dtoUserId,dtoNo){
	if(dtoUserId===userid){
		location.href="/forTourist/AreaReviewDeleteAction?no=" + dtoNo + "&userId=" + dtoUserId+"&contentId=" + contentId + "&title=" + title + "&addr1=" + addr1 + "&firstimage=" + firstimage;
	}else{
		alert("본인이 작성한 리뷰가 아닙니다.");
	}
}

function modifyValidation(dtoUserId,dtoNo){
	if(dtoUserId===userid){
		$(".writeReview").hide();
		$(".updateReview").show();
		$(".updateReview input[name=no]").val(dtoNo);
		const text = $(".reviewContent[data-id=" + dtoNo + "]").text();
		$(".updateReview textarea").val(text);
	}else{
		alert("본인이 작성한 리뷰가 아닙니다.");
	}
}