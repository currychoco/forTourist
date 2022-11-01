
function getData(val) {
	// $(".container").empty();
	const value = "전라"
	$.ajax({
		method: "GET",
		url: `http://apis.data.go.kr/B551011/KorService/searchKeyword?numOfRows=10&serviceKey=tkBvu0Nt4vpZX3hOvn%2BA1d0Ot2TygFhlJsQGDzZ4iC8yM0Io1muxlein9iXkDNSmOBewsagkswKUKAtA1AJj%2FA%3D%3D&MobileOS=ETC&MobileApp=yse&keyword=${value}&contentTypeId`,
	}).done(function(response) {
		console.log("response : ", response);
	});
}