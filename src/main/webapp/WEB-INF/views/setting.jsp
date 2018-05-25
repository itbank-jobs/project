<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<!DOCTYPE>
<html>
<head>
<link rel="stylesheet" href="resources/css/login.css">
<jsp:include page="main_header.jsp" />
<script src="resources/js/encoding.js"></script>
<script src="resources/js/register.js"></script>
<script src="resources/js/emailCheck.js"></script>


<title>사원 정보</title>

</head>
<body>

	<jsp:include page="main_navigation.jsp" />
	<br>
	<br>
	<div class="container" style="color: #ffffff;">

		<div id="setBg" class="row"
			style="margin-left: 25%; margin-right: 25%; margin-top: 7%;">
			<p class="form-title" id="signUp"
				style="margin-top: 25px; margin-bottom: 17px">사원 정보</p>

			<form class="login" method="post" name="register"
				action="info_modify" onsubmit="return inputCheck()">

				<input autocomplete="off" type="text" maxlength="8"
					placeholder="EmployeeNumber" onkeydown="encodingNum()"
					onblur="encodingNum()" id="employeeNumber" name="employeeNumber"
					value="${setting.employeeNumber}" readonly="readonly"> <input
					autocomplete="off" type="text" maxlength="5" name="name" id="name"
					placeholder="Name" onkeyup="encodingName(event)"
					value="${setting.name}" /> <input autocomplete="off" type="text"
					name="email" id="email" placeholder="Email" onblur="ck()"
					onkeyup="encodingEmail(event)" value="${setting.email}"> <label
					id="eck" type="hidden" value="false"></label> <input
					autocomplete="off" type="password" maxlength="15" name="password"
					id="password" placeholder="Password"> <input
					autocomplete="off" type="password" maxlength="15" name="rePassword"
					id="rePassword" onkeyup="passwordCheck()" placeholder="Password">



				<div id=Message style="color: red">&nbsp</div>


				<input type="submit" value="회원 정보 수정" style="width: 94%;" class="btn btn-1 btn-success">

				<div class="remember-forgot">
					<div class="row">
						<div class=" forgot-pass-content"></div>
					</div>
				</div>
			</form>
		</div>
		<br>
	</div>
	<jsp:include page="main/chatting.jsp"></jsp:include>
	<jsp:include page="main_footer.jsp" />

	<script
		src="//rawgithub.com/stidges/jquery-searchable/master/dist/jquery.searchable-1.0.0.min.js"></script>
</body>
</html>


