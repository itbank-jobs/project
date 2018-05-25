<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="../main_header.jsp" />
<script src="resources/js/reply.js"></script>
<script src="resources/js/contentDeleteCheck.js"></script>
<title>내용</title>

<script type="text/javascript">
	
</script>


</head>
<body style="overflow: auto;">
	<jsp:include page="../main_navigation.jsp" />
	<br>
	<br>
	<div class="container"
		style="color: #ffffff; background-color: #000000ad; overflow: auto; height: 710px;">

		<div class="row" style="padding-bottom: 12px">
			<div class="col-lg-12" style="text-align: center;">
				<h3 style="margin-top: 28px">${content.subject}</h3>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<form action="modify_view" method="post">
					<input type="hidden" name="num" id="num" value="${content.num}">
					<input type="hidden" name="teamNum" value="${teamNum}">
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
										readonly="readonly" style="background-color: #ffffff33;">${content.content}</textarea></td>
							</tr>
							<tr>
								<td colspan="2"
									style="text-align: center; margin-bottom: -13px;"><c:if
										test="${employeeNumber == content.employeeNumber}">
										<div class="container-1">
											<input type="submit" value="&nbsp&nbsp&nbsp수 정 &nbsp&nbsp"
												class="btn btn-1 pull-right"
												style="background-color: transparent;" />
										</div>
									</c:if> <a href="list?teamNum=${content.teamNum}"> <input
										type="button" value="&nbsp&nbsp&nbsp목 록 &nbsp&nbsp"
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
				</form>

			</div>
		</div>

		<div class="row">
			<div class="col-lg-12" style="margin-bottom: -12px">
				<table class="table">
					<tbody>
						<tr>
							<th><textarea rows="3" cols="100" placeholder="댓글을 입력하세요"
									id=replytext name="replytext" class="form-control"
									style="background-color: #ffffff33; margin-top: 9px"></textarea></th>
							<th><input type="button" value="댓글달기" class="btn btn-danger"
								id="registerReply"
								style="background-color: transparent; margin-right: -18px; margin-top: 10px; border-radius: 10px; padding: 25px 50px">
							</th>
						</tr>
					</tbody>
				</table>

			</div>
			<table id="Y">
				<c:forEach var="replylist" items="${reply}">
					<td colspan="2"><hr></td>
					<tr style="padding: 5px;">
						<td style="padding: 3px; padding-left: 40px;" width="90%">
							${replylist.name } <font size="1px">${replylist.regdate}</font>
						</td>

						<td rowspan="2" width="10%"><c:if
								test="${employeeNumber == replylist.employeeNumber}">

								<button type="button" class="deleteReply btn btn-warning"
									style="background-color: transparent;" id="${replylist.rnum}">삭제</button>

							</c:if></td>
					</tr>
					<tr>
						<td style="padding-left: 40px; width: 970px">내용 :
							${replylist.replytext}</td>
					</tr>
					<td colspan="2"><hr></td>
				</c:forEach>
			</table>
		</div>
	</div>
	<jsp:include page="../main/chatting.jsp"></jsp:include>
	<jsp:include page="../main_footer.jsp" />

</body>
</html>


