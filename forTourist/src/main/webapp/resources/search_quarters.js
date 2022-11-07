let key = 39;
let page = 1;
let is_end = false;
getData(key);
function clk(element) {
    page=1;
    key = element.value;
    console.log(key);
    getData(key);
}

function getData(key){
    $(".container").empty();

    $.ajax({
        method:"GET",
        url: "http://apis.data.go.kr/B551011/KorService/searchStay",
        data: {
            numOfRows: '12',
            pageNo: `${page}`,
            MobileApp: 'AppTest',
            _type: 'json',
            listYN: 'Y',
            arrange: 'Q',
            serviceKey: "V5KE3rjqul+J8o0qA4zHE52eNpZ3JIAhHXlwW8NUDBtkQgfpBceSSAfCHwpp46sjpkyWZ6SXpnmGvkCH5HzGlQ==",
            MobileOS : "ETC",
            areaCode: `${key}`,
            sigunguCode: ""
        }
    }).done(function (response){
        // console.log("response:", response);
        // const regin = response.response.body;
        // const hotel = regin.


        const list = response.response.body.items.item;
        console.log(list);
         list.forEach(e=>{
              console.log(e);
              const image = e.firstimage;
              const title = e.title;
              const addr1 = e.addr1;
              const tel = e.tel;
              const contentid= e.contentid;
              const goodstay = e.goodstay;
              const benikia = e.benikia;
              const hanok = e.hanok;
              $(".container").append(
                  `<ol class = "content">
				  <li id = "contentid" hidden>${contentid}</li>
                  <li id = "thumbnail"><a href = "writeReviewQuerters.jsp?contentid=${contentid}&firstimage=${image}" target='_blank' ><img src="${image}" id = "firstimg" name = "firstimg"></a></li>
                  <li id = "title">${title}</li>
                  <li id = "address">${addr1}</li>
                  <li id = "tel">${tel}</li>               
                  </ol>`
              );
         });

        const whole_page = Math.floor(parseInt(response.response.body.totalCount)/12)+1;
        console.log(response.response.body.totalCount)
        console.log(whole_page)
        if(page === 1) {
            $('.back_button').hide();
            $('.next_button').show();
        }
         if (page === whole_page){
             $('.next_button').hide();
             is_end=true;
            }
    });
}

function getDataBack() {
    if(page > 1) {
        page --;
        getData(key);
    }
}

function getDataNext() {
    console.log(key)
    console.log(page)
    console.log(is_end)
    if(is_end === false) {
        page++;
        getData(key);
        $('.back_button').show();
    }else{
        $('.next_button').hide();
    }
}