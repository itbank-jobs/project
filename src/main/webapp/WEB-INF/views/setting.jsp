<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">

<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>

<link media="all" type="text/css" rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">

<link rel="stylesheet" href="resources/css/main.css">
<link rel="stylesheet" href="resources/css/login.css">
<script src="resources/js/encoding.js"></script>
<script src="resources/js/register.js"></script>
<script src="resources/js/emailCheck.js"></script>

<script src="resources/js/employeeNumberCheck.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>팀 게시판</title>


<style type="text/css">
::-webkit-scrollbar {
	display: none;
}

/* 페이징  */
.pagination>.active>a {
	background-color: #00000000;
}

.pagination>.active>a:hover {
	background-color: #00000000;
}

.pagination>li>a {
	background-color: #fff0;
	color: #00ff39
}

.pagination>li>a:hover {
	background-color: #fff0;
}

.row-padding {
	margin-top: 25px;
	margin-bottom: 25px;
}

body {
	background: url('../../../proto/resources/images/background.jpg') fixed;
	background-size: cover;
	background-repeat: no-repeat;
	padding: 0;
	margin: 0;
	background-repeat: no-repeat;
	height: 130vh;
}

.form-control {
	background-color: #ffffff33;
	color: #8bd8c0;
}

form:hover {
	background-color: #1c202900;
}
</style>
<script type="text/javascript">
	//toggle class scroll 
	$(window).scroll(function() {
		if ($(this).scrollTop() > 200) {
			$('.navbar-trans').addClass('afterscroll');
		} else {
			$('.navbar-trans').removeClass('afterscroll');
		}

	});

	// demo only 
	// open link in new tab without ugly target="_blank"
	$("a[href^='http']").attr("target", "_blank");

	$(document).ready(function() {
		$("#home").click(function() {
			setTimeout('$("#h").toggle(700)', '700');
			$("#n").hide(1000);
			$("#t").hide(1000);
		});
		$("#new").click(function() {
			setTimeout('$("#n").toggle(700)', '700');
			$("#h").hide(1000);
			$("#t").hide(1000);
		});
		$("#team").click(function() {
			setTimeout('$("#t").toggle(700)', '700');
			$("#n").hide(1000);
			$("#h").hide(1000);
		});
	});

	$(function() {
		$('#table').searchable({
			striped : true
		});

		$('#search').searchable({
			searchField : '#table',
			selector : '.row',
			childSelector : '.col-xs-4',
			show : function(elem) {
				elem.slideDown(100);
			},
			hide : function(elem) {
				elem.slideUp(100);
			}
		})
	});
</script>


</head>
<body>
	<div style="-ms-overflow-style: none;">
		<!--스크롤바 없이 스크롤 가능하게 함   -->

		<nav
			class="navbar navbar-default navbar-doublerow navbar-trans navbar-fixed-top">
			<!-- top nav -->
			<nav class="navbar navbar-top hidden-xs">
				<div class="container">
					<!-- left nav top -->
					<ul class="nav navbar-nav pull-left">
						<li id="home"><a href="#"><span class="text-white"><i
									class="fa fa-home"></i>&nbspHome</span></a></li>
						<li id="new"><a href="#"><span class="text-white"><i
									class="fa fa-newspaper-o"></i>&nbsp New</span></a></li>
						<li id="team"><a href="#"><span class="text-white"><i
									class="fa fa-users"></i>&nbsp Team</span></a></li>
					</ul>
					<!-- right nav top -->
					<ul class="nav navbar-nav pull-right">
						<li><a href="settings" class="text-white"><i
								class="fa fa-cog"></i>&nbspSettings</a></li>
						<li><a href="logout" class="text-white"><i
								class="fa fa-power-off"></i>&nbspLogout</a></li>
					</ul>
				</div>
				<div class="dividline light-grey"></div>
			</nav>
			<!-- down nav -->
			<nav class="navbar navbar-down">
				<div class="container">
					<div class="flex-container">
						<div class="navbar-header flex-item">
							<div class="navbar-brand">Project</div>
						</div>
						<ul id="h" class="nav navbar-nav flex-item hidden-xs"
							style="display: none;">
							<li><a href="typeA">Type - A</a></li>
							<li><a href="typeB">Type - B</a></li>

						</ul>

						<ul id="n" class="nav navbar-nav flex-item hidden-xs"
							style="display: none;">
							<li><a href="news">공지사항</a></li>
							<li><a href="event">행사</a></li>

						</ul>

						<ul id="t" class="nav navbar-nav flex-item hidden-xs"
							style="display: none;">
							<li><a href="list?teamNum=1">경영지원팀</a></li>
							<li><a href="list?teamNum=2">인사팀</a></li>
							<li><a href="list?teamNum=3">개발팀</a></li>
							<li><a href="list?teamNum=4">영업팀</a></li>
						</ul>
						<ul class="nav navbar-nav flex-item hidden-xs pull-right">
							<li><a href="messenser"><span class="text-white"><i
										class="fa fa-wechat"></i>&nbsp Messenser</span></a></li>
						</ul>
					</div>
				</div>
				<br>
			</nav>

			<br>


			<div class="container" style="color: #ffffff;">

				<div class="row"
					style="margin-left: 300px; margin-right: 300px; margin-top: 7%; background-color: #000000ad ">
					<p class="form-title" id="signUp" style="margin-top: 25px; margin-bottom: 17px">사원
						정보</p>
						
						<form class="login" method="post" name="register" action="info_modify" onsubmit="return inputCheck()">

						<input autocomplete="off" type="text" maxlength="8"
							placeholder="EmployeeNumber" onkeydown="encodingNum()"
							onblur="encodingNum()" id="employeeNumber" name="employeeNumber" value="${setting.employeeNumber}" readonly="readonly">
							
							
							 <input
							autocomplete="off" type="text" maxlength="5" name="name"
							id="name" placeholder="Name" onkeyup="encodingName(event)" value="${setting.name}"/> 
							
							<input
							autocomplete="off" type="text" name="email" id="email"
							placeholder="Email" onblur="ck()" onkeyup="encodingEmail(event)" value="${setting.email}">


							<label id = "eck" type="hidden" value="false"></label>
	         			  <input autocomplete="off" type="password" maxlength="15" name="password" id="password" placeholder="Password" >
             			  <input autocomplete="off" type="password" maxlength="15" name="rePassword" id="rePassword" onkeyup="passwordCheck()" placeholder="Password"  >
							
							

						<div id=Message style="color: red">&nbsp</div>


						<input type="submit" value="회원 정보 수정"
							class="btn btn-1 btn-success">
							
						<div class="remember-forgot">
							<div class="row">
								<div class=" forgot-pass-content">
								
								</div>
							</div>
						</div>
					</form>













				</div>
				<br>



			</div>
		</nav>
	</div>



	<script
		src="//rawgithub.com/stidges/jquery-searchable/master/dist/jquery.searchable-1.0.0.min.js"></script>
</body>
</html>


