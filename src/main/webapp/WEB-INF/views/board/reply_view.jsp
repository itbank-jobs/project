<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>

<body>

<table width = "500" cellpadding="0" cellspacing="0" border = "1">
<form action = "reply_write" method = "post">
<!-- 컨트롤러로부터 reply_view 의 값을 hidden으로 받는다.새로 입력한 이름 제목과 함께 다음 페이지로  -->
	<input type = "hidden" name = "num" value="${reply_view.num}">
	<input type = "hidden" name = "bgroup" value = "${reply_view.bgroup }">
	<input type = "hidden" name = "step" value = "${reply_view.step }">
	<input type = "hidden" name = "indent" value = "${reply_view.indent }">
	<tr>
		<td>번호</td>
		<td>${reply_view.num }</td>
		
	</tr>
	<tr>
		<td>히트</td>
		<td>${reply_view.hit }</td>
	</tr>
	
		<tr>
		<td>이름</td>
		<td><input type = "text" name = "name" value = "${name}"></td>
	</tr>
	<tr>
		<td>제목</td>
		<td><input type = "text" name = "title" value = "[답변]"></td>
	</tr>
	<tr>
		<td>내용</td>
		<td><input type = "text" name = "content" ></td>
	</tr>
	<tr>
		<td colspan = "2"><input type = "submit" class = "btn" value = "답변">
		<button type = "button" class = "btn"><a href = "list">목록</a></button>
		</td>
	</tr>
	
<%-- 	<tr>
		<td>이름</td>
		<td><input type = "text" name = "name" value = "${reply_view.name }"></td>
	</tr>
	<tr>
		<td>제목</td>
		<td><input type = "text" name = "title" value = "${reply_view.title }"></td>
	</tr>
	<tr>
		<td>내용</td>
		<td><input type = "text" name = "content" value = "${reply_view.content }"></td>
	</tr>
	<tr>
		<td colspan = "2"><input type = "submit" value = "답변">
		<button type = "button" class = "btn"><a href = "list">목록</a></button>
		</td>
	</tr> --%>
	
</form>
</table>

</body>
</html>