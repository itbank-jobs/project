﻿
function idCheck(email) {
	if (email == "") {
		document.register.email.focus();
	} else {

	}
}

function writeErr() {
	alert("로그인 후에 이용해 주세요")


	location.href = 'login';
}

function emailCheck() {
	if(${fail}){
		$('#emailMessege').html('사용중인 아이디 입니다.')
	}else if(Req_Email == null || Req_Email == ""){
		$('#emailMessege').html('')
	}else{
		$('#emailMessege').html('사용가능한 아이디 입니다.')
		
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

	var str = document.register.email.value;

	var atLastPos = str.lastIndexOf('@');
	var atPos = str.indexOf('@');
	var dotPos = str.indexOf('.');
	var commaPos = str.indexOf(',');
	var spacePos = str.indexOf(' ');
	var eMailSize = str.length;
	if (
		atPos > 1 &&
		atPos == atLastPos &&
		dotPos > 3 &&
		commaPos == -1 &&
		spacePos == -1 &&
		atPos + 1 < dotPos &&
		dotPos + 1 < eMailSize
	) {
	} else {
		alert('E-Mail 주소를 다시 확인해주세요.');
		document.register.email.focus();
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
	if (document.register.password.value != document.register.rePassword.value) {
		alert("비밀번호가 일치하지 않습니다.")
		document.register.passwd.focus();
		return;
	}
	
	

}

function writeSave() {
	if (document.write_view.title.value == "") {

		document.write_view.title.focus();
		return false;
	}
	if (document.write_view.content.value == "") {

		document.write_view.content.focus();
		return false;
	}
	if (document.write_view.passwd.value == "") {

		document.write_view.passwd.focus();
		return false;
	}

}


function deleteSave() {
	if (document.deleteForm.passwd.value == "") {
		alert("비밀번호를 입력하세요.")
		document.deleteForm.passwd.focus();
		return false;
	}
}