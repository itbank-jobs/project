<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="UTF-8">
<title>full page, one page scroll event</title>

<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/base.css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/jquery.easings.min.js"></script>

<script>
	$(document).ready(function() {
		pagefull();
		nav_li();
	});

	function pagefull() {
		var winheight = $(window).height();
		$(".section").height(winheight);

		// 페이지에 따른 gnb 생성
		var pageindex = $("#fullpage > div").size();
		$("#fullpage").prepend("<div class='gnb'><ul>");
		for (var i = 1; i <= pageindex; i++) {
			$("#fullpage > .gnb > ul")
					.append("<li><span>" + i + "</span></li>");
		}
		$("#fullpage .gnb li:first-child").addClass("on");
	}

	// gnb 클릭시 페이지 이동
	function nav_li() {
		var winheight = $(window).height();

		$(".gnb li").click(function() {
			var gnbindex = $(this).index();
			if ($("body").find("#fullpage:animated").length >= 1)
				return false;
			$(this).addClass("on").siblings("li").removeClass("on");
			$("#fullpage").animate({
				"top" : -winheight * gnbindex + "px"
			}, 800, "swing");
			return false;
		});
	}
</script>

<style>
#fullpage {
	position: absolute;
	top: 0px;
	z-index: 9;
	width: 100%;
}

.section {
	width: 100%;
	height: 100%;
}

.gnb {
	position: fixed;
	right: 10px;
	top: 50%;
	z-index: 10;
}

.gnb li {
	margin-bottom: 10px;
	width: 10px;
	height: 10px;
	border-radius: 15px;
	text-align: center;
	border: 2px solid #fff;
	cursor: pointer;
}

.gnb li span {
	display: inline-block;
	width: 6px;
	height: 6px;
	margin-top: 2px;
	border-radius: 15px;
	text-indent: -9999em;
}

.gnb li.on span {
	background: #fff00000;
}
</style>
<link media="all" type="text/css" rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
<link
	href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i"
	rel="stylesheet">
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" href="resources/css/main1.css">
<link rel="stylesheet" href="resources/css/mainNewsFeed.css">

<script type="text/javascript">
(function($, undefined) {

});



$(document).ready(function() {
		$('#home').click(function() {
			location.href = 'test';
		});
		$('#news').click(function() {
			location.href = 'news';
		});
		$('#1team').click(function() {
			location.href = 'team?home=1';
		});
		$('#2team').click(function() {
			location.href = 'team?home=2';
		});
		$('#3team').click(function() {
			location.href = 'team?home=3';
		});
		$('#4team').click(function() {
			location.href = 'team?home=4';
		});
		$('#messenser').click(function() {
			location.href = 'messenser';
		});
		$('#about').click(function() {
			location.href = 'about';
		});
		$('#settings').click(function() {
			location.href = 'settings';
		});
		$('#logout').click(function() {
			location.href = 'logout';
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
	<div id="fullpage">
		<div class="section s01">
		
			<div class="container-fluid">
				<div class="row" style="margin-bottom: 3%;">
					<div id="navigation" class=" col-md-3 sidebar3">

						<ul>
							<li id="home"><i class="fa fa-home"></i>Home</li>


							<li id="news"><i class="fa fa-newspaper-o"></i>News <span
								class="activebooks pull-right">3<!--기능 만들기 새글 등록 시 ++ 클릭하면 초기화   --></span></li>
							<li class="list">
								<div class="dropdown">
									<i class="fa fa-users"></i>Team <i
										class="fa fa-plus pull-right"></i>
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
		</div>
		<div class="section s02">2</div>
		<div class="section s03">3</div>
		<div class="section s04">4</div>
	</div>
</body>
</html>