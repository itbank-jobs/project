


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





















































































//로그인 아이디 비밀번호 체크
/*$(document).ready(function(){
$('#submit').click(function(event){
	var email = $('#email').val();
	var password = $('#password').val();
	event.preventDefault();	
	if(email ==""){
		$('#email').focus();
		return false;
	}
	if(password ==""){
		$('#password').focus();
		return false;
	}
	
	
	$.ajax({
		type : 'post',
		data : {email:email, password:password},
		dataType : 'text',
		url : '/proto/loginCheck',
		
		success : function(result){ //MainController-> loginCheck커멘드 에서 결과 가져옴.
			var chk = result;
			if(chk == 0){
				$('#Message').html('<font color="#6fd5f1">아이디 혹은 비밀번호가 틀렸습니다.');
				return false;
			}
			else{
				document.main.submit();
				return true;
				}
			
		},
		error : function(xhr, status, e){
			alert(e);
		}
		
	});//ajax}	
		
});	

});	
*/

//로그인 아이디 비밀번호 체크
	function loginCheck() {
		var email = $('#email').val();
		var password = $('#password').val();
		event.preventDefault();	
		if(email ==""){
			$('#email').focus();
			return false;
		}
		if(password ==""){
			$('#password').focus();
			return false;
		}
		
		
		$.ajax({
			type : 'post',
			data : {email:email, password:password},
			dataType : 'text',
			url : '/proto/loginCheck',
			
			success : function(result){ //MainController-> loginCheck커멘드 에서 결과 가져옴.
				var chk = result;
				if(chk == 0){
					$('#Message').html('<font color="#6fd5f1">아이디 혹은 비밀번호가 틀렸습니다.');
					return false;
				}
				else{
				
					document.login.submit();
					}
				
			},
			error : function(xhr, status, e){
				alert(e);
			}
			
		});//ajax}	
		

	};	



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

	
	


