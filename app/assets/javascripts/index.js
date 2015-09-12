// MAIN JS FILE

$( document ).ready(function() {
	init();

	  var indeed_client = new Indeed("3193862925521655");
      indeed_client.search({
        q: 'javascript',
        l: 'austin',
        userip: '1.2.3.4',
        useragent: 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_2)',
      }, function(search_response){
          console.log(search_response);
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
			console.log("key " + key);
			console.log("value " + value);
			// var field = $("#" + value);
			// console.log(field);
			console.log(document.getElementById(key));
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


// function jobSearch() {
// 	var doSearch = function (params, done, fail) {
// 	  $.ajax({ [Initial Parameters] }, params),
// 	    dataType: 'jsonp',
// 	    type: 'GET',
// 	    timeout: 5000,
// 	    url: 'http://api.indeed.com/ads/apisearch'
// 	  }).done(done).fail(fail);
// 	};
// }

// var Indeed = {};

// (function($){
  
//     Indeed = function(publisher){

//         this.publisher = publisher;

//         this.defaults = {'v': '2', 'format': 'json', 'publisher': this.publisher};

//         this.endpoint = 'https://api.indeed.com/ads/apisearch';

//         this.search = function(params, success){
//             this.validate_params(params);

//             for(var attr in this.defaults){params[attr] = this.defaults[attr];}
            
//             $.ajax({
//                 url: this.endpoint,
//                 dataType: 'jsonp',
//                 type: 'GET',
//                 data: params,
//                 success: success
//             });
//         };

//         this.required_fields = ['userip', 'useragent', ['q', 'l']];

//         this.validate_params = function(params){
//             var num_required = this.required_fields.length;

//             for(var i = 0; i < num_required; i++){
//                 var field = this.required_fields[i];
//                 if(field instanceof Array){
//                     var num_one_required = field.length;
//                     var has_one = false;
//                     for(var x = 0; x < num_one_required; x++){
//                         if(field[x] in params){
//                             has_one = true;
//                             break;
//                         }
//                     }
//                     if(!has_one){
//                         throw "You must provide one of the following " + field.join();
//                     }
//                 }else if(!(field in params)){
//                     throw "The field "+field+" is required";
//                 }
//             }
//         };

//     };

// })(jQuery);