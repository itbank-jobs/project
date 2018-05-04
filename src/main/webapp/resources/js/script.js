


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
				$('#Message').html('<font color="#6fd5f1">사용가능한 아이디 입니다.')
			}else{
				$('#Message').html('사용 불가능한 아이디 입니다')
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
		$('Message').html('E-Mail 형식이 아닙니다.');
	}
};


function passwordCheck() {
	var pw1 = $('#password').val();
	var pw2 = $('#rePassword').val();

	if( pw1 == pw2){
		$('#Message').html('<font color="#6fd5f1">비밀번호가 일치 합니다</font>')
	}else if(pw2 == null || pw2 == ""){
		$('#Message').html('')
	}else{
		$('#Message').html('비밀번호가 일치하지 않습니다.')
		
	}
}


function inputCheck() {

	if (document.register.employeeNumber.value == "") {
		document.register.employeeNumber.focus();
		return false;
	}
	
	if (document.register.name.value == "") {
		document.register.name.focus();
		return false;
	}
	
	if ($('#eck').val() == "false") {
		document.register.email.focus();
		$('#Message').html('E-Mail을 확인해 주세요.');
		return false;
	}
	

	if (document.register.password.value == "") {
		document.register.password.focus();
		return false;
	}
	if (document.register.rePassword.value == "") {
		document.register.rePassword.focus();
		return false;
	}
	if(document.register.password.value  !=document.register.rePassword.value ){
		document.register.password.focus();
		return false;
	}
}

//회원가입 아이디 비밀번호 체크
function loginCheck(){
	
	var email = $('#email')
	
	if(document.login.email.value ==""){
		document.login.email.focus();
		return false;
	}
	if(document.login.password.value ==""){
		document.login.password.focus();
		return false;
	}
	
	
	$.ajax({
		type : 'post',
		data : {email:vemail},
		dataType : 'text',
		url : '/proto/emailCheck',
		
		success : function(result){
			var chk = result;
			if(chk == 0){
				$('#eck').val('true');
				$('#Message').html('<font color="#6fd5f1">사용가능한 아이디 입니다.')
			}else{
				$('#Message').html('사용 불가능한 아이디 입니다')
				$('#eck').val('false');
			}
			
		},
		error : function(xhr, status, e){
			alert(e);
		}
		
	});//ajax}	
	
	if ($('#eck').val() == "false") {
		document.register.email.focus();
		$('#Message').html('E-Mail 혹은 password를 확인해 주세요.');
		return false;
	}
	
	
}

//아이디 비밀번호 찾기
function findFunction() {
	
	var eNum = $("input[name=employeeNumber]").val();
	$.ajax({
	type : 'post',
	data : {employeeNumber:eNum},
	dataType : 'text',
	url : '/proto/find_PW',
	
	success : function(result){
		var empEmail = result;
		
		if(empEmail != null){
			$('#Message').html('<font color="#000000"> '+empEmail+' </font><font color="#9fc3f8">로 비밀번호를 전송했습니다</font>')
		}else{
			$('#Message').html('')
			
		}
		
	},
	error : function(xhr, status, e){
		alert(e);
	}
	
});//5초후 서브밋
	
	setTimeout("document.find.submit()",10000);
}











	



	


