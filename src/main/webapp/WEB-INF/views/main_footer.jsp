<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- footer부분 -->

<div class="chatContainer">
	<div id = "hide">list</div>
	<div id = "chatList">
	<c:forEach items="${chatList}" var="list">
		<c:if test="${list.employeeNumber!=employeeNumber}">
			<div class="employeeNumberList">
				<div class="chatName">${list.name}</div>
				<div class="chatNumber">${list.employeeNumber}</div>
			</div>
			<br>
		</c:if>
	</c:forEach>
	</div>
</div>
<div class="liveChatContainer">
	<c:forEach items="${chatList}" var="list">
		<c:if test="${list.employeeNumber!=employeeNumber}">
			<div class="liveChat" style="display: none"
				id="chatList${list.employeeNumber}">
				<div class="chatName">${list.name}</div>
				<div class="chatArea" id="${list.employeeNumber}"></div>
				<input type="text" class="chatMessage">
			</div>
		</c:if>
	</c:forEach>
</div>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="resources/js/sockjs-0.3.4.js"></script>
<script type="text/javascript">
	var sock = new SockJS('<c:url value="/echo"/>');
	sock.onmessage = onMessage;
	sock.onclose = onClose;
	sock.onopen = onOpen;
	var hide = false;
	$(function() {
		var areaTmp;
		$(".liveChat").draggable();
		$('#hide').click(function() {
			if(hide==false){
				$('#chatList').attr('style','display: none');
				$('.chatContainer').attr('style','width: 100px; height: 50px');
				hide = true;
			}else{
				$('#chatList').attr('style','');
				$('.chatContainer').attr('style','');
				hide = false;	
			}
		})
		$('.employeeNumberList').click(
				function() {
					console.log('1');
					$('#chatList' + $(this).children('.chatNumber').html())
							.attr('style', '');
				});
		$('.chatMessage').keypress(
				function(e) {
					if (e.keyCode == 13) {
						areaTmp = $(this).parent('.liveChat').children(
								'.chatArea').attr('id');
						sock.send(areaTmp + ':' + '${employeeNumber}:'
								+ $(this).val());
						$('#' + areaTmp).append(
								'<div class=\'myComment\'>' + $(this).val()
										+ '</div>');
						$(this).val('');
					}
				});
	});

	function onOpen(evt) {
		sock.send('${employeeNumber}');
	}

	function onMessage(evt) {
		var tmp = evt.data.split(':');
		$('#' + tmp[0]).append('<div class=\'yourComment\'>'+tmp[1]+'</div>');
		$('#' + tmp[0]).scrollTop($(".chatArea")[0].scrollHeight);
	}

	function onClose(evt) {
	}
</script>