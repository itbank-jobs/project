//toggle class scroll 
	$(window).scroll(function() {
		if ($(this).scrollTop() > 200) {
			$('.navbar-trans').addClass('afterscroll');
		} else {
			$('.navbar-trans').removeClass('afterscroll');
		}

	});

	// demo only 
	// open link in new tab without ugly target="_blank"
	$("a[href^='http']").attr("target", "_blank");

	$(document).ready(function() {
		$("#new").click(function() {
			setTimeout('$("#n").toggle(700)', '700');
		
			$("#t").hide(1000);
		});
		$("#team").click(function() {
			setTimeout('$("#t").toggle(700)', '700');
			$("#n").hide(1000);
		});

	});