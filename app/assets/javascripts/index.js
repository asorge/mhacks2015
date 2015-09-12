// MAIN JS FILE

$( document ).ready(function() {
	init();
});

function init() {
	$('#linkedinButton').click(function() {
		IN.User.authorize(logInSuccess());
	});

	$('#linkedinLogOut').click(function() {
		IN.User.logout();
	});
}

function logInSuccess() {
	IN.Event.on(IN, "auth");
}

    // Handle the successful return from the API call
function onSuccess(data) {

    $.each(data, function(key, value) {
		if (key == "firstName" || key == "lastName" || key == "headline") {
			console.log("key " + key);
			console.log("value " + value);
			var field = $("#" + value);
			console.log(field);
			field.value = key;
		}
	});

}

// Handle an error response from the API call
function onError(error) {
    console.log(error);
}

// Use the API call wrapper to request the member's basic profile data
function getProfileData() {
    IN.API.Raw("/people/~").result(onSuccess).error(onError);
}

