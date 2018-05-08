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


<div class="container">

		<button type = "button" class = "btn">글작성하러 가기</a></button>


	<table class = "table table-condensed">
	<tr>
		<td>번호</td>
		<td>ID</td>
		<td>작성자</td>
		<td>제목</td>
		<td>날짜</td>
		<td>히트</td>
	</tr>
	
<%-- 	<c:forEach var = "listdto" items = "${Blist }" ><!-- id,name,indent(들여쓰기),title,date,hit -->

	<tr>
		<td class = "titletd">${listdto.num }</td> 
		<td class = "titletd">${listdto.name }</td>
		<td class = "titletd">
			<c:forEach begin = "1" end = "${listdto.indent }"> -</c:forEach>
			<a href = "content?num=${listdto.num }">${listdto.title }</a></td>
		<td class = "titletd">${listdto.bdate }</td>
		<td class = "titletd">${listdto.hit }</td>
	</tr>
	</c:forEach> --%>
	
	
		

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
<script>

$(".btn").click(function(){
	if('${loginID}'!=''){
		location.href='write_view';
	}else{
		alert("응 로그인해~");
	}
});
</script>

</body>
</html>