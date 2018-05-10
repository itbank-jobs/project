<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- footer부분 -->

<div class="chatContainer">
list

<div class="employeeNumberList"></div>


</div>
<div class="liveChatContainer">


</div>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src = "resources/js/sockjs-0.3.4.js"></script>
<script type="text/javascript">
var sock = new SockJS('<c:url value="/echo"/>');
sock.onmessage = onMessage;
sock.onclose = onClose;
sock.onopen = onOpen;
var areaTmp;
$(document).ready(function(){		
	$('.employeeNumberList').click(function(){
		console.log('1');
		$('.liveChatContainer').append('<div class = "liveChat" ><div class="chatArea" id = "'+$(this).html()+'"></div><input type="text" class="chatMessage"></div>');
		$(".liveChat").draggable();
		$('.chatMessage').keypress(function(e){
			if(e.keyCode == 13){
			areaTmp = $(this).parent('.liveChat').children('.chatArea').attr('id');
			sock.send(areaTmp+':'+$(this).val());
			$('#'+areaTmp).append('<div class=\'mycomment\'>'+$(this).val()+'</div>');
			$(this).val('');
			}
		});
	});
	
});
function onOpen(evt){
	sock.send('${employeeNumber}');
}	

function onMessage(evt){
	var tmp = evt.data.split(':');
	$('#'+tmp[0]).append(tmp[1]+'</br>');
	$('#'+tmp[0]).scrollTop($(".chatArea")[0].scrollHeight);
}

function onClose(evt){	
}
</script>