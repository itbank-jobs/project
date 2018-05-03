<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet"	href="resources/css/login.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="resources/js/script.js"></script>
<title>Register</title>

</head>
<body>

    <div class="wrap">
		<p class="form-title" id="signUp">Sign Up</p>
		
	
		<form class="login" method="post" name="register" action="/proto" onsubmit="return inputCheck()">
			<input type="hidden" id=emailCheck_result value="${emailCheck_result}">
				<div class=" forgot-pass-content">
					<a href="/proto" class="sign-up">SIGN IN</a>
				</div>
				<font color="#f0f0f0" style="text-shadow:aqua 0.1em 0.1em 0.2em; margin-bottom: 1em;">사원 정보</font>
                <input autocomplete="off" type="text" name="employeeNumber" id="employeeNumber" placeholder="EmployeeNumber"  />
              	<input autocomplete="off" type="text" name="name" id="name" placeholder="Name"  />
				
				
				<font color="#f0f0f0" style="text-shadow:aqua 0.1em 0.1em 0.2em;margin-bottom: 1em;" >이메일 등록</font>
			    <br>

				<input autocomplete="off" type="text" name="email" id="email" placeholder="Email" onblur="ck()" >
				<label id = "eck" type="hidden" value="false"></label>
                <input autocomplete="off" type="password" name="password" id="password" placeholder="Password" >
                <input autocomplete="off" type="password" name="rePassword" id="rePassword" onkeyup="passwordCheck()" placeholder="Password"  >
         		
         		<div id=passwordMessege style="font:bold; color:red" > &nbsp</div>
         		
               <input type="submit" value="Sign Up" class="btn btn-success btn-sm" >
                
         
      
        </form>
<<<<<<< HEAD
             
     </div>
              
</body>
</html>
 --%>
=======
       </div>
>>>>>>> branch 'master' of https://github.com/itbank-jobs/project

<<<<<<< HEAD



<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet"	href="resources/css/login.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="resources/js/script.js"></script>
<title>Register</title>

</head>
<body>
<script type="text/javascript">
$(document).ready(function(){
$('#emailCheck').click(function() {
	var vemail = $('#email').val();
	
	
	if($('#email').val() == ''){
		alert("email을 입력해주세요");
	
	}else{
	
	$.ajax({
		type : 'post',
		data : {email:vemail},
		dataType : 'text',
		url : '/proto/emailCheck',
		
		success : function(result){
			var chk = result;
			if(chk == 0){
				alert("등록가능한 이메일 주소입니다.");
				$(possibleEmail).html(vemail + '는 사용할수 있는 email 입니다.');
				
			}else{
				alert("중복된 이메일 주소입니다.");
				$(possibleEmail).html(vemail + '은 이미 존재하는 email 입니다.')
			}
			
		},
		error : function(xhr, status, e){
			alert(e);
		}
		
	});//ajax
	}
});//function
});
	

</script>
    <div class="wrap">
		<p class="form-title" id="signUp">Sign Up</p>
		
			
		<form class="login" method="post" name="register" action="/registerProc" onsubmit="return inputCheck()">
				<div class=" forgot-pass-content">
					<a href="/proto" class="sign-up">SIGN IN</a>
				</div>
				<font color="#f0f0f0" style="text-shadow:aqua 0.1em 0.1em 0.2em; margin-bottom: 1em;">사원 정보</font>
                <input type="text" name="employeeNumber" id="employeeNumber" placeholder="EmployeeNumber" />
              	<input type="text" name="name" id="name" placeholder="Name" />
				
				
				<font color="#f0f0f0" style="text-shadow:aqua 0.1em 0.1em 0.2em;margin-bottom: 1em;">이메일 등록</font>
			   <br>
			<!--    <div style="font-size:80%; margin-top:10px ;" align="right" id="emailMessege"> dfsdf
			   </div>
 -->			    <input style="width:78%" type="text" name="email" id="email" placeholder="Email">
			    <button id="emailCheck" class="btn btn-sm" type="button"> 중복확인 </button>
			    <div id = "possibleEmail"></div>
			  
			    
			    
                <input type="password" name="password" id="password"  placeholder="Password" >
                <input type="password" name="rePassword" id="rePassword" placeholder="Password" >
         
               <input type="submit" value="Sign Up" class="btn btn-success btn-sm">
                
         
      
        </form>
             
     </div>
=======
>>>>>>> branch 'master' of https://github.com/itbank-jobs/project
              
</body>
</html>

