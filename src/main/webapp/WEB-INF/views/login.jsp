<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>


<html>
<head>

<link rel="stylesheet" href="resources/css/login.css">

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="resources/js/login.js"></script>
<script src="resources/js/encoding.js"></script>
<title>Login</title>


</head>

<body>
	
	<div class="wrap">
		<p class="form-title" id="signUp">Sign In</p>

		<form class="login" name="login" action = "main" onsubmit="loginCheck()">
			<div class=" forgot-pass-content">
				<a href="register" class="sign-up">SIGN UP</a>
			</div>
			<input autocomplete="off" type="text" placeholder="EmployeeNumber" onkeydown="encodingNum()" onblur="encodingNum()" id = "employeeNumber" > 
			<input type="password" placeholder="Password" autocomplete="new-password" id = "password">
			
			<div id = "Message">&nbsp</div>
			<input type="submit" value="SIGN IN" class="btn btn-success btn-sm">
			<div class="remember-forgot">
				<div class="row">
					<div class=" forgot-pass-content">
						<a href="find" class="forgot-pass">Forgot Password</a>
					</div>
				</div>
			</div>
		</form>
	</div>
	
</body>
</html>