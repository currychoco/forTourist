
function toggleLike() {
	$.ajax({
		method: "post",
		url: "/forTourist/toggleLikePro.jsp",
		data: JSON.stringify({ contentId: contentId })
	}).done(function(response) {
		console.log(response);
		if(response.result === "OK") {
			checkLike();
		}
	})
}

function checkLike() {
	$.ajax({
		method: "GET",
		url: "/forTourist/checkLikePro.jsp",
		data: {
			contentId: contentId
		}
	}).done(function(response) {
		console.log(response);
		$("#like-count").text(response.count);
	})
}

$(document).ready(function() {
	checkLike();
});