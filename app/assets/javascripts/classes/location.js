MYBAPP.Location = {
	lastLocation: null,
	getLocation: function(callback){
		if ( navigator.geolocation ) {
        	navigator.geolocation.getCurrentPosition(callback);
        }
        else{
        	callback(null);
        }
	},
	getPlace: function(latitude, longitude, callback){
		// latitude = -17.5171494;
		// longitude = -39.1942346;
		$.getJSON("http://maps.googleapis.com/maps/api/geocode/json?latlng=" + latitude + "," + longitude + "&sensor=false").done(function(data){
			if ( data && data.results.length > 0 ) {
				var foundLocation = false;
				$(data.results).each(function(e){
					if ( this.types[0] === "locality" ){
						var location = MYBAPP.Location.getDataFromLocalityType(this, latitude, longitude);
						callback(location);
						foundLocation = true;
						return false;
					}
				});
				if ( !foundLocation ){
					callback( null );
				}
			}
			else{
				callback( null );
			}
		}).fail(function(){
			callback(null);
		});
	},
	getCity: function(googleJson){
		return googleJson.filter(function(e){
			if ( e && e.types[0] === "locality" ){
				return e;
			}
		});
	},
	getState: function(googleJson){
		return googleJson.filter(function(e){
			if ( e && e.types[0] === "administrative_area_level_1"){
				return e;
			}
		});
	},
	getCounty: function(googleJson){
		return googleJson.filter(function(e){
			if ( e && e.types[0] === "administrative_area_level_2" ){
				return e;
			}
		});
	},
	getCountry: function(googleJson){
		return googleJson.filter(function(e){
			if ( e && e.types[0] === "country" ){
				return e;
			}
		});
	},
	getDataFromLocalityType: function(json, latitude, longitude){
		var location = {};
		location.country = MYBAPP.Location.getCountry(json.address_components)[0];
		location.state = MYBAPP.Location.getState(json.address_components)[0];
		location.county = MYBAPP.Location.getCounty(json.address_components)[0];
		location.city = MYBAPP.Location.getCity(json.address_components)[0];
		location.latitude = latitude;
		location.longitude = longitude;
		MYBAPP.Location.lastLocation = location;
		return location;
	}
}