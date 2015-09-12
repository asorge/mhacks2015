// MAIN JS FILE

$( document ).ready(function() {
	IN.User.authorize(init);
});

function init() {
	console.log("logged in");
}