let contentId = $("#contentId").val();
 console.log(contentId);
 console.log(typeof(contentId));
 const userid = $("#userid").val();

review();
function review(){
    $.ajax({
       method:"post",
       url:"/forTourist/festivalReviewPro.jsp",
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
       $('.review').append(
			`<table>
			`
        );
        
        list.forEach(e=>{
		 $('.review').append(
			`
			<tr>
				<td>${e.userid}</td>
				<td>${e.resDate}</td>
				<td>${e.content}</td>
			`
			);
			
		if(userid === e.userid){
			$('.review').append(
			`
				<td><button>수정</button></td>
				<td><button onclick="validation('${e.userid}',${e.no})">삭제</button></td>
			`
			
			);
		}
		 $('.review').append(
			`
			</tr>
			`
			);

		});
		
		$('.review').append(
			`</table>
			`
        );
		}
		
   }).fail(function(err){
		console.log(err);	
	});
   
}

function validation(dtoUserId,dtoNo){
	if(dtoUserId===userid){
		location.href="/forTourist/festivalReviewDeletePro.jsp?no=" + dtoNo + "&&userId=" + dtoUserId+"&&contentId=" + contentId;
	}else{
		alert("본인이 작성한 리뷰가 아닙니다.");
	}
}