<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link media="all" type="text/css" rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
<link
	href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i"
	rel="stylesheet">
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" href="resources/css/main1.css">
<link rel="stylesheet" href="resources/css/mainChat.css">
<link rel="stylesheet" href="resources/css/mainNewsFeed.css">

<script src="resources/js/main_header.js"></script>

</head>
<body>
<body>
	<div class="container-fluid">
		<div class="row" style="margin-bottom: 3%;">
			<div id="navigation" class=" col-md-3 sidebar3">
			
					<ul>
						<li id="home"><i class="fa fa-home"></i>Home</li>


						<li id="news"><i class="fa fa-newspaper-o"></i>News <span
							class="activebooks pull-right">3<!--기능 만들기 새글 등록 시 ++ 클릭하면 초기화   --></span></li>
						<li class="list">
							<div class="dropdown">
								<i class="fa fa-users"></i>Team <i class="fa fa-plus pull-right"></i>
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

						<li id="messenser"><i class="fa fa-wechat"></i>Messenser</li>
						<li id="about"><i class="fa fa-circle-thin"></i>About</li>
					</ul>
					<ul>
						<li id="settings"><i class="fa fa-cog"></i>Settings</li>
						<li id="logout"><i class="fa fa-power-off"></i>Logout</li>
					</ul>
	
			</div>
			<div class="col-md-9">
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
		<div class="col-md-1 main-content"></div>

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

	<jsp:include page="../main_footer.jsp"></jsp:include>
</body>
</html>