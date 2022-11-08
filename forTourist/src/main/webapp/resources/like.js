
function toggleLike() {
	$.ajax({
		method: "POST",
		url: "/forTourist/QuarterLikeAction",
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
		url: "/forTourist/QuarterLikeAction",
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