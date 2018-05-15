<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>글 내용 보기</title>
<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
<script src="resources/js/reply.js"></script>

</head>
<body>

 <table width = "500" cellpadding = "0" cellspacing = "0" border = "1"> 
<!-- <table class = "table table-condensed"> -->

	<form action = "modify" method = "post">

		<input type = "hidden" name = "num" value = "${content.num}"> 
		<!-- content이름은  -->
		<!-- list.jsp에서 제목을 눌러 content로 이동할때 아이디 값도 링크에 달고 이동한다.이름과 제목,내용 뿐만아니라 -->
		<tr>
		<td>번호</td>
		<td id = "num">${content.num }</td>
		</tr>
		<tr>
		<td>조회수</td>
		<td>${content.readcount}</td>
		</tr>
		<tr>
		<td>제목</td>
		<td>${content.subject }</td>
		</tr>
		<tr>
		<td>내용</td>
		<td>${content.content }</td>
		</tr>
		
		<td colspan="2"><input type = "submit" class = "btn" value = "수정">
		<button type = "button"><a href = "list">목록</a></button>
		<button type = "button"><a href = "delete?num=${content.num }">삭제</a></button>
		<br>
		
		<div style = "widthL:700px; text-align:center;">
		<textarea rows="2" cols="80" placeholder = "댓글을 입력하세요" id = replytext name = "replytext"></textarea>
		<!-- <button type = "button" id = "btnReply">댓글달기</button> -->
		<button type = "button" id = "registerReply">등록</button>
		</div>
		
		
		<table>
		<c:forEach var = "replylist" items = "${reply}">
		<td><hr></td>
		<tr>
		<td>작성자</td>
		<td>${replylist.name }</td>
		</tr>
		<tr>
		<td>내용</td>
		<td>${replylist.replytext}</td>
		</tr>
		<tr>
		<td>등록일</td>
		<td>${replylist.regdate}</td>
		</tr>
		<tr>
		<td><button type = "button" id = "deleteReply">삭제</button></td>
		</td>
		</tr>
		</c:forEach>
		</table>
		

	</form> 
</table>




</body>
</html>