<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
  #map {
    height: 80%;
    width: 80%;
  }
  html, body {
    height: 100%;
    margin: 0;
    padding: 0;
  }
</style>
<script async src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD8opKrg2KxWc4DP2hsQFX1Dodhtn98ONs&callback=initMap">
</script>
<title>Document</title>
</head>
<body>
<div id="map"></div>

<script>


	let map;
|	function initMap() {
		var seoul = new google.maps.LatLng(37.580797, 126.990675);
		map = new google.maps.Map(document.getElementById("map"), {
			center : seoul,
			zoom : 8,
		});

//		const infowindow = new google.maps.InfoWindow();
//		var request = {
//			query : '창덕궁',
//			fields : [ 'name', 'geometry' ],
//		};



		var service = new google.maps.places.PlacesService(map);

		service.findPlaceFromQuery(request, function(results, status) {
			if (status === google.maps.places.PlacesServiceStatus.OK) {
				for (var i = 0; i < results.length; i++) {
					createMarker(results[i]);
				}
				map.setCenter(results[0].geometry.location);
			}
		});
	}

	//window.initMap = initMap;
	//map = new google.maps.Map(document.getElementById("map"), {...});
</script>
</body>
</html>