<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<link media="all" type="text/css" rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/css/main.css">
<script type="text/javascript">
	//toggle class scroll 
	$(window).scroll(function() {
		if ($(this).scrollTop() > 200) {
			$('.navbar-trans').addClass('afterscroll');
		} else {
			$('.navbar-trans').removeClass('afterscroll');
		}

	});

	// demo only 
	// open link in new tab without ugly target="_blank"
	$("a[href^='http']").attr("target", "_blank");

	$(document).ready(function() {

		$("#new").click(function() {
			setTimeout('$("#n").toggle(700)', '700');
			$("#h").hide(1000);
			$("#t").hide(1000);
		});
		$("#team").click(function() {
			setTimeout('$("#t").toggle(700)', '700');
			$("#n").hide(1000);
			$("#h").hide(1000);
		});

	});
</script>

<style type="text/css">
::-webkit-scrollbar {
	display: none;
}
::-webkit-input-placeholder{
color:#a0a0a0;
} 

body {
	background:url('../../../proto/resources/images/background.jpg') fixed;
	background-size: cover;
	background-repeat: no-repeat;
	padding: 0;
	margin: 0;
	background-repeat: no-repeat;
	height: 130vh;
}

body>h1 {
	color: #fff;
	text-align: center;
	font-family: serif;
	font-size: 55px;
	text-shadow: 3px 3px 6px rgba(0, 0, 0, 0.2);
	margin: 40px 0 0 0;
}

.opt {
	width: 98%;
	margin: 0 auto;
	padding-right: 5px;
	background-color: #ffffffad;
	color: #000000;
}

.opt, .opt a {
	text-transform: uppercase;
	font-size: 9px;
	color: #000000;
}

.opt a:hover {
	text-decoration: none;
}

.opt .post {
	background: #999;
	color: #ccc;
	text-decoration: none;
	border-radius: 4px;
	padding: 5px 10px;
	font-size: 10px
}

.opt .post:hover {
	background: #444;
}

#feed {
	margin: 0;
	padding: 0
}

#feed>li {
	position: relative;
	padding: 20px 20px 0px 20px;
	color: #fff;
	list-style: none;
	background: #000000ad;
	margin: 20px 1%;
	box-shadow: 5px 5px 6px 0 rgba(0, 0, 0, 0.5);
	border-radius: 3px;
	transition: all 0.2s;
	overflow: hidden;
	min-height: 88px
}

.content a {
	color: #a0a0a0;
	text-decoration: none;
	font-weight: bold;
	max-width: 80%;
	overflow: hidden
}

.content a:hover {
	text-decoration: underline
}

.content>div {
	opacity: 0;
	max-height: 0px;
	overflow: hidden;
	padding: 0 10px;
	transition: all 0.2s;
	box-sizing: border-box;
	background: #00000060;
	font-size: 14px;
	margin: 20px auto;
	border: 1px solid #968181;
	color: #dadada;
	text-align: justify;
	box-shadow: 3px 5px 6px 0px rgba(0, 0, 0, 0.1) inset;
	border-radius: 3px
}


#feed li i {
	
	top: -5px;
	text-align:right;
	z-index: 3;
	font-size: 15px;
	transition: all 0.8s;
	display: block;
}

#feed li:hover i {
	opacity: 0;
	transition: all 0.2s;
}

 


#feed h1, #feed h2 {
	font-size: 16px
}

.apply {
	background: #08d;
	color: #fff;
	font-size: 11px;
	position: absolute;
	top: 20px;
	right: 20px;
	padding: 5px 10px;
	border-radius: 3px
}

.apply:hover {
	background: #06a;
	text-decoration: none
}

#feed.dark>li {
	background: rgba(0, 0, 0, 0.9)
}

#feed.dark li>div {
	background: rgba(0, 0, 0);
	border-color: #fff;
	color: #fff
}

</style>



</head>
<body>

	<jsp:include page="../main/chatting.jsp"></jsp:include>

	<div style="-ms-overflow-style: none;">
		<!--스크롤바 없이 스크롤 가능하게 함   -->

		<nav
			class="navbar navbar-default navbar-doublerow navbar-trans navbar-fixed-top">
		<!-- top nav --> <nav class="navbar navbar-top hidden-xs">
		<div class="container">
			<!-- left nav top -->
			<ul class="nav navbar-nav pull-left">
				<li id="home"><a href="typeB"><span class="text-white"><i
							class="fa fa-home"></i>&nbspHome</span></a></li>
				<li id="new"><a href="#"><span class="text-white"><i
							class="fa fa-newspaper-o"></i>&nbsp New</span></a></li>
				<li id="team"><a href="#"><span class="text-white"><i
							class="fa fa-users"></i>&nbsp Team</span></a></li>

			</ul>
			<!-- right nav top -->
			<ul class="nav navbar-nav pull-right">
				<li><a href="settings" class="text-white"><i
						class="fa fa-cog"></i>&nbspSettings</a></li>
				<li><a href="logout" class="text-white"><i
						class="fa fa-power-off"></i>&nbspLogout</a></li>
			</ul>
		</div>
		<div class="dividline light-grey"></div>
		</nav> <!-- down nav --> <nav class="navbar navbar-down">
		<div class="container">
			<div class="flex-container">
				<div class="navbar-header flex-item">
					<div class="navbar-brand">Project</div>
				</div>
		

				<ul id="n" class="nav navbar-nav flex-item hidden-xs"
					style="display: none;">
					<li><a href="news">공지사항</a></li>
					<li><a href="event">행사</a></li>

				</ul>

				<ul id="t" class="nav navbar-nav flex-item hidden-xs"
					style="display: none;">
					<li><a href="list?teamNum=1">경영지원팀</a></li>
					<li><a href="list?teamNum=2">인사팀</a></li>
					<li><a href="list?teamNum=3">개발팀</a></li>
					<li><a href="list?teamNum=4">영업팀</a></li>
				</ul>
				<ul class="nav navbar-nav flex-item hidden-xs pull-right">
					<li class="chatON"><span class="text-white"><i
							class="fa fa-wechat"></i>&nbsp Messenser</span></li>
				</ul>
			</div>
		</div>
		</nav>
		
		
		
		
		
		
		
		<div class="container">
		
		<div class="row" style="margin-bottom: 3%;">
			<div class="col-md-12" style="overflow: auto; height: 860px; padding-bottom: 10px; margin-top: 50px" >
				<font size="18" style="color:#00ff68c7; margin-left: 10px; margin-bottom: 20px; width: 30%" id="news" >News </font>  
				<input type="password" id="newsPasswd" placeholder="비밀번호를 입력해주세요" maxlength="8" style="display: none; background: inherit;border-radius: 10px;border: solid 1px;padding-left: 8px;border-color: #ffffffad;" onkeyup="pass_ck()">
				
				<div class="opt">
						<div id="Message">&nbsp</div>
					 <div style="text-align: right;margin-top: -15px;">Change theme:</font> <a
						href="#" class="dark">Dark</a> &mdash; <a href="#" class="light">Light</a>
				</div>
				</div>
				<ul id="feed">
					<c:forEach items="${noticeList}" var="list" begin="0" end="4">
					
						<li class="content" onclick="conCk(this)"><a href='${list.link }' target='_blank'>${list.title }</a><br>
							<i>${list.author }</i> 
							<%-- <a href='${list.link }' class='apply' target='_blank'>보기</a> --%>
							<div >${list.content }</div></li>
						<c:set var="num" value="${list.num-1 }" />
						
						
					</c:forEach>
				</ul>
				<!-- 게시글리스트 위치 -->
				<center>

					<c:if test="${num > 0}">
					<div
						 id="more" style="font-size: 12px; text-align: center; color: #fff; background: rgba(0, 0, 0, 0.8); max-width: 100%; width: 30vw; opacity: 0.9; padding: 5px 0;">
						 <span style="font-size: 14px;"> + More</span>
					</div>
					</c:if>
				</center>
			</div>
		</div>

		<div class="row"></div>

	</div>
	<script type="text/javascript">
	function pass_ck(){
		
		var passwd = $("#newsPasswd").val();
	 	if(passwd.length == 8){
	$.ajax({
		type : "post",
		data : {passwd:passwd},
		url : '/proto/news_passCK',
		
		success : function(result){
			var chk = result;
			if(chk == 1){
				 location.replace("news_writeView");
			}else{

				 $('#Message').html('<font color = red> Incorrect PASSWORD</font>') 
				 setTimeout('$("#Message").html("&nbsp")','5000');
			}
			
		},
		error : function(xhr, status, e){
			 $('#Message').html('비밀번호를 입력해 주세요.') 
			 setTimeout('$("#Message").html("&nbsp")','5000');
		}
		
	});
   } 
}
	function conCk(test){
		if($(test).children('div').attr('class')!='true'){
		$(test).children('div').attr('class','true');
		$(test).children('div').css('max-height','fit-content').css('opacity','1').css('overflow','auto').css('transition','all 0.5s').css('padding','10px');															
		}
		else{
			$(test).children('div').css('max-height','0px').css('opacity','0').css('overflow','hidden').css('transition','all 0.5s').css('padding','0 10px');
			$(test).children('div').attr('class','');
		}
	};
		$(function() {
			var currentPageNum = ${num};// 컨트롤 쉬프트f하면 안먹음
	
			var data = {
				"num" : currentPageNum
			};
			
			
			
			$(".dark").click(function() { // dark 클래스 클릭하면
				$("#feed").addClass('dark'); // #dark css적용
				$('.opt').css('background','#000000cc').css('color','#ffffff');
				$('.dark').css('color','#ffffff');
				$('.light').css('color','#ffffff');
			});
			$(".light").click(function() {
				$("#feed").removeClass('dark');
				$('.opt').css('background','#ffffffad').css('color','#000000');
				$('.dark').css('color','#000000');
				$('.light').css('color','#000000');
			
			});
			
			$(document).ready(function() {
				$("#news").click(function() {
					$("#newsPasswd").toggle(700);

				});
			});

			$("#more").click(function() { // dark 클래스 클릭하면
				
	
								$.ajax({
											type : "GET",
											url : "/proto/newsData",
											data : {currentPageNum : currentPageNum},
											dataType : 'text',
											error : function() {
												$("#feed")
														.after(
																"<center>Unable to load feed, Incorrect path or invalid feed</center>");
											
												
											},
											success : function(result) {
												// console.log(values[i]);
		
												$("#feed").append(result);
												if(currentPageNum < 5){
												currentPageNum -= ${num};
												
												}else{
												currentPageNum -= 5;	
												
												}
												if(currentPageNum== 0){
													$('#more').css('display','none');
												}
											
											}
										});
			
						
			});
		
		

			// 		$.ajax({
			// 					type : "GET",
			// 					url : "/proto/newsData?num=currentPageNum",
			// 					data : data,
			// 					dataType : 'text',
			// 					error : function() {
			// 						$("#feed").after("<center>Unable to load feed, Incorrect path or invalid feed</center>");
			// 					},
			// 					success : function(result) {
			// 						// console.log(values[i]);
			// 						$("#feed").append(result);
			// 					}
			// 				});
		});
	</script>
		
		 </nav>

	</div>










	

	
</body>
</html>