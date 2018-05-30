<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<!DOCTYPE>
<html>
<head>

<jsp:include page="../main_header.jsp" />
<link rel="stylesheet" href="resources/css/borderPaging.css">
<script src="resources/js/borderSearch.js"></script>
<title>팀 게시판</title>
</head>

<body>

	<jsp:include page="../main_navigation.jsp" />

	<br>
	<br>

	<div class="container"
		style="color: #ffffff; background-color: #000000ad;">

		<div class="row">
			<div class="col-lg-3">
				<h3>
		
					Chess 

				</h3>
			</div>

			<div class="col-lg-7"></div>
			<div class="col-lg-2">
				<div class="container-1">
					<a class="btn btn-1" style="margin-top: 18px;"
						href="/proto/chessresult">글 쓰기</a>
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
									onclick="location='content_view?num=${listdto.num }'">${listdto.subject }</td>
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
			
				<c:if test="${count > 1}">
					<c:set var="imsi" value="${count % pageSize == 0 ? 0 : 1}" />
					<c:set var="pageCount" value="${count / pageSize + imsi}" />
					<c:set var="pageBlock" value="${3}" />

					<fmt:parseNumber var="result" value="${currentPage/ pageBlock}"
						integerOnly="true" />

					<c:set var="startPage" value="${result * pageBlock + 1}" />
					<c:set var="endPage" value="${startPage + pageBlock - 1}" />

					<c:if test="${pageBlock < startPage}">
						<li class="active"><a
							href="list?teamNum=${teamNum}&num=${startPage - pageBlock}">이전</a></li>
					</c:if>

					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<c:if test="${endPage < pageCount+2}">
						<li><a href="list?teamNum=${teamNum}&num=${i}">${i}<span
								class="sr-only"></span></a></li></c:if>
					</c:forEach>

					<c:if test="${endPage < pageCount}">
						<li class="active"><a
							href="list?teamNum=${teamNum}&num=${startPage + pageBlock}">다음</a></li>
					</c:if>
				</c:if>
			</ul>
		</div>

	</div>
	<jsp:include page="../main/chatting.jsp"></jsp:include>
	<jsp:include page="../main_footer.jsp" />
	<script
		src="//rawgithub.com/stidges/jquery-searchable/master/dist/jquery.searchable-1.0.0.min.js"></script>
</body>
</html>


