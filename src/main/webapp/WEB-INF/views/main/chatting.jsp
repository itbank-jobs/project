<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<div class="chatContainer"style="${chatListStyle}">
	<div class = "chatController"><i class="fa fa-wechat">&nbsp Messenser</i></div>
	<div id = "chatList" <c:if test="${chatControllerHide}"> style="display:none;" </c:if> class="chatList">
	<div class = "memberStyle">
	<div class="membersN">Name</div><div class="membersE">E-Number</div>
	</div>
	<c:forEach items="${chatList}" var="list">
		<c:if test="${list.employeeNumber!=employeeNumber}">
			<div class="employeeNumberList" style="cursor:not-allowed">
			<div id= "chatInfo${list.employeeNumber}" class="chatInfo">
				<div class="chatName">${list.name}</div>
				<div class="chatNumber">${list.employeeNumber}</div>
			</div>
			</div>
		</c:if>
	</c:forEach>
	</div>
</div>

<div class="liveChatContainer">
	<c:forEach items="${chatListLive}" var="list" >
		<c:if test="${list.employeeNumber!=employeeNumber}">
			<div class="liveChat" style="${list.style}" id="chatList${list.employeeNumber}">
				<div class="liveChatName">${list.name}</div><div class="liveChatClose">X</div>
				<div class="chatArea" id="${list.employeeNumber}">
				<c:forEach items="${list.commentList}" var="list2" >
				<c:choose>
				<c:when test="${list2.e_from==employeeNumber}"><div class ="myComment">${list2.chat_comment}</div></c:when>
				<c:otherwise><div class ="yourComment">${list2.chat_comment}</div></c:otherwise>
				</c:choose>
				</c:forEach>
				</div>
				<input type="text" class="chatMessage" id="input${list.employeeNumber}">
			</div>
		</c:if>
	</c:forEach>
</div>
<link rel="stylesheet" href="resources/css/mainChat.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="resources/js/sockjs-0.3.4.js"></script>
<script type="text/javascript">
	var sock = new SockJS('<c:url value="/echo"/>');
	sock.onmessage = onMessage;
	sock.onclose = onClose;
	sock.onopen = onOpen;
	var hide = true;
	var chatListLive = ${liveList};
	for(var i = 0; i<chatListLive.length;i++){
		if(chatListLive[i]!='${employeeNumber}'){
			$('#chatInfo'+chatListLive[i]).children('.chatNumber').attr('style','color:#00ff00; cursor : pointer');
			$('#chatInfo'+chatListLive[i]).children('.chatName').attr('style','color:#00ff00; cursor : pointer');
			$('#'+chatListLive[i]).scrollTop($('#'+chatListLive[i])[0].scrollHeight)
		}
	}
	$(function() {
		
		var areaTmp;
		$(".liveChat").draggable(
			{stop:function(){ 
				 $.ajax({
						type : 'post',
						dataType : 'text',
						data : {employeeNumber:$(this).children('.chatArea').attr('id'),style:$(this).attr('style')},
						url : '/proto/chatCheckStyle',
						
						success : function(result){ //LoginController-> loginCheck커멘드 에서 결과 가져옴.
						},
						error : function(xhr, status, e){
							alert(e);
						}
						
					});
	       }}
			 
		);
		
		$(".chatContainer").draggable(
				{stop:function(){ 
					 $.ajax({
							type : 'post',
							dataType : 'text',
							data : {style:$('.chatContainer').attr('style')},
							url : '/proto/chatListStyle',
							
							success : function(result){ //LoginController-> loginCheck커멘드 에서 결과 가져옴.
							},
							error : function(xhr, status, e){
								alert(e);
							}
							
						});
		       }});
		
		
		
		$(".chatON").click(function(){
			console.log($('.chatContainer').attr('style'));
			if($('.chatContainer').css('display')=='none'){
				$('.chatContainer').css('display','');	
					
			}else{
				$('.chatContainer').attr('style','display: none')
			}
			$.ajax({
				type : 'post',
				dataType : 'text',
				data : {style:$('.chatContainer').attr('style')},
				url : '/proto/chatListStyle',
				
				success : function(result){ //LoginController-> loginCheck커멘드 에서 결과 가져옴.
				},
				error : function(xhr, status, e){
					alert(e);
				}
				
			});
		})
		$('.chatController').click(function() {
			$('#chatList').toggle(500);
			
			$.ajax({
				type : 'post',
				dataType : 'text',
				url : '/proto/chatControllerHide',
				
				success : function(result){ //LoginController-> loginCheck커멘드 에서 결과 가져옴.
				},
				error : function(xhr, status, e){
					alert(e);
				}
				
			});
		});
		
		$('.liveChatClose').click(function() {
			if($(this).parent('.liveChat').css('display')=='none'){
				$(this).parent('.liveChat').css('display','block');
			}else{
				$(this).parent('.liveChat').css('display','none');
			}
			$.ajax({
				type : 'post',
				data : {employeeNumber:$(this).parent('.liveChat').children('.chatArea').attr('id'),style:'left:'+$(this).parent('.liveChat').css('left')+';top:'+ $(this).parent('.liveChat').css('top')},
				dataType : 'text',
				url : '/proto/chatCheckStyle',
				
				success : function(){ //LoginController-> loginCheck커멘드 에서 결과 가져옴.
				},
				error : function(xhr, status, e){
					alert(e);
				}
				
			});
		});
	
		$('.employeeNumberList').click(function() {
			if($('#chatList' + $(this).children('.chatInfo').children('.chatNumber').html()).css('display')=='none'){
				$('#chatList' + $(this).children('.chatInfo').children('.chatNumber').html()).css('display','block');
			}else{
				$('#chatList' + $(this).children('.chatInfo').children('.chatNumber').html()).css('display','none');
			}
			$(this).children('.chatInfo').attr('style','');						
			$.ajax({
				type : 'post',
				data : {employeeNumber:$(this).children('.chatInfo').children('.chatNumber').html(),style:$('#chatList'+$(this).children('.chatInfo').children('.chatNumber').html()).attr('style')},
				dataType : 'text',
				url : '/proto/chatCheckStyle',
				
				success : function(result){ //LoginController-> loginCheck커멘드 에서 결과 가져옴.
				},
				error : function(xhr, status, e){
					alert(e);
				}
				
			});
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
						$('#' + areaTmp).scrollTop($('#' + areaTmp)[0].scrollHeight);
						
						$.ajax({
							type : 'post',
							data : {e_from:'${employeeNumber}',e_to:areaTmp,chat_comment:$(this).val()},
							dataType : 'text',
							url : '/proto/chattingData',
							
							success : function(result){ //LoginController-> loginCheck커멘드 에서 결과 가져옴.
							},
							error : function(xhr, status, e){
								alert(e);
							}
					});
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