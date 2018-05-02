<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>

<link rel="stylesheet"	href="resources/css/login.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<title>Register</title>
</head>
<body>

    <div class="wrap">
		<p class="form-title" id="signUp">Sign Up</p>
		
			
		<form class="login">
				<div class=" forgot-pass-content">
					<a href="/proto" class="sign-up">SIGN IN</a>
				</div>
				<font color="#f0f0f0" style="text-shadow:aqua 0.1em 0.1em 0.2em;">사원 정보<br></font>
                <input type="text" name="employeeNumber" placeholder="EmployeeNumber" />
              	<input type="text" name="name" id="name" placeholder="Name" />
				
				<font color="#f0f0f0" style="text-shadow:aqua 0.1em 0.1em 0.2em;">이메일 등록<br></font>
			    <input type="text" name="email" placeholder="Email" />
                <input type="password" name="password"  placeholder="Password" />
                <input type="password" name="rePassword" id="rePassword" placeholder="Password" />
         
                <input type="submit" value="Sign Up" class="btn btn-success btn-sm" />
                
         
      
        </form>
             
     </div>
              
</body>
</html>