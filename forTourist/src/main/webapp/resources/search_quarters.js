let key = 39;
let pageNo = 1;
let endPoint = false;

$(".back_button").hide();
$(".next_button").hide();
$(".head").hide();

function clk(element) {
    key = element.value;
    pageNo = 1;
    start(key);
}

function start(let){
    $(".container").empty();
    $.ajax({
        method:"GET",
        url: "http://apis.data.go.kr/B551011/KorService/searchStay",
        data: {
            numOfRows: '12',
            pageNo: `${pageNo}`,
            MobileApp: 'AppTest',
            _type: 'json',
            listYN: 'Y',
            arrange: 'Q',
            serviceKey: "V5KE3rjqul+J8o0qA4zHE52eNpZ3JIAhHXlwW8NUDBtkQgfpBceSSAfCHwpp46sjpkyWZ6SXpnmGvkCH5HzGlQ==",
            MobileOS : "ETC",
            areaCode: `${key}`,
            sigunguCode: ""
        },
    }).done(function (response) {
        console.log("response : ", response);
        const items = response.response.body.items.item;
        items.forEach((e) => {
              const firstimage = e.firstimage;
              const title = e.title;
              const addr1 = e.addr1;
              const tel = e.tel;
              const contentid= e.contentid;
              $(".container").append(
                  `<ol class = "content">
                  <li><a href='/forTourist/detailQuarters?contentId=${contentid}&title=${title}&addr1=${addr1}&firstimage=${firstimage}&tel=${tel}' target='_blank' ><img src="${firstimage}  " class = "img" id = "firstimg"></a></li>
				  <li id = "title">${title}</li>
                  <li id = "address">${addr1}</li>
                  <li id = "tel">${tel}</li>               
                  </ol>`
				);
         });
        let cnt = response.response.body.totalCount;
        let restCnt = response.response.body.totalCount % 10;
        if (restCnt === 0) {
            if (cnt / 20 <= pageNo) {
                endPoint = true;
            } else {
                endPoint = false;
            }
        } else {
            if (cnt / 20 < pageNo) {
                endPoint = true;
            } else {
                endPoint = false;
            }
        }
        if (endPoint === true) {
            $(".next_button").hide();
        }
        if (pageNo === 1) {
            $(".back_button").hide();
            $(".next_button").show();
        }

    });
}



function getDataBack() {
    if (pageNo > 1) {
        pageNo--;
        start(key);
    }
}

function getDataNext() {
    if (endPoint === false) {
        pageNo++;
        start(key);
        $(".back_button").show();
    }
}


