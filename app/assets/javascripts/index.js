// MAIN JS FILE

$( document ).ready(function() {
	init();

	$('.datepicker').pickadate({
	    selectMonths: true, // Creates a dropdown to control month
	    selectYears: 15 // Creates a dropdown of 15 years to control year
	});


});

function init() {
	IN.User.authorize();



	$('#logInImage').click(function() {
		if (IN.User.isAuthorized()) {
			console.log("yo");
			$("p.introduction").append("<p>Already logged in with LinkedIn! Sign up with the link above!</p><br>");
		}
		else {
			IN.User.authorize();
		}
		
	});

	$('#linkedinLogOut').click(function() {
		IN.User.logout();
	});

	$("#companySearchButton").click(function() {
		companySearch();
	});
}

// function logInSuccess() {
// 	IN.Event.on(IN, "auth");
// }

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
	IN.User.authorize();
	IN.API.Raw("/people/~:(id,firstName,lastName,emailAddress,headline,positions)?format=json").result(printData).error(onError);
}


function printData(data) {
	console.log(data);
	$.each(data, function(key, value) {
		if (key == "id") {
			console.log(value);
			$("#dashboard-button").append("<div class='waves-effect waves-light btn cyan lighten-3 small grey-text text-darken-3 button'><a href='http://www.linkedin.com/profile/view?id='" + value + "'>open linkedin profile</a></div><br><br>");
		}
	});
	
}