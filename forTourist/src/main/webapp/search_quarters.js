let key = 1;
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
            numOfRows: '10',
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
              const readcount= e.readcount;
              const goodstay = e.goodstay;
              const benikia = e.benikia;
              const hanok = e.hanok;
              $(".container").append(
                  `<tr>
                  <td><a href = ""><img src="${image}"></a></td>
                  <td>${title}</td>
                  <td>${addr1}</td>
                  <td>${tel}</td>
                  <td>${readcount}</t>
                  <td>${goodstay}</td>
                  <td>${benikia}</td>
                  </tr>`
              );
         });

        const whole_page = Math.floor(parseInt(response.response.body.totalCount)/10)+1;
        console.log(response.response.body.totalCount)
        console.log(whole_page)
         if (page === whole_page){
             $('.next_button').hide();
             is_end=true;
            }
        if(page === 1) {
            $('.back_button').hide();
            $('.next_button').show();
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