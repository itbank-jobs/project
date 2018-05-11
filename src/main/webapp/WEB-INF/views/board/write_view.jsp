<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form action = "write" method = "post">
	<table width = "500" cellpadding = "0" cellspacing = "0" border = "1">
		
			<tr>
				<td>사원번호</td>
				<td><input type = "text"  name = "employeeNumber" value="${employeeNumber }" size = "50" readonly="readonly"></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type = "text" name = "subject" size = "50"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name = "Content" rows = "10"></textarea></td>	
			</tr>	
			<tr>
				<td colspan = "2"><input type = "submit" value = "입력"><a href ="list" >목록보기</a>
			</td>
			</tr>
		
	</table>
	</form>
</body>
</html>