function pass_ck() {

	var passwd = $("#newsPasswd").val();
	if (passwd.length == 8) {
		$.ajax({
			type : "post",
			data : {
				passwd : passwd
			},
			url : '/proto/news_passCK',

			success : function(result) {
				var chk = result;
				if (chk == 1) {
					location.replace("news_writeView");
				} else {

					$('#Message').html(
							'<font color = red> Incorrect PASSWORD</font>')
					setTimeout('$("#Message").html("&nbsp")', '5000');
				}

			},
			error : function(xhr, status, e) {
				$('#Message').html('비밀번호를 입력해 주세요.')
				setTimeout('$("#Message").html("&nbsp")', '5000');
			}

		});
	}
}
function conCk(test) {
	if ($(test).children('div').attr('class') != 'true') {
		$(test).children('div').attr('class', 'true');
		$(test).children('div').css('max-height', 'fit-content').css('opacity',
				'1').css('overflow', 'auto').css('transition', 'all 0.5s').css(
				'padding', '10px');
	} else {
		$(test).children('div').css('max-height', '0px').css('opacity', '0')
				.css('overflow', 'hidden').css('transition', 'all 0.5s').css(
						'padding', '0 10px');
		$(test).children('div').attr('class', '');
	}
};
$(function() {

	$(".dark").click(function() { // dark 클래스 클릭하면
		$("#feed").addClass('dark'); // #dark css적용
		$('.opt').css('background', '#000000cc').css('color', '#ffffff');
		$('.dark').css('color', '#ffffff');
		$('.light').css('color', '#ffffff');
	});
	$(".light").click(function() {
		$("#feed").removeClass('dark');
		$('.opt').css('background', '#ffffffad').css('color', '#000000');
		$('.dark').css('color', '#000000');
		$('.light').css('color', '#000000');

	});

	$(document).ready(function() {
		$("#news").click(function() {
			$("#newsPasswd").toggle(700);

		});
	});
});