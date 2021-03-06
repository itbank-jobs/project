<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:include page="../main_header.jsp" />
<title>팀 게시판</title>
<script src="resources/js/borderBlankCheck.js"></script>
</head>
<body>

	<jsp:include page="../main_navigation.jsp" />
	<br>
	<br>


	<div class="container"
		style="color: #ffffff; background-color: #000000ad;">

		<div class="row">
			<div class="col-lg-3">
				<h3>글 작성</h3>
			</div>
		</div>
		<br>
		<div class="row">
			<div class="col-lg-12">
				<form action="write" method="post" name="write_view"
					onsubmit="return writeSave()">
					<input type="hidden" name="teamNum" value="${teamNum}">
					<table class="table" id="table" style="color: #ffffffc8">
						<tbody>

							<tr>
								<th class="text-center">사원번호</th>
								<td><input type="text" name="employeeNumber"
									class="form-control" value="${employeeNumber}"
									readonly="readonly" style="background-color: #ffffff33;"></td>
							</tr>
							<tr>
								<th class="text-center">제목</th>
								<td><input type="text" class="form-control" name="subject"
									size="50"></td>
							</tr>
							<tr>
								<th class="text-center">내용</th>
								<td><textarea name="content" class="form-control" rows="15"></textarea></td>
							</tr>

							<tr>

								<td colspan="2" style="text-align: center">

									<div class="container-1">
										<input type="submit" value="&nbsp&nbsp&nbsp등 록 &nbsp&nbsp"
											class="btn btn-1 pull-right"
											style="background-color: transparent;" />
									</div> <a href="list?teamNum=${teamNum}"><input type="button"
										value="&nbsp&nbsp&nbsp목 록 &nbsp&nbsp"
										class="btn btn-info pull-left"
										style="background-color: transparent;" /></a>
							</tr>

						</tbody>
					</table>
				</form>
			</div>
		</div>
	</div>
	<jsp:include page="../main/chatting.jsp"></jsp:include>
	<jsp:include page="../main_footer.jsp" />
</body>
</html>


