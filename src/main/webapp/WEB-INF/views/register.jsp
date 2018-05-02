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

    <div class="wrap">
		<p class="form-title" id="signUp">Sign Up</p>
		
			
		<form class="login" method="post" name="register" action="/proto" onsubmit="return inputCheck()">
			<input type="hidden" id=emailCheck_result value="${emailCheck_result}">
				<div class=" forgot-pass-content">
					<a href="/proto" class="sign-up">SIGN IN</a>
				</div>
				<font color="#f0f0f0" style="text-shadow:aqua 0.1em 0.1em 0.2em; margin-bottom: 1em;">사원 정보</font>
                <input autocomplete="off" type="text" name="employeeNumber" id="employeeNumber" placeholder="EmployeeNumber" />
              	<input autocomplete="off" type="text" name="name" id="name" placeholder="Name" />
				
				
				<font color="#f0f0f0" style="text-shadow:aqua 0.1em 0.1em 0.2em;margin-bottom: 1em;">이메일 등록</font>
			   <br>
			<!--    <div style="font-size:80%; margin-top:10px ;" align="right" id="emailMessege"> dfsdf
			   </div>
 -->			<input style="width:78%" type="text" name="email" id="email" placeholder="Email">
			    <input id="emailMessege" class="btn btn-sm" onclick="emailCheck()" type="button" value="중복확인">  </button>
			    
			    
			    
                <input autocomplete="off" type="password" name="password" id="password" onkeyup="passwordCheck()"  placeholder="Password" >
                <input autocomplete="off" type="password" name="rePassword" id="rePassword" onkeyup="passwordCheck()" placeholder="Password" >
         		
         		<div id=passwordMessege style="font:bold; color:red" > &nbsp</div>
         		
               <input type="submit" value="Sign Up" class="btn btn-success btn-sm">
                
         
      
        </form>
             
     </div>
              
</body>
</html>