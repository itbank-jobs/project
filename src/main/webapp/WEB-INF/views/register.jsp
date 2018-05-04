<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet"	href="resources/css/login.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="resources/js/register.js"></script>
<script src="resources/js/emailCheck.js"></script>
<script src="resources/js/encodingNum.js"></script>
<title>Register</title>

</head>
<body>

    <div class="wrap">
		<p class="form-title" id="signUp">Sign Up</p>
		
	
		<form class="login" method="post" name="register" action="registerProc" onsubmit="return inputCheck()">
			
				<div class=" forgot-pass-content">
					<a href="/proto" class="sign-up">SIGN IN</a>
				</div>
				<font color="#f0f0f0" style="text-shadow:aqua 0.1em 0.1em 0.2em; margin-bottom: 1em;">사원 정보</font>
                <input autocomplete="off"  style="ime-mode:disabled" type="text" name="employeeNumber" id="employeeNumber" placeholder="EmployeeNumber"
               	 onkeyup="encodingNum(event)"/>
              	<input autocomplete="off" type="text" name="name" id="name" placeholder="Name"  
              	 onkeyup="encodingName(event)"/>
				
				
				<font color="#f0f0f0" style="text-shadow:aqua 0.1em 0.1em 0.2em;margin-bottom: 1em;" >이메일 등록</font>
			    <br>

				<input autocomplete="off" type="text" name="email" id="email" placeholder="Email" onblur="ck()"
				 onkeyup="encodingEmail(event)">
				<label id = "eck" type="hidden" value="false"></label>
	            <input autocomplete="off" type="password" name="password" id="password" placeholder="Password" >
                <input autocomplete="off" type="password" name="rePassword" id="rePassword" onkeyup="passwordCheck()" placeholder="Password"  >
         		
         		<div id=Message style="color:red">&nbsp</div>
         		
               <input type="submit" value="Sign Up" class="btn btn-success btn-sm" >
                
         
      
        </form>
             
     </div>
              
</body>
</html>

