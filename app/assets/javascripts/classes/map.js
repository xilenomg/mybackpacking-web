MYBAPP.Map = (function(){
	var self = {};
	self.map = null;
	self.markers = [];


	self.initialize = function (options) {
		var settings = {
			mapElementID: 'map-canvas',
			center: {
				latitude: -30.397,
				longitude: 150.644
			},
			startZoom: 13
		};

		settings = $.extend(settings, options);

		var mapOptions = {
			zoom: settings.startZoom,
			center: new google.maps.LatLng(settings.center.latitude, settings.center.longitude)
		};
		self.map = new google.maps.Map(document.getElementById(settings.mapElementID), mapOptions);
	};

	self.addMarker = function(lat, long, title){
		var markerLatLong = new google.maps.LatLng(lat, long);
		var marker = new google.maps.Marker({
		    position: markerLatLong,
		   	map: self.map,
		    title: title
		});

		var contentString1 = title;

	    var infowindow1 = new google.maps.InfoWindow({
	        content: contentString1
	    });

	    google.maps.event.addListener(marker, 'click', function() {
	        infowindow1.open(self.map, marker);
	    });

		self.markers.push(marker);
	};

	self.centralizeAt = function(latitude,longitude){
		self.map.setCenter(new google.maps.LatLng(latitude, longitude));
	};

	return self;

}());