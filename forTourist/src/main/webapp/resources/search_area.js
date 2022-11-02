
let pageNo = 1;
let is_end = false;

$(".back_button").hide();
$(".head").hide();


function clk(element) {
    let key = element.value;
    console.log(key);
    
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
            numOfRows : 20
        },
    }).done(function(response){
        console.log("response : ", response);
        const items = response.response.body.items.item;
        items.forEach((e) => {
            if(e.firstimage){
            const firstimage = e.firstimage;
            const url = "https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=0&ie=utf8&query="+e.title;
            const title = e.title;
            const addr1 = e.addr1;
            
            $(".container").append(
                `<tr>
                <td><a href="${url}"><img src="${firstimage}"></a></td>
                  <td>${addr1}</td>
                  <td>${title}</td>
                </tr>`
             );
            }
        });

        is_end = response.meta.is_end;
        if (is_end === true) {
           $(".next_button").hide();
        }
        if (page === 1) {
           $(".back_button").hide();
           $(".next_button").show();
        }

    });
}



function getDataBack() {
    if (pageNo > 1) {
        pageNo--;
       clk();
    }
 }
 
 function getDataNext() {
    if (is_end === false) {
        pageNo++;
       clk();
       $(".back_button").show();
    }
 }
