let searchInput = $(".searchInput");
let searchBtn = $(".searchBtn");


$(".searchBtn").on("click", () => {
   searchKeyword(searchInput.val());
 });

let pageNo = 1;
let endPoint = false;



$(".back_button").hide();

$(".head").hide();

function searchKeyword(){
    let keyword =  $("#keyword").val();
   console.log(keyword);

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
       console.log("response : ", response);
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
                <li><a href='detailKeyword.jsp?contentid=${contentid}&title=${title}&addr1=${addr1}&firstimage=${firstimage}'><img src="${firstimage} " class = "img"></a></li>
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


//  function changeSelect(){
//     $('#selectbox').click(function () {
//         $("#selectbox option:selected)").prop("selected", true); 
//     });

//     var optionVal = $("#selectbox option:selected").val();
//     console.log(optionVal);
//     const optionVal = undefined;

//     if (optionVal) {
//     const keys = Object.keys(optionVal);
//     } else {
//     // 
//     console.log('Object is falsy');
//     }

//     $(".container").empty();
//     $.ajax({
//        method: "GET",
//        url: "http://apis.data.go.kr/B551011/KorService/searchKeyword",
//        data: {
//           _type:'json',
//           serviceKey:'dOeEfUvGFzgN4TPUWYVHFduSfub/oQT8K2dXfsVsHJvS/zxHBTQZN7BQ6wq7IF0MPr3bvrfkd9ZbjsB7A/Yw1Q==',
//           MobileOS:'ETC',
//           MobileApp:'AppTest',
//           numOfRows: 10,
//           pageNo: pageNo, 
//           keyword: keyword
//        },
//     }).done(function (response) {
//        console.log("response : ", response);
//        const items = response.response.body.items.item;
//        console.log(items);
//         items.forEach((e) => {
//             if(e.firstimage){
//             const firstimage = e.firstimage;
//             const title = e.title;
//             const addr1 = e.addr1;
           
//             $(".head").show();

//             $(".container").append(
//             `<tr>
//                 <td><a href="https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=1&ie=utf8&query=${title}"><img src="${firstimage}"></a></td>
//                 <td>${title}</td>
//                 <td>${addr1}</td>
//             </tr>`
//             );}
//         });
//         let cnt = response.response.body.totalCount;
//         let restCnt = response.response.body.totalCount % 10;
//         if (restCnt === 0) {
//             if (cnt / 10 <= pageNo) {
//                 endPoint = true;
//             } else {
//                 endPoint = false;
//             }
//         } else {
//             if (cnt / 10 < pageNo) {
//                 endPoint = true;
//             } else {
//                 endPoint = false;
//             }
//         }

//         if (endPoint === true) {
//             $(".next_button").hide();
//         }
//         if (pageNo === 1) {
//             $(".back_button").hide();
//             $(".next_button").show();
//         }
//     });
// }
