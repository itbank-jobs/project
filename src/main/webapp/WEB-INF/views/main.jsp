<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body>
	<div class="container-fluid">
		<div class="row" style="margin-bottom: 3%;">
		
			<jsp:include page="main_header.jsp"></jsp:include>
			
			<div class="col-md-1 main-content"></div>
			<div class="col-md-6 main-content">
				<div class="span4 plan" id="notice">
					<h4 align="center">공지사항</h4>
					<ul>
						<li class="plan-feature"><a href="#">제목1</a></li>
						<li class="plan-feature"><a href="#">제목2</a></li>
						<li class="plan-feature"><a href="#">제목3</a></li>
						<li class="plan-feature"><a href="#">제목4</a></li>
						<li class="plan-feature"><a href="#">제목5</a></li>
						<li class="plan-feature"><a href="#">제목6</a></li>
						<li class="plan-feature"><a href="#">제목7</a></li>
						<li class="plan-feature"><a href="#">제목8</a></li>
					</ul>
				</div>
			</div>
		</div>

		<div class="row"
			style="margin-top: 7em; margin-left: 5%; margin-right: 5%">

			<div class="col-md-3 main-content">
				<div class="span4 plan" id="newsfeed1">
					<h4 align="center">경영지원1팀</h4>
					<ul>
						<li class="plan-feature"><a href="#">제목1</a></li>
						<li class="plan-feature"><a href="#">제목2</a></li>
						<li class="plan-feature"><a href="#">제목3</a></li>

					</ul>
				</div>

				<div class="span4 plan" id="newsfeed1">
					<h4 align="center">인사팀</h4>
					<ul>
						<li class="plan-feature"><a href="#">제목1</a></li>
						<li class="plan-feature"><a href="#">제목2</a></li>
						<li class="plan-feature"><a href="#">제목3</a></li>

					</ul>
				</div>

			</div>
			<div class="col-md-1 main-content"></div>

			<div class="col-md-3 main-content">
				<div class="span4 plan" id="newsfeed1">
					<h4 align="center">개발팀</h4>
					<ul>
						<li class="plan-feature"><a href="#">제목1</a></li>
						<li class="plan-feature"><a href="#">제목2</a></li>
						<li class="plan-feature"><a href="#">제목3</a></li>

					</ul>
				</div>

				<div class="span4 plan" id="newsfeed1">
					<h4 align="center">영업팀</h4>
					<ul>
						<li class="plan-feature"><a href="#">제목1</a></li>
						<li class="plan-feature"><a href="#">제목2</a></li>
						<li class="plan-feature"><a href="#">제목3</a></li>

					</ul>
				</div>
			</div>
		<div class="col-md-1 main-content"></div>
			<div class="col-md-4">
				<embed width="560" height="445"
					src="http://www.youtube.com/v/0XS-Q73epxs&playlist=Tf3icMKxqGQ,7jj6bf5QiKg,psETvJOBiU4"
					frameborder="0" allowfullscreen></embed>

			</div>
		</div>
	</div>

	<jsp:include page="main_footer.jsp"></jsp:include>
</body>
</html>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<!-- <link ref='http://fonts.googleapis.com/css?family=Arial'
	rel='stylesheet' type='text/css'>
<link ref='http://fonts.googleapis.com/css?family=sans-serif'
	rel='stylesheet' type="text/css">
<link ref='http://fonts.googleapis.com/css?family=Helvetica'
	rel='stylesheet' type="text/css"> -->


	
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="resources/js/calender.js"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" href="resources/css/calender.css">
<link rel="stylesheet" href="resources/css/main1.css">
<link rel="stylesheet" href="resources/css/mainNewsFeed.css">
<link rel="stylesheet" href="resources/css/mainChat.css">


<link media="all" type="text/css" rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
<link
	href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i"
	rel="stylesheet">


<title>Main</title>

<script type="text/javascript">
$(document).ready(function(){
	$('#home').click(function(){
		location.href ='main';
	});
	$('#news').click(function(){
		location.href ='news';
	});
	$('#schedule').click(function(){
		location.href ='schedule';
	});
	$('#1team').click(function(){
		location.href ='1team';
	});
	$('#2team').click(function(){
		location.href ='2team';
	});
	$('#3team').click(function(){
		location.href ='3team';
	});
	$('#4team').click(function(){
		location.href ='4team';
	});
	
	$('#messenser').click(function(){
		location.href ='messenser';
	});
	$('#about').click(function(){
		location.href ='about';
	});
	$('#settings').click(function(){
		location.href ='settings';
	});
	$('#logout').click(function(){
		location.href ='logout';
	});
	
});

	window.onload = function() {
		$('.dropdown').click(function() {
			$(this).siblings(".submenu").toggleClass('hide');

		});
	}

</script>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-3 col-sm-4 sidebar3"></div>
		</div>
		<div class="row" style="margin-bottom: 3%;">
			<div id="navigation" class=" col-sm-4 sidebar3">
				<div class="left-navigation">
					<ul>
						<li id="home"><i class="fa fa-home"   ></i>Home</li>
						

						<li id="news"><i class="fa fa-newspaper-o"   ></i>News
							<span class="activebooks pull-right">3<!--기능 만들기 새글 등록 시 ++ 클릭하면 초기화   --></span></li>
						<li id="schedule"><i class="fa fa-calendar"  ></i>Schedule</li>
						<li class="list">
							<div class="dropdown">
								<i class="fa fa-users"  ></i>Team <i
									class="fa fa-plus pull-right"  ></i>
							</div>
							<ul class="submenu hide">
								<li id="1team">경영지원팀</li>
								<li id="2team">인사팀</li>
								<li id="3team">개발팀</li>
								<li id="4team">영업팀</li>
							</ul>
						</li>
					</ul>
					<ul class="category">

						<li id="messenser"><i class="fa fa-wechat"  ></i>Messenser</li>
						<li id="about"><i class="fa fa-circle-thin"  ></i>About</li>
					</ul>
					<ul>
						<li id="settings"><i class="fa fa-cog"  ></i>Settings</li>
						<li id="logout" ><i class="fa fa-power-off"  ></i>Logout</li>
					</ul>
				</div>
			</div>
			<div class="col-md-1 main-content"></div>
			<div class="col-md-6 main-content">
				<div class="span4 plan" id="notice">
					<h4 align="center">공지사항</h4>
					<ul>
						<li class="plan-feature"><a href="#">제목1</a></li>
						<li class="plan-feature"><a href="#">제목2</a></li>
						<li class="plan-feature"><a href="#">제목3</a></li>
						<li class="plan-feature"><a href="#">제목4</a></li>
						<li class="plan-feature"><a href="#">제목5</a></li>
						<li class="plan-feature"><a href="#">제목6</a></li>
						<li class="plan-feature"><a href="#">제목7</a></li>
						<li class="plan-feature"><a href="#">제목8</a></li>
					</ul>
				</div>
			</div>
		</div>

		<div class="row"
			style="margin-top: 7em; margin-left: 5%; margin-right: 5%">

			<div class="col-md-3 main-content">
				<div class="span4 plan" id="newsfeed1">
					<h4 align="center">경영지원1팀</h4>
					<ul>
						<li class="plan-feature"><a href="#">제목1</a></li>
						<li class="plan-feature"><a href="#">제목2</a></li>
						<li class="plan-feature"><a href="#">제목3</a></li>

					</ul>
				</div>

				<div class="span4 plan" id="newsfeed1">
					<h4 align="center">인사팀</h4>
					<ul>
						<li class="plan-feature"><a href="#">제목1</a></li>
						<li class="plan-feature"><a href="#">제목2</a></li>
						<li class="plan-feature"><a href="#">제목3</a></li>

					</ul>
				</div>

			</div>
			<div class="col-md-1 main-content"></div>

			<div class="col-md-3 main-content">
				<div class="span4 plan" id="newsfeed1">
					<h4 align="center">개발팀</h4>
					<ul>
						<li class="plan-feature"><a href="#">제목1</a></li>
						<li class="plan-feature"><a href="#">제목2</a></li>
						<li class="plan-feature"><a href="#">제목3</a></li>

					</ul>
				</div>

				<div class="span4 plan" id="newsfeed1">
					<h4 align="center">영업팀</h4>
					<ul>
						<li class="plan-feature"><a href="#">제목1</a></li>
						<li class="plan-feature"><a href="#">제목2</a></li>
						<li class="plan-feature"><a href="#">제목3</a></li>

					</ul>
				</div>
			</div>


		</div>
	</div>

 	<jsp:include page="main_footer.jsp"></jsp:include>
</body>
</html>
>>>>>>> 1687a36b3a4baf6e814c321d11074e0d09846a1f
