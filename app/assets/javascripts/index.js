// MAIN JS FILE

$( document ).ready(function() {
	if (IN.User.isAuthorized()) {
		logInSuccess();
	}
	else {
		init();
	}
});

function init() {
	$('#linkedinButton').click(function() {
		console.log('linkedinButton click');
		IN.User.authorize(logInSuccess());
	});
	$('#linkedinLogOut').click(function() {
		IN.User.logout();
	});
}

function logInSuccess() {
	alert('logged in!');
	IN.Event.on(IN, "auth", getProfileData);
}

    // Handle the successful return from the API call
function onSuccess(data) {
    console.log(data);
}

// Handle an error response from the API call
function onError(error) {
    console.log(error);
}

// Use the API call wrapper to request the member's basic profile data
function getProfileData() {
    IN.API.Raw("/people/~").result(onSuccess).error(onError);
}