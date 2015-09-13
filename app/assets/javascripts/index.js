// MAIN JS FILE

$( document ).ready(function() {
	init();

	$('.datepicker').pickadate({
	    selectMonths: true, // Creates a dropdown to control month
	    selectYears: 15 // Creates a dropdown of 15 years to control year
	});
});

function init() {
	IN.User.authorize(logInSuccess());
	$('#linkedinButton').click(function() {
		IN.User.authorize(logInSuccess());
	});

	$('#linkedinLogOut').click(function() {
		IN.User.logout();
	});

	$("#companySearchButton").click(function() {
		companySearch();
	});
}

function logInSuccess() {
	IN.Event.on(IN, "auth");
}

// Handle the successful return from the API call
function onSuccess(data) {
	console.log(data);
    $.each(data, function(key, value) {
		if (key == "firstName" || key == "lastName" || key == "headline" || key == "emailAddress") {
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
    IN.API.Raw("/people/~:(id,firstName,lastName,emailAddress,headline,positions)?format=json").result(onSuccess).error(onError);
}

function companySearch() {
	var companyName = document.getElementById("companySearchBox").value;
	console.log(companyName);
	IN.API.Raw("/company/~").result(function(data) {
		console.log(data);
	});
	// $.get("https://api.linkedin.com/v1/company-search?keywords={" + companyName + "}", function(data) {
	// 	console.log(data);
	// });	
}

function populateDashboard() {
	IN.User.authorize(logInSuccess());
	IN.API.Raw("/people/~:(id,firstName,lastName,emailAddress,headline,positions)?format=json").result(printData).error(onError);
}


function printData(data) {
	console.log(data);
	$("#dashboard").append(data);
}