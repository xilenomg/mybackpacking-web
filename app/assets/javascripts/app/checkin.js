MYBAPP.controller.Checkin = (function(){
	var self = {};

	self.doFindLocation = function(){
		MYBAPP.Location.getLocation (function(result){
			if ( result ) {
				MYBAPP.Location.getPlace(result.coords.latitude, result.coords.longitude, function(location){
					if ( location ){
						MYBAPP.Map.initialize({center:{latitude: location.latitude, longitude:location.longitude}});

						$("#page-1").slideUp();
						$(".city-name").html(location.city.long_name);
						$(".state-name").html(location.state.long_name);
						$(".country-name").html(location.country.long_name);
						$("#page-2").slideDown();
					}
					else{
						alert("location not found");
					}
				});	
			}
			else{
				alert("your location not found");
			}
		});	
	};

	self.doCheckin = function(){
		if ( typeof MYBAPP.Location.lastLocation !== "undefined" && MYBAPP.Location.lastLocation ){
			$.post('/app/checkin/create.json', MYBAPP.Location.lastLocation).done(function(data){
				alert('You have checked successfully');
			}, 'json').fail(function(data){
				if ( data.responseJSON && data.responseJSON.error_message ){
					alert(data.responseJSON.error_message);
				}
				else{
					alert("unexpect error");
				}
			});
		}
		else{
			alert("No location found");
		}
	};

	return self;
}());

$(document).ready(function(){
	$('#find-location-button').click (function(event){
		MYBAPP.controller.Checkin.doFindLocation();	
		$(this).attr('disabled', 'disabled')
	});

	$('#checkin-button').click(function(){
		MYBAPP.controller.Checkin.doCheckin();
	});
});
