
function toggleWant() {
	$.ajax({
		method: "post",
		url: "/forTourist/toggleWantPro.jsp",
		contentType: "application/json",
		data: JSON.stringify({
			contentId: contentId,
			title: title,
			addr1: addr1,
			firstimage: firstimage
		})
	})
	.done(function(response) {
		console.log(response);
		
		if(response.result === "OK") {
			if(response.msg === "CREATED") {
				alert("찜 등록이 완료되었습니다.");
			} else if(response.msg === "DELETED") {
				alert("찜 해제가 완료되었습니다.");
			}
			location.reload();
		} else {
			alert("문제가 발생했습니다. 다시 시도해 주세요.");
		}
	})
}


function checkWant() {
	$.ajax({
		method: "GET",
		url: "/forTourist/checkWantPro.jsp",
		data: {
			contentId: contentId
		}
	})
	.done(function(response) {
		console.log(response);
		if(response == null) { // 찜 X
			$("#want-text").text("☆");
		} else { // 찜 O
			$("#want-text").text("★");
		}
	})
}

$(document).ready(function() {
	checkWant();
})