<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>


<html>
<head>

<link rel="stylesheet" href="resources/css/login.css">

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="resources/js/script.js"></script>
<title>Forgot Password</title>


</head>

<body>

	<div class="wrap">
		<p class="form-title" id="signUp">Find</p>

		<form class="login" action ="find_PW">
			<div class=" forgot-pass-content">
				<a href="login" class="sign-up">SIGN IN</a>
			</div>
			<input type="text" placeholder="EmployeeNumber" autocomplete="new-password" name = "employeeNumber">
			<div id = "Message">&nbsp</div>
			
			<input type="submit" value="Find" class="btn btn-success btn-sm" >
			
		</form>
	</div>

</body>
</html>