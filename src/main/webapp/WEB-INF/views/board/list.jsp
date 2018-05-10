<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>게시판</title>
</head>

<body>


<div>

	
		<a href="write_view">글 작성하러가기</a>


	<table>
	<tr>
		<td>번호</td>
		<td>작성자</td>
		<td>제목</td>
		<td>등록일</td>
		<td>조회수</td>
	</tr>
		
	
		
	<c:forEach var = "listdto" items = "${list }">
	<tr>
		<td class = "titletd">${listdto.num}</td>
		<td class = "titletd">${listdto.writer }</td> 
		<td class = "titletd">${listdto.subject }</td>
		<td class = "titletd">${listdto.regdate }</td>
		<td class = "titletd">${listdto.readcount }</td>

	
	</tr>
	</c:forEach>
	</table>
</div>

</body>
</html>