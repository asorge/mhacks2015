// MAIN JS FILE

$( document ).ready(function() {
	init();

	$("#companySearchButton").click(function() {
		companySearch();
	});
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
			document.getElementById(key).value = value;
			$("label[for='" + key + "']").hide();
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

function companySearch() {
	var companyName = document.getElementById("companySearchBox").value;
	console.log(companyName);
	$.get("https://api.linkedin.com/v1/company-search?keywords={" + companyName + "}", function(data) {
		console.log(data);
	});	
}