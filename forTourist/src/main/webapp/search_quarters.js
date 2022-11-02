getData();
function getData(){
    $(".container").empty();

    $.ajax({
        method:"GET",
        url: "http://apis.data.go.kr/B551011/KorService/searchStay",
        data: {
            numOfRows: '10',
            pageNo: '1',
            MobileApp: 'AppTest',
            _type: 'json',
            listYN: 'Y',
            arrange: 'C',
            serviceKey: "V5KE3rjqul+J8o0qA4zHE52eNpZ3JIAhHXlwW8NUDBtkQgfpBceSSAfCHwpp46sjpkyWZ6SXpnmGvkCH5HzGlQ==",
            MobileOS : "ETC",
            areaCode: "31",
            sigunguCode: "1"
        }
    }).done(function (response){
        console.log("response:", response);
        
        const list = response.response.body.items.item;
        console.log(list);
         list.forEach(e=>{
              console.log(e);
              const image = e.firstimage;
              const title = e.title;
              const addr1 = e.addr1;
              const tel = e.tel;
              const readcount= e.readcount;
              const goodstay = e.goodstay;
              const benikia = e.benikia;
              const hanok = e.hanok;
              $(".container").append(
                  `<tr>
                  <td><img src="${image}"></td>
                  <td>${title}</td>
                  <td>${addr1}</td>
                  <td>${tel}</td>
                  <td>${readcount}</t>
                  <td>${goodstay}</td>
                  <td>${benikia}</td>
                  </tr>`
              );
 //            <th>firstimage</th>
 //				<th>title</th>
 //				<th>addr1</th>
 //				<th>tel</th>
 //				<th>readcount</th>
 //				<th>굿스테이</th>
 //				<th>베니키아</th>
 //				<th>한옥</th>
         });
        
    });
}