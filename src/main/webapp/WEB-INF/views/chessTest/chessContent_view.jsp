<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:include page="../main_header.jsp" />
<style>

</style>
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
								<th class="text-center-chess">제목</th>
								<td><input type="text" class="form-control" name="subject"
									size="50"></td>
							</tr>
							<tr>
								<th class="text-center">내용</th>
		<td>
	<div class="reChessTable">
<div id="reChessboard">
		<c:forEach begin="0" end="7" varStatus="i">
				<c:forEach begin="0" end="7" varStatus="j">
					<div id="re${i.count}${j.count}" <c:choose><c:when test="${(i.count+j.count)%2==1}"> class="reChess red"</c:when>
					<c:otherwise>class="reChess"</c:otherwise> 
				</c:choose>><img src = " "></div>
				</c:forEach>
		</c:forEach>
	</div>
</div>
<div class = "reResult"></div>
	</td>
	
								<!-- <th><textarea name="content" class="form-control" rows="15"></textarea></th> -->
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
	<script type="text/javascript">
	$(function() {
		for(var i = 1; i < 9;i++){
			$("#re7" + i).html("<img src = 'resources/images/Bpawn.png'>")
			$("#re2" + i).html("<img src = 'resources/images/Wpawn.png'>")		
		}		
		
		$("#re81").html("<img src='resources/images/Brook.png'>")
		$("#re88").html("<img src='resources/images/Brook.png'>")
		$("#re11").html("<img src='resources/images/Wrook.png'>")
		$("#re18").html("<img src='resources/images/Wrook.png'>")
		
		$("#re82").html("<img src='resources/images/BLknight.png'>")
		$("#re87").html("<img src='resources/images/BRknight.png'>")
		$("#re12").html("<img src='resources/images/WLknight.png'>")
		$("#re17").html("<img src='resources/images/WRknight.png'>")
		
		$("#re83").html("<img src='resources/images/Bbishop.png'>")
		$("#re86").html("<img src='resources/images/Bbishop.png'>")
		$("#re13").html("<img src='resources/images/Wbishop.png'>")
		$("#re16").html("<img src='resources/images/Wbishop.png'>")
		
		$("#re84").html("<img src='resources/images/Bqueen.png'>")
		$("#re85").html("<img src='resources/images/Bking.png'>")
		$("#re14").html("<img src='resources/images/Wqueen.png'>")
		$("#re15").html("<img src='resources/images/Wking.png'>")
	
	});
	
	</script>
	<jsp:include page="../main/chatting.jsp"/>
	<jsp:include page="../main_footer.jsp" />
	
</body>
</html>


