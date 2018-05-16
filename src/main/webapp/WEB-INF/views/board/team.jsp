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


			<div class="container"
				style="color: #ffffff; background-color: #000000ad;">

				<div class="row">
					<div class="col-lg-3">
						<h3>
							<c:choose>
								<c:when test="${teamNum == 1}"> 경영지원팀 </c:when>
								<c:when test="${teamNum == 2}"> 인사팀 </c:when>
								<c:when test="${teamNum == 3}"> 개발팀 </c:when>
								<c:when test="${teamNum == 4}"> 영업팀 </c:when>
							</c:choose>

						</h3>
					</div>

					<div class="col-lg-7"></div>
					<div class="col-lg-2">
						<div class="container-1">
							<a class="btn btn-1" style="margin-top: 18px;"
								href="write_jy?teamNum=${teamNum}">글 쓰기</a>
						</div>
					</div>

				</div>
				<br>

				<div class="row">
					<div class="col-lg-12">
						<input type="search" id="search" value="" class="form-control"
							placeholder="검색">
					</div>
				</div>
				<br>
				<div class="row">
					<div class="col-lg-12">
						<table class="table" id="table" style="color: #ffffff;">
							<thead>
								<tr>
									<th style="text-align: center" width="10%">번호</th>
									<th style="text-align: center" width="12%">사원번호</th>
									<th style="text-align: center" width="13%">작성자</th>
									<th style="text-align: center" width="35%">제목</th>
									<th style="text-align: center" width="20%">등록일</th>
									<th style="text-align: center" width="15%">조회</th>
								</tr>
							</thead>
							<tbody>


								<c:forEach var="listdto" items="${list}" varStatus="status">
									<tr class="a">
										<td style="text-align: center;"><c:out value="${number}" />
											<c:set var="number" value="${number-1}" /></td>
										<td style="text-align: center;">${listdto.employeeNumber }</td>
										<td style="text-align: center;">${listdto.name }</td>
										<td style="cursor: pointer"
											onclick="location='content_jy?num=${listdto.num }'">${listdto.subject }</td>
										<td style="text-align: center;">${listdto.regdate }</td>
										<td style="text-align: center;">${listdto.readcount }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>

				<div align="center">
					<ul class="pagination">

						<c:if test="${count > 0}">
							<c:set var="imsi" value="${count % pageSize == 0 ? 0 : 1}" />
							<c:set var="pageCount" value="${count / pageSize + imsi}" />
							<c:set var="pageBlock" value="${3}" />

							<fmt:parseNumber var="result" value="${currentPage/ pageBlock}"
								integerOnly="true" />

							<c:set var="startPage" value="${result * pageBlock + 1}" />
							<c:set var="endPage" value="${startPage + pageBlock - 1}" />

							<c:if test="${endPage > pageCount}">
								<li class="active"><a
									href="list?teamNum=${teamNum}&num=${startPage - pageBlock}">이전</a></li>
							</c:if>

							<c:forEach var="i" begin="${1}" end="${count / pageSize + imsi}">
								<li><a href="list?teamNum=${teamNum}&num=${i}">${i}<span
										class="sr-only"></span></a></li>
							</c:forEach>

							<c:if test="${endPage < pageCount}">
								<li class="active"><a
									href="list?teamNum=${teamNum}&num=${startPage + pageBlock}">다음</a></li>
							</c:if>

						</c:if>
					</ul>
				</div>

			</div>
	</div>
	</nav>


	<script
		src="//rawgithub.com/stidges/jquery-searchable/master/dist/jquery.searchable-1.0.0.min.js"></script>
</body>
</html>


