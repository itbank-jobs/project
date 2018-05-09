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

		<button type = "button">글작성하러 가기</a></button>


	<table>
	<tr>
		<td>번호</td>
		<td>작성자</td>
		<td>제목</td>
		<td>등록일</td>
		<td>조회수</td>
	</tr>
		
	
		

	<tr>
	<c:forEach var = "listdto" items = "${Blist }" varStatus="status"><!-- id,name,indent(들여쓰기),title,date,hit -->
		<td class = "titletd">${number-status.count +1}</td>
		<td class = "titletd">${listdto.id }</td> 
		<td class = "titletd">${listdto.name }</td>
		<td class = "titletd">
			<c:forEach begin = "1" end = "${listdto.indent }"> -</c:forEach>
			<a href = "content?num=${listdto.num }">${listdto.title }</a></td>
		<td class = "titletd">${listdto.bdate }</td>
		<td class = "titletd">${listdto.hit }</td>
	
	</tr>
	</c:forEach>
	</table>
</div>

</body>
</html>