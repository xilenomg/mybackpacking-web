MYBAPP.controller.RoutePlaces = (function(){
	var self = {};

	self.initialize = function(settings){
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
	};

	return self;
}());

$(document).ready(function(){
	MYBAPP.controller.RoutePlaces.initialize();
});

