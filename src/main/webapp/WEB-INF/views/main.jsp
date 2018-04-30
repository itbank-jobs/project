<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>

<title>홈페이지 기본 제작 폼</title>

</head>

<body>

<%-- header --%>
	<jsp:include page="main_header.jsp" flush="false" />

	${fn:length(member)}
		<!-- main -->

	
<%-- footer --%>
	<jsp:include page="main_footer.jsp" flush="false" />


</body>
</html>