function search(){
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
           keyword: 'keyword'
        },
     }).done(function (response) {
        console.log("response : ", response);
     });
}