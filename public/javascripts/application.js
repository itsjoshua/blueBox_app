function showFlash() {
	/*
		If there is a message in the flash, slide it down to show the user, then
		slide it up and delete it from the html. Do this for each type of flash message.
	*/
	if($('.success').html().trim() != "") {
		$('.success').delay(500).slideDown(400, function() {
		   $(this).delay(3000).slideUp(400, function() {
				$(this).html("");
			});
		});
	}
	if($('.alert').html().trim() != "") {
		$('.alert').delay(500).slideDown(400, function() {
			$(this).delay(3000).slideUp(400, function() {
				$(this).html("");
			});
		});
	}
	if($('.notice').html().trim() != "") {
		$('.notice').delay(500).slideDown(400, function() {
			$(this).delay(3000).slideUp(400, function() {
				$(this).html("");
			});
		});
	}
}

function hoverHost() {
	$('.virtual_server_container').hover(function() {
		$("#host_"+$(this).attr("host")).show();
	}, function() {
		$("#host_"+$(this).attr("host")).hide();
	});

}


$(document).ready(function() {
	
	//show flash message
	$(".click_host_info").hide();
	showFlash();
	hoverHost();
})

