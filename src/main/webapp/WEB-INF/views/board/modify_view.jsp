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

	$(document).ready(function() {
		$("#delete").click(function() {
			setTimeout('$("#del_ck").show(700)');

		});
		$("#no").click(function() {
			setTimeout('$("#del_ck").hide(700)');

		});
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
				<li id="home"><a href="typeB"><span class="text-white"><i
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
		</nav> <!-- down nav --> <nav class="navbar navbar-down">
		<div class="container">
			<div class="flex-container">
				<div class="navbar-header flex-item">
					<div class="navbar-brand">Project</div>
				</div>
	

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
		</nav> <br>


		<div class="container"
			style="color: #ffffff; background-color: #000000ad;">

			<div class="row" style="padding-bottom: 12px">
				<form action="modify_complete" method="post">
					<div class="col-lg-1">
						<h3 style="margin-top: 28px">&nbsp제목:</h3>

					</div>

					<div class="col-lg-5">
						<h3 style="margin-top: 20px">

							<input type="text" name="subject" class="form-control"
								value="${content.subject}" style="background-color: #ffffff33;">
						</h3>
					</div>



					<div class="col-lg-12">

						<input type="hidden" name="num" value="${content.num}"> <input
							type="hidden" name="teamNum" value="${content.teamNum}">
						<table class="table" id="table">
							<tbody>
								<tr>
									<th class="text-center">사원번호</th>
									<td><input type="text" name="employeeNumber"
										class="form-control" value="${content.employeeNumber}"
										readonly="readonly" style="background-color: #ffffff33;"></td>
								</tr>
								<tr>
									<th class="text-center">작성자</th>
									<td><input type="text" name="name" class="form-control"
										value="${content.name}" readonly="readonly"
										style="background-color: #ffffff33;"></td>
								</tr>
								<tr>
									<th class="text-center">내용</th>
									<td><textarea rows="15" name="content"
											class="form-control" style="background-color: #ffffff33;">${content.content}</textarea></td>
								</tr>
								<tr>
									<td colspan="2" style="text-align: center"><c:if
											test="${employeeNumber == content.employeeNumber}">
											<div class="container-1">
												<input type="submit" value="&nbsp&nbsp&nbsp완 료 &nbsp&nbsp"
													class="btn btn-1 pull-right"
													style="background-color: transparent;" />
											</div>
										</c:if> <a href="javascript:history.back();"> <input
											type="button" value="&nbsp&nbsp&nbsp취 소 &nbsp&nbsp"
											class="btn btn-info pull-left"
											style="background-color: transparent;" /></a> <c:if
											test="${employeeNumber == content.employeeNumber}">
											<input type="button" id="delete" value="&nbsp&nbsp&nbsp삭 제 &nbsp&nbsp"
												class="btn btn-info pull-left"
												style="background-color: transparent;" />

										</c:if>

										<div class="col-lg-6" id="del_ck"
											style="color: red; display: none;">
											게시글을 삭제 하시겠습니까 ? <a
												href="delete?num=${content.num}&teamNum=${content.teamNum}">
												<input type="button" id="yes" value="Yes"
												class="btn btn-success"
												style="background-color: transparent;" />
											</a> <input type="button" id="no" value="No"
												class="btn btn-danger"
												style="background-color: transparent;" />

										</div>
								</tr>
							</tbody>
						</table>
					</div>
				</form>
			</div>
		</div>
	</div>
		

	</nav>

	<script
		src="//rawgithub.com/stidges/jquery-searchable/master/dist/jquery.searchable-1.0.0.min.js"></script>
</body>
</html>


