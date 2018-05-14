<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!-- footer부분 -->

<div class="chatContainer" style="width: 130px; height: 50px">
	<div class = "chatController" >Chatting</div>
	<div id = "chatList" style="display: none">
	<c:forEach items="${chatList}" var="list">
		<c:if test="${list.employeeNumber!=employeeNumber}">
			<div class="employeeNumberList" style="cursor:not-allowed">
			<div id= "chatInfo${list.employeeNumber}" class="chatInfo">
				<div class="chatName">${list.name}</div>
				<div class="chatNumber">${list.employeeNumber}</div>
			</div>
			</div>
			<br>
		</c:if>
	</c:forEach>
	</div>
</div>
<div class="liveChatContainer">
	<c:forEach items="${chatListLive}" var="list" >
		<c:if test="${list.employeeNumber!=employeeNumber}">
			<div class="liveChat" style="display: none" id="chatList${list.employeeNumber}">
				<div class="liveChatName">${list.name}</div><div class="liveChatClose">X</div>
				<div class="chatArea" id="${list.employeeNumber}"></div>
				<input type="text" class="chatMessage" id="input${list.employeeNumber}">
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
	var hide = true;
	var chatListLive =[<c:forEach items="${chatListLive}" var="list" varStatus = "status">${list.employeeNumber}<c:if test="${!status.last}">,</c:if></c:forEach>];
	for(var i = 0; i<chatListLive.length;i++){
		if(chatListLive[i]!=${employeeNumber}){
			$('#chatInfo'+chatListLive[i]).attr('style','color:#8de08d; cursor : pointer');
		}
	}
	$(function() {
		var areaTmp;
		$(".liveChat").draggable();
		
		$('.chatController').click(function() {
			$('#chatList').toggle(500);
		});
		
		$('.liveChatClose').click(function() {
			$(this).parent('.liveChat').toggle(500);
		});
	
		$('.employeeNumberList').click(function() {
			$('#chatList' + $(this).children('.chatInfo').children('.chatNumber').html()).attr('style', '');
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
						$('#' + areaTmp).scrollTop($(".chatArea")[0].scrollHeight);
						$(this).val('');
					}
				});
	});
	
	 $('.liveChat').click(function(){
		$(this).children('.liveChatName').attr('style','');
		$('#chatInfo'+$(this).children('.chatArea').attr('id')).attr('style','');
	});
	 
	 
	function onOpen(evt) {
		sock.send('${employeeNumber}:${name}');
	}

	function onMessage(evt) {
		var tmp = evt.data.split(':');
		$('#' + tmp[0]).append('<div class=\'yourComment\'>'+tmp[1]+'</div>');
		$('#' + tmp[0]).scrollTop($(".chatArea")[0].scrollHeight);
		console.log($(document.activeElement).attr('id'));
		if($(document.activeElement).attr('id')!='input'+tmp[0]){
		$('#chatList' + tmp[0]).children('.liveChatName').attr('style',' animation-name:flush; animation-duration: 1s; animation-iteration-count: infinite;');
		$('#chatInfo' + tmp[0]).attr('style',' animation-name:flush; animation-duration: 1s; animation-iteration-count: infinite;');
		}
		
	}

	function onClose(evt) {
		console.log('close');
	}
</script>