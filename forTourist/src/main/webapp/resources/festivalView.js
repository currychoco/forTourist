function searchFestival(){
	let date = $("#date").val();
   $.ajax({
       method:"post",
       url:"/forTourist/searchFestivalViewPro.jsp",
       data:{
        	date : date
       }
   }).done(function(response){
		console.log("여기 들어오긴 하세요???");
		const list = response;
		
		list.forEach(e=>{
			
		});
   });
}
 