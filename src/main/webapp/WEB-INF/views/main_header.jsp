<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/wepmake.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/script.js"></script>



<nav class="navbar navbar-default">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="sr-only"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main"> 공부방 </a>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="list">저장소<span class="sr-only"></span></a></li>
				<li><a href="list?project">프로젝트</a></li>
				<li class="dropdown"><a href="language" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false"> 프로그래밍 언어 <span class="caret"></span>
				</a>
					<ul class="dropdown-menu">
						<li><a href="language?lectureName=Java">JAVA</a></li>
						<li><a href="language?lectureName=Jsp">JSP</a></li>
						<li><a href="language?lectureName=Android">안드로이드</a></li>
					</ul></li>
				<li><span class="list"></span><a href="serbey">설문조사</a></li>
			</ul>
			<form class="navbar-form navbar-left">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="내용을 입력하세요.">
				</div>
				<button type="submit" class="btn btn-default">검색</button>
			</form>


			<c:choose>
				<c:when test="${sessionScope.loginEmail == null}">
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false"> Log-in <span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="login">로그인</a></li>
								<li><a href="register">회원가입</a></li>
							</ul></li>
					</ul>
				</c:when>

				<c:otherwise>
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false"> ${sessionScope.loginEmail} <span
								class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="modify">정보수정</a></li>
								<li><a href="delete">회원탈퇴</a></li>
								<li><a href="logout">로그아웃</a></li>
							</ul></li>
					</ul>
				</c:otherwise>
			</c:choose>

		</div>
	</div>
</nav>