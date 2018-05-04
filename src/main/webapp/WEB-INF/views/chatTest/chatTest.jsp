<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src = "resources/js/sockjs-0.3.4.js"></script>
<script type="text/javascript">
var sock = new SockJS('<c:url value="/echo"/>');
sock.onmessage = onMessage;
sock.onclose = onClose;
$(document).ready(function(){
	$('#send').click(function(){
		sock.send($('#message').val());
	});
	
});

function onMessage(evt){	
	
	$('#chat').append(evt.data+'</br>');
	
}

function onClose(evt){	
	
alert('fdsf');
	
}


</script>
<title>Insert title here</title>
</head>
<body>
<input type="text" id="message">
<input type="button" id ="send" value="전달">
<div id = "chat">

</div>

</body>
</html>