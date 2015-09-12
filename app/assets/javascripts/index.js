// MAIN JS FILE

$( document ).ready(function() {
	init();
});

function init() {
	$('#linkedinButton').click(function() {
		console.log('linkedinButton click');
		IN.User.authorize(logInSuccess());
	});

	function logInSuccess() {
		alert('logged in!');
	}
}