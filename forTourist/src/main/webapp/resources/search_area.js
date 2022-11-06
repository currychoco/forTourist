
let pageNo = 1;
let endPoint = false;

$(".back_button").hide();
$(".next_button").hide();
$(".head").hide();

let key;


function clk(element) {
    key = element.value;
    pageNo = 1;
    start(key);
}

function start(let){
    $(".container").empty();
    $.ajax({
        method: "GET",
        url: "http://apis.data.go.kr/B551011/KorService/areaBasedList",
        data: {
            _type: 'json',
            serviceKey: 'tkBvu0Nt4vpZX3hOvn+A1d0Ot2TygFhlJsQGDzZ4iC8yM0Io1muxlein9iXkDNSmOBewsagkswKUKAtA1AJj/A==',
            MobileOS: 'ETC',
            MobileApp: 'AppTest',
            areaCode: key,
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
 				<li><a href='detailArea?contentid=${contentid}&title=${title}&addr1=${addr1}&firstimage=${firstimage}'><img src="${firstimage} " class = "img"></a></li>  
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


