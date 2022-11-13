let pageNo = 1;
let endPoint = false;

$(".back_button").hide();
$(".next_button").hide();
$(".head").hide();

//처음 실행될 때 서울 지역 명소가 보이게 고정
start(1);

//클릭 했을 경우 해당 번호의 정보가 출력되게 하는 함수
function clk(element) {
    key = element.value;
    pageNo = 1;
    //키 값을 넘겼으면 넘긴 함수에서도 받는 부분이 있어야 함
    start(key);
}

// clk에서 넘겨받은 변수를 num에 저장, areaCode는 num값을 넘겨받음
function start(num){
    $(".container").empty();
    $.ajax({
        method: "GET",
        url: "http://apis.data.go.kr/B551011/KorService/areaBasedList",
        data: {
            _type: 'json',
            serviceKey: 'tkBvu0Nt4vpZX3hOvn+A1d0Ot2TygFhlJsQGDzZ4iC8yM0Io1muxlein9iXkDNSmOBewsagkswKUKAtA1AJj/A==',
            MobileOS: 'ETC',
            MobileApp: 'AppTest',
            areaCode: num,
            pageNo: pageNo,
            numOfRows: 20
        },
    }).done(function (response) {
        console.log("response : ", response);
        const items = response.response.body.items.item;
        items.forEach((e) => {
            if (e.firstimage !== "") {
	
                const firstimage = e.firstimage;
                const title = e.title;
                const addr1 = e.addr1;
				const contentid = e.contentid;
				
				
                $(".head").show();
                $(".container").append(
                 `<ol class="content">
 				<li><a href='detailArea?contentid=${contentid}&title=${title}&addr1=${addr1}&firstimage=${firstimage}' target='_blank' ><img src="${firstimage} " class = "img"></a></li>
                <li>${title}</li>
                 <li>${addr1}</li>
				</ol>`
                );
            }
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


