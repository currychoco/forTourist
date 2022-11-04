 let contentId = $("#contentId").val();
 console.log(contentId);

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