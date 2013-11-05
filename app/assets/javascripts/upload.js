//This can be used as ajax file upload, Unfortunately, it doesn't really work.
/*$("document").ready(function(){

    $(':file').change(function(){
    		//no need for the submit button
		    //$("form#new_upload").submit( function() {

		    	var formData = new FormData($("form#new_upload")[0]);
		    	console.log(formData);
			    $.ajax({
			        url: '/upload',
			        type: 'POST',
			        timeout:8000,
			        data: formData,
			        async: false,
			        success: function (data) {
			            alert(data)
			        },
			        cache: false,
			        contentType: false,
			        processData: false
			    });

			    return false;
			//});
    });
});*/
