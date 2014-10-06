MYBAPP.controller.Map = (function(){
	var self = {};

	self.init = function(settings){
		settings = $.extend({
			map:{
				startZoom: 5
			}, markers: []}, settings);

		if ( settings.markers.length > 0 ){
			settings.map = $.extend({center: { latitude: $(settings.markers).first().get(0).latitude,  longitude: $(settings.markers).first().get(0).longitude }}, settings.map);
		}
		else{
			settings.map = $.extend({center: { latitude: 0,  longitude: 0 }}, settings.map);
		}

		MYBAPP.Map.initialize(settings.map);
		self.addMarkers(settings.markers);
		self.addPlacesListener();
		self.addControlsListener();
	};

	self.addMarkers = function(markers){
		if ( markers ){
			$(markers).each(function(){
				MYBAPP.Map.addMarker(this.latitude, this.longitude, this.country + ' - ' + this.state + ' - ' + this.city);
			});
			
		}
	};

	self.addPlacesListener = function(){
		$(".places-list ul").on('click', 'li', function(){
			MYBAPP.Map.centralizeAt($(this).attr('data-lat'),$(this).attr('data-lng'));
		});
	};

	self.addControlsListener = function(){
		$("#maximize-map").on('click', function(){
			$("#places-map").toggleClass('maximized');
		});
	};

	return self;
}());

$(document).ready(function(){
	if ( MYBAPP.extras.myLocations ){
		MYBAPP.controller.Map.init({markers: MYBAPP.extras.myLocations, map: {startZoom: 5}});
	}
});