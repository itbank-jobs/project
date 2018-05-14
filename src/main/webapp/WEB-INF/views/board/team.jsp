<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>

<link media="all" type="text/css" rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">

<link rel="stylesheet" href="resources/css/main.css">



<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>팀 게시판</title>

<style type="text/css">
::-webkit-scrollbar {
	display: none;
}

.row-padding {
	margin-top: 25px;
	margin-bottom: 25px;
}

body {
	background-color: #ffffff33;
}

.form-control {
	background-color: #ffffff33;
	color: #8bd8c0;
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

	var h = false;
	var n = false;
	var t = false;
	$(document).ready(function() {
		$("#home").click(function() {
			h = true;
			if (h) {
				setTimeout('$("#h").toggle(700)', '700');
				h = true;
				if (n) {
					$("#n").toggle(1000);
					n = false;
				}
				if (t) {
					$("#t").toggle(1000);
					t = false;
				}
			}
		});
		$("#new").click(function() {
			n = true;
			if (n) {
				setTimeout('$("#n").toggle(700)', '700');
				n = true;
				if (h) {
					$("#h").toggle(1000);
					h = false;
				}
				if (t) {
					$("#t").toggle(1000);
					t = false;
				}
			}
		});
		$("#team").click(function() {
			t = true;
			if (t) {
				setTimeout('$("#t").toggle(700)', '700');
				t = true;
				if (n) {
					$("#n").toggle(1000);
					n = false;
				}
				if (h) {
					$("#h").toggle(1000);
					h = false;
				}
			}
		});

	});

	$(function() {
		$('#table').searchable({
			striped : true,
			oddRow : {
				'background-color' : '#f5f5f533'
			},
			evenRow : {
				'background-color' : '#ffffff33'
			},
			searchType : 'fuzzy'
		});

		$('#searchable-container').searchable({
			searchField : '#container-search',
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
		<!-- top nav --> <nav class="navbar navbar-top hidden-xs">
		<div class="container">
			<!-- left nav top -->
			<ul class="nav navbar-nav pull-left">
				<li id="home"><a href="#"><span class="text-white"><i
							class="fa fa-home"></i>Home</span></a></li>
				<li id="new"><a href="#"><span class="text-white">New</span></a></li>
				<li id="team"><a href="#"><span class="text-white">Team</span></a></li>

			</ul>
			<!-- right nav top -->
			<ul class="nav navbar-nav pull-right">
				<li><a href="#" class="text-white">Settings</a></li>
				<li><a href="#" class="text-white">Logout</a></li>
			</ul>
		</div>
		<div class="dividline light-grey"></div>
		</nav> <!-- down nav --> <nav class="navbar navbar-down">
		<div class="container">
			<div class="flex-container">
				<div class="navbar-header flex-item">
					<div class="navbar-brand">Project</div>
				</div>
				<ul id="h" class="nav navbar-nav flex-item hidden-xs"
					style="display: none;">
					<li><a href="view">Type - A</a></li>
					<li><a href="#">Type - B</a></li>

				</ul>

				<ul id="n" class="nav navbar-nav flex-item hidden-xs"
					style="display: none;">
					<li><a href="#">공지사항</a></li>
					<li><a href="#">행사</a></li>

				</ul>

				<ul id="t" class="nav navbar-nav flex-item hidden-xs"
					style="display: none;">
					<li><a href="#">경영지원팀</a></li>
					<li><a href="#">인사팀</a></li>
					<li><a href="#">개발팀</a></li>
					<li><a href="#">영업팀</a></li>
				</ul>
				<ul class="nav navbar-nav flex-item hidden-xs pull-right">
					<li><a href="#">Messenser</a></li>
				</ul>
			</div>
		</div>
		<br>
		</nav> <br>
	

		<div class="container"
			style="background-color: #00000066; color: #ffffff;">
			<div class="row">
				<div class="col-lg-12">
					<h3>${listdto.team}[예제] 경영지원팀</</h3>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<input type="search" id="search" value="" class="form-control"
						placeholder="검색">
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<table class="table" id="table">
						<thead>
							<tr style="text-align: center">
								<th>번호</th>
								<th>사원번호</th>
								<th>작성자</th>
								<th>제목</th>
								<th>등록일</th>
								<th>조회</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="listdto" items="${list}" varStatus="status">
								<tr>
									<td>${fn:length(list)-status.count+1}</td>
									<td>${listdto.employeeNumber }</td>
									<td>${listdto.name }</td>
									<td style="cursor:pointer"  onclick="location='content?num=${listdto.num }'">${listdto.subject }</a></td>
									<td>${listdto.regdate }</td>
									<td>${listdto.readcount }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

	</nav>
	<!--bg img  -->
	<header> <img
		src="https://d2lm6fxwu08ot6.cloudfront.net/img-thumbs/960w/J70T3LHQ2O.jpg"
		style="width: 100%"> </header>

	<script
		src="//rawgithub.com/stidges/jquery-searchable/master/dist/jquery.searchable-1.0.0.min.js"></script>
</body>
</html>


