function searchFestival(){
	let date = $("#date").val();
   $.ajax({
       method:"post",
       url:"/forTourist/searchFestivalViewPro.jsp",
       data:{
        	date : date
       }
   }).done(function(response){
		console.log(response);
   });
}
 