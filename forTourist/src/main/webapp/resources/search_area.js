
function clk(element) {
    let key = element.value;
    console.log(key);

    $.ajax({
        method: "GET",
        url: "http://apis.data.go.kr/B551011/KorService/searchKeyword",
        data: {
            _type: 'json',
            serviceKey: 'tkBvu0Nt4vpZX3hOvn+A1d0Ot2TygFhlJsQGDzZ4iC8yM0Io1muxlein9iXkDNSmOBewsagkswKUKAtA1AJj/A==',
            MobileOS: 'ETC',
            MobileApp: 'AppTest',
            keyword: key
        },
    }).done(function (response) {
        console.log("response : ", response);
    });
}


