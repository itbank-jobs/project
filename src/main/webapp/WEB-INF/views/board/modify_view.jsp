<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<jsp:include page="../main_header.jsp" />
<script src="resources/js/contentDeleteCheck.js"></script>

<title>팀 게시판</title>


</head>
<body>
	<jsp:include page="../main_navigation.jsp" />
	<br>
	<br>
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
								<td><textarea rows="15" name="content" class="form-control"
										style="background-color: #ffffff33;">${content.content}</textarea></td>
							</tr>
							<tr>
								<td colspan="2" style="text-align: center"><c:if
										test="${employeeNumber == content.employeeNumber}">
										<div class="container-1">
											<input type="submit" value="&nbsp&nbsp&nbsp완 료 &nbsp&nbsp"
												class="btn btn-1 pull-right"
												style="background-color: transparent;" />
										</div>
									</c:if> <a href="javascript:history.back();"> <input type="button"
										value="&nbsp&nbsp&nbsp취 소 &nbsp&nbsp"
										class="btn btn-info pull-left"
										style="background-color: transparent;" /></a> <c:if
										test="${employeeNumber == content.employeeNumber}">
										<input type="button" id="delete"
											value="&nbsp&nbsp&nbsp삭 제 &nbsp&nbsp"
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
											class="btn btn-danger" style="background-color: transparent;" />
									</div>
							</tr>
						</tbody>
					</table>
				</div>
			</form>
		</div>
	</div>
	<jsp:include page="../main/chatting.jsp"></jsp:include>
	<jsp:include page="../main_footer.jsp" />

</body>
</html>


