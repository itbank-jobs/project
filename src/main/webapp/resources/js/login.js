//로그인시 사원번호 비밀번호 체크
	function loginCheck() {
		var employeeNumber = $('#employeeNumber').val();
		var password = $('#password').val();
		event.preventDefault();	
		if(employeeNumber ==""){
			$('#employeeNumber').focus();
			return false;
		}
		if(password ==""){
			$('#password').focus();
			return false;
		}
		
		
		$.ajax({
			type : 'post',
			data : {employeeNumber:employeeNumber, password:password},
			dataType : 'text',
			url : '/proto/loginCheck',
			
			success : function(result){ //LoginController-> loginCheck커멘드 에서 결과 가져옴.
				var chk = result;
				if(chk == 0){
					$('#Message').html('<font color="#6fd5f1">아이디 혹은 비밀번호가 틀렸습니다.</font>');
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
