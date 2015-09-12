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
	IN.Event.on(IN, "auth", getProfileData);
}

    // Handle the successful return from the API call
function onSuccess(data) {
    console.log(data);
    $.each(data, function(key, value) {
		console.log(value);
		var field = $("#" + key);
		if (field.length) {
			field.val(value);
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

