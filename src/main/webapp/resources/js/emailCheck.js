

//회원가입 체크
function ck() {
	var vemail = $('#email').val();
	
	var atLastPos = vemail.lastIndexOf('@');
	var atPos = vemail.indexOf('@');
	var dotPos = vemail.indexOf('.');
	var commaPos = vemail.indexOf(',');
	var spacePos = vemail.indexOf(' ');
	var eMailSize = vemail.length;
	if (
		atPos > 1 &&
		atPos == atLastPos &&
		dotPos > 3 &&
		commaPos == -1 &&
		spacePos == -1 &&
		atPos + 1 < dotPos &&
		dotPos + 1 < eMailSize
	){
		$.ajax({
		type : 'post',
		data : {email:vemail},
		dataType : 'text',
		url : '/proto/emailCheck',
		
		success : function(result){
			var chk = result;
			if(chk == 0){
				
				$('#eck').val('true');
				$('#Message').html('<font color="#6fd5f1">사용가능한 E-Mail 입니다.')
			}else{
				
				$('#Message').html('사용 불가능한 E-Mail 입니다')
				$('#eck').val('false');
			}
			
		},
		error : function(xhr, status, e){
			alert(e);
		}
		
	});//ajax}	
	}
	else if($('#email').val() == ''){
		
		$('#eck').val('false');

	
	}else{
		
		$('#eck').val('false');
		$('#Message').html('E-Mail 형식이 아닙니다.');
	}
};