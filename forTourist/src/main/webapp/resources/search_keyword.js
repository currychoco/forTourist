function searchKeyword(){
    let keyword =  $("#keyword").val();
   
   console.log(keyword);

   $.ajax({
       method: "GET",
       url: "http://apis.data.go.kr/B551011/KorService/searchKeyword",
       data: {
          _type:'json',
          serviceKey:'dOeEfUvGFzgN4TPUWYVHFduSfub/oQT8K2dXfsVsHJvS/zxHBTQZN7BQ6wq7IF0MPr3bvrfkd9ZbjsB7A/Yw1Q==',
          MobileOS:'ETC',
          MobileApp:'AppTest', 
          keyword: keyword
       },
    }).done(function (response) {
       console.log("response : ", response);
       const items = response.response.body.items.item;
       console.log(items);
       items.forEach((e) => {
            const firstimage = e.firstimage;
            const title = e.title;
            const addr1 = e.addr1;
            const addr2 = e.addr2;
            const tel = e.tel;
       $(".container").append(
        `<tr>
        <td><img src="${firstimage}"></td>
            <td>${title}</td>
            <td>${addr1}</td>
            <td>${addr2}</td>
            <td>${tel}</td>
        </tr>`
     );
    });
});
}

function syncKeyword(item){
    $.ajax({
        method:"post",
        url:"/forTourist/syncKeywordPro.jsp",
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
            keyword : keyword,
            mainImage : item.firstimage,
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
