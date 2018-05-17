<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE">
<c:forEach begin="1" end="6" varStatus="status">
	<div class="week">
		<c:forEach begin="1" end="7" varStatus="status2">
			<c:choose>
				<c:when
					test="${((status.count-1)*7 +status2.count - calDW) > 0 && ((status.count-1)*7 +status2.count - calDW) <= calDM}">
					<div class="day">${(status.count-1)*7 +status2.count - calDW}</div>
				</c:when>
				<c:when test="${((status.count-1)*7 +status2.count - calDW) <= 0}">
					<div class="day" style="color: gray">${lastCalDM + (status.count-1)*7 +status2.count-calDW}</div>
				</c:when>
				<c:otherwise>
					<div class="day" style="color: gray">${(status.count-1)*7 +status2.count-calDW-calDM}</div>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</div>
</c:forEach>