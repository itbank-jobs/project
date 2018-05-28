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
<jsp:include page="../main_header.jsp"/>
<script src="resources/js/newsBlankCheck.js"></script>
<title>팀 게시판</title>




</head>
<body>
	<jsp:include page="../main/chatting.jsp"></jsp:include>
	<jsp:include page="../main_navigation.jsp"/>
			<br>
			<div class="container"
				style="color: #ffffff; background-color: #000000ad;">

				<div class="row">
					<div class="col-lg-3">
						<h3>공지사항</h3>
					</div>
				</div>
				<br>
				<br>
				<div class="row">
					<div class="col-lg-12">
						<form action="news_write" method="post" name="write_view"
							onsubmit="return writeSave()">
						
							<table class="table" id="table" style="color: #ffffffc8">
								<tbody>

									<tr>
										<th class="text-center">팀</th>
										<td><input type="text" id="author" name="author"
											class="form-control" placeholder="팀명을 입력하세요" style="background-color: #ffffff33;"></td>
									</tr>
									<tr>
										<th class="text-center">제목</th>
										<td><input type="text" id="title"  class="form-control"
											name="title" placeholder="제목을 입력하세요" size="50"></td>
									</tr>
									<tr>
										<th class="text-center">내용</th>
										<td><textarea name="content" id="content" class="form-control"
												rows="15" placeholder="내용을 입력하세요"></textarea></td>
									</tr>

									<tr>

										<td colspan="2" style="text-align: center">

											<div class="container-1">
												<input type="submit" value="&nbsp&nbsp&nbsp등 록 &nbsp&nbsp"
													class="btn btn-1 pull-right"
													style="background-color: transparent;" />
											</div> <a href="news"><input type="button"
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
		<jsp:include page="../main_footer.jsp"/>
</body>
</html>


