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

	<form action = "modify_complete" method = "post">
	<div class="form-group">
	<input type = "hidden" name = "num" value = "${content.num }"> 

		<tr>
		<td>번호</td>
		<td>${content.num } </td> <!-- ? -->
		</tr>
		<tr>
		<td>조회수</td>
		<td>${content.readcount}</td>
		</tr>
		<tr>
		<td>제목</td>
		<td><input type = "text" name = "subject" value = "${content.subject}"></td>
		</tr>
		<tr>
		<td>내용</td>
		<td><input type = "text" name = "content"  class="form-control"  value = "${content.content }"></td>
		<tr>
		
		<td colspan="2"><input type = "submit" class = "btn" value = "수정완료">
		
		
		<tr>
	
		</tr>
		</div>
	</form> 
</table>


</body>
</html>