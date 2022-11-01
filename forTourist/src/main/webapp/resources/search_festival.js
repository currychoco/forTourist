function searchFestival(){
    let date = $("#date").val();
    
    console.log(typeof(date));
    let data = [];
    data = date.split('-');

    date = data[0] + data[1] + data[2];
    
    $.ajax({
       method:"GET",
       url:"http://apis.data.go.kr/B551011/KorService/searchFestival",
       data:{
           _type:'json',
           serviceKey:'l2oC21FGcJ1+nVdL+JFnI3VBpnvzf5lsgD57VDKIGm7hR6fr0+NtkS5i+qtBHo7zUtvUe1nhWVqg/Kc6dxa/Ow==',
           MobileOS:'ETC',
           MobileApp:'AppTest',
           eventStartDate: date
       }
   }).done(function(response){
       console.log("response : ", response);
       const items = response.response.body.items.item;
       console.log(items);
       items.forEach(e => {
          syncFestival(e);
       });
   });
   console.log("아무거나");
}

function syncFestival(item){
	   $.ajax({
	       method:"post",
	       url:"/forTourist/syncFestivalPro.jsp",
	       async:false,
	       data:{
	        	contentId : item.contentid,
				addr1 : item.addr1,
				addr2 : item.addr2,
				areacode : item.areacode,
				booktour : item.booktour,
	 			cat1 : item.cat1,
	 			cat2 : item.cat2,
	 			cat3 : item.cat3,
				eventEndDate : item.eventenddate,
				eventStartDate : item.eventstartdate,
				posterImage : item.firstimage,
				mapX : item.mapx,
				mapY : item.mapy,
				mlevel : item.mlevel,
				sigungucode : item.sigungucode,
				tel : item.tel,
				title : item.title
	       }
	   }).done(function(response){
			console.log(response);
	   });
}
 