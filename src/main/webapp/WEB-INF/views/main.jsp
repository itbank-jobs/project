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
