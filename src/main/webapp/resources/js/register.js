﻿


function passwordCheck() {
	var pw1 = $('#password').val();
	var pw2 = $('#rePassword').val();

	if( pw1 == pw2){
		$('#Message').html('<font color="#9ec3f7">비밀번호가 일치 합니다</font>')
	}else{
		$('#Message').html('비밀번호가 일치하지 않습니다.')
	}
	
	if(pw2 == null || pw2 == ""){
		$('#Message').html('')
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
				$('#Message').html('<font color="#9ec3f7">사용가능한 E-Mail 입니다.')
			}else{
				$('#Message').html('사용 중인 E-Mail 입니다')
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


