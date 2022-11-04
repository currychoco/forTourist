 let contentId = $("#contentId").val();
 console.log(contentId);

    $.ajax({
       method:"post",
       url:"/forTourist/festivalReviewPro.jsp",
       data:{
			contentId : contentId
       }
   }).done(function(response){
		let list = response;
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
   });