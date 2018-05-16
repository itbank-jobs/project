<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    
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
		<td>사원번호</td>
		<td>작성자</td>
		<td>제목</td>
		<td>등록일</td>
		<td>조회수</td>
	</tr>
		
	
		
	<c:forEach var = "listdto" items = "${list }" varStatus="status" >
	<tr>		
		<td class = "titletd">${fn:length(list)-status.count+1}</td>
		<td class = "titletd">${listdto.employeeNumber }</td> 
		<td class = "titletd">${listdto.name }</td>
		<td class = "titletd"><a href = "content?num=${listdto.num }">${listdto.subject }</a></td>
		<td class = "titletd">${listdto.regdate }</td>
		<td class = "titletd">${listdto.readcount }</td>

	
	</tr>
	</c:forEach>
	</table>
</div>

</body>
</html>