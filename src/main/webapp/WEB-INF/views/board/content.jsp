<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>글 내용 보기</title>
</head>

<body>

 <table width = "500" cellpadding = "0" cellspacing = "0" border = "1"> 
<!-- <table class = "table table-condensed"> -->

	<form class = "form-inline" action = "modify" method = "post">
	<div class="form-group">
		<input type = "hidden" name = "id" value = "${content.num }"> 
		<!-- content이름은  -->
		<!-- list.jsp에서 제목을 눌러 content로 이동할때 아이디 값도 링크에 달고 이동한다.이름과 제목,내용 뿐만아니라 -->
		<tr>
		<td>번호</td>
		<td>${content.num } </td> <!-- ? -->
		</tr>
		<tr>
		<td>히트</td>
		<td>${content.hit}</td>
		</tr>
		<tr>
		<td>이름</td>
		<td><input type = "text" name = "name" value = "${content.name }"></td>
		</tr>
		<tr>
		<td>제목</td>
		<td><input type = "text" name = "title" value = "${content.title }"></td>
		</tr>
		<tr>
		<td>내용</td>
		<td><input type = "text" name = "content"  class="form-control"  value = "${content.content }"></td>
		<tr>
		
		<td colspan="2"><input type = "submit" class = "btn" value = "수정">
		<button type = "button" class = "btn"><a href = "list">목록</a></button>
		<button type = "button" class = "btn"><a href = "delete?num=${content.num }">삭제</a></button>
		<button type = "button" class = "btn"><a href = "reply_view?num=${content.num }">답글달기</a></button>
		
		<tr>
	
		</tr>
		</div>
	</form> 
</table>


</body>
</html>