let searchInput = $(".searchInput");
let searchBtn = $(".searchBtn");


$(".searchBtn").on("click", () => {
   searchKeyword(searchInput.val());
 });

let pageNo = 1;
let endPoint = true;

if (endPoint === true) {
            $(".next_button").hide();
        }

$(".back_button").hide();

$(".head").hide();

const keyword =  $("#keyword").val();
searchKeyword();

function searchKeyword(){
    
    $(".container").empty();
    $.ajax({
       method: "GET",
       url: "http://apis.data.go.kr/B551011/KorService/searchKeyword",
       data: {
          _type:'json',
          serviceKey:'dOeEfUvGFzgN4TPUWYVHFduSfub/oQT8K2dXfsVsHJvS/zxHBTQZN7BQ6wq7IF0MPr3bvrfkd9ZbjsB7A/Yw1Q==',
          MobileOS:'ETC',
          MobileApp:'AppTest',
          numOfRows: 12,
          pageNo: pageNo, 
          keyword: keyword
       },
    }).done(function (response) {
       const items = response.response.body.items.item;
       console.log(items);
        items.forEach((e) => {
            if(e.firstimage !== ""){
            const firstimage = e.firstimage;
            const title = e.title;
            const addr1 = e.addr1;
            const contentid = e.contentid;

            $(".head").show();

            $(".container").append(
            `<ol class="content">
                <li><a href='detailKeyword?contentid=${contentid}&title=${title}&addr1=${addr1}&firstimage=${firstimage}' target='_blank' ><img src="${firstimage} " class = "img"></a></li>
                <li>${title}</li>
                <li>${addr1}</li>
            </ol>`
            );
			}
        });
        
        let cnt = response.response.body.totalCount;
        let restCnt = response.response.body.totalCount % 12;
        if (restCnt === 0) {
            if (cnt / 12 <= pageNo) {
                endPoint = true;
            } else {
                endPoint = false;
            }
        } else {
            if (cnt / 12 < pageNo) {
                endPoint = true;
            } else {
                endPoint = false;
            }
        }

        if (pageNo === 1) {
            $(".back_button").hide();
            $(".next_button").show();
        }
        if (endPoint === true) {
            $(".next_button").hide();
        }
    });
}

function getDataBack() {
    if (pageNo > 1) {
       pageNo--;
       searchKeyword(searchInput.val());
    }
 }


 function getDataNext() {
    if (endPoint === false) {
       pageNo++;
      searchKeyword(searchInput.val());
       $(".back_button").show();
    }
 }

