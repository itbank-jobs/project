<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<!-- <link ref='http://fonts.googleapis.com/css?family=Arial'
	rel='stylesheet' type='text/css'>
<link ref='http://fonts.googleapis.com/css?family=sans-serif'
	rel='stylesheet' type="text/css">
<link ref='http://fonts.googleapis.com/css?family=Helvetica'
	rel='stylesheet' type="text/css"> -->

<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="resources/js/calender.js"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" href="resources/css/calender.css">
<link rel="stylesheet" href="resources/css/main1.css">
<link rel="stylesheet" href="resources/css/mainNewsFeed.css">


<link media="all" type="text/css" rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
<link
	href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i"
	rel="stylesheet">
<script type="text/javascript">
	window.onload = function() {

		$('.dropdown').click(function() {
			$(this).siblings(".submenu").toggleClass('hide');

		});
	}

	$(document).ready(
			function() {
				var date = new Date();
				var d = date.getDate();
				var m = date.getMonth();
				var y = date.getFullYear();

				/*  className colors
				
				className: default(transparent), important(red), chill(pink), success(green), info(blue)
				
				 */

				/* initialize the external events
				-----------------------------------------------------------------*/

				$('#external-events div.external-event').each(function() {

					// create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
					// it doesn't need to have a start or end
					var eventObject = {
						title : $.trim($(this).text())
					// use the element's text as the event title
					};

					// store the Event Object in the DOM element so we can get to it later
					$(this).data('eventObject', eventObject);

					// make the event draggable using jQuery UI
					$(this).draggable({
						zIndex : 999,
						revert : true, // will cause the event to go back to its
						revertDuration : 0
					//  original position after the drag
					});

				});

				/* initialize the calendar
				-----------------------------------------------------------------*/

				var calendar = $('#calendar').fullCalendar(
						{
							header : {
								left : 'title',
								center : 'agendaDay,agendaWeek,month',
								right : 'prev,next today'
							},
							editable : true,
							firstDay : 1, //  1(Monday) this can be changed to 0(Sunday) for the USA system
							selectable : true,
							defaultView : 'month',

							axisFormat : 'h:mm',
							columnFormat : {
								month : 'ddd', // Mon
								week : 'ddd d', // Mon 7
								day : 'dddd M/d', // Monday 9/7
								agendaDay : 'dddd d'
							},
							titleFormat : {
								month : 'MMMM yyyy', // September 2009
								week : "MMMM yyyy", // September 2009
								day : 'MMMM yyyy' // Tuesday, Sep 8, 2009
							},
							allDaySlot : false,
							selectHelper : true,
							select : function(start, end, allDay) {
								var title = prompt('Event Title:');
								if (title) {
									calendar.fullCalendar('renderEvent', {
										title : title,
										start : start,
										end : end,
										allDay : allDay
									}, true // make the event "stick"
									);
								}
								calendar.fullCalendar('unselect');
							},
							droppable : true, // this allows things to be dropped onto the calendar !!!
							drop : function(date, allDay) { // this function is called when something is dropped

								// retrieve the dropped element's stored Event Object
								var originalEventObject = $(this).data(
										'eventObject');

								// we need to copy it, so that multiple events don't have a reference to the same object
								var copiedEventObject = $.extend({},
										originalEventObject);

								// assign it the date that was reported
								copiedEventObject.start = date;
								copiedEventObject.allDay = allDay;

								// render the event on the calendar
								// the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
								$('#calendar').fullCalendar('renderEvent',
										copiedEventObject, true);

								// is the "remove after drop" checkbox checked?
								if ($('#drop-remove').is(':checked')) {
									// if so, remove the element from the "Draggable Events" list
									$(this).remove();
								}

							},

							events : [ {
								title : 'All Day Event',
								start : new Date(y, m, 1)
							}, {
								id : 999,
								title : 'Repeating Event',
								start : new Date(y, m, d - 3, 16, 0),
								allDay : false,
								className : 'info'
							}, {
								id : 999,
								title : 'Repeating Event',
								start : new Date(y, m, d + 4, 16, 0),
								allDay : false,
								className : 'info'
							}, {
								title : 'Meeting',
								start : new Date(y, m, d, 10, 30),
								allDay : false,
								className : 'important'
							}, {
								title : 'Lunch',
								start : new Date(y, m, d, 12, 0),
								end : new Date(y, m, d, 14, 0),
								allDay : false,
								className : 'important'
							}, {
								title : 'Birthday Party',
								start : new Date(y, m, d + 1, 19, 0),
								end : new Date(y, m, d + 1, 22, 30),
								allDay : false,
							}, {
								title : 'Click for Google',
								start : new Date(y, m, 28),
								end : new Date(y, m, 29),
								url : 'http://google.com/',
								className : 'success'
							} ],
						});

			});
</script>

<title>Main</title>

</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-3 col-sm-4 sidebar3"></div>
		</div>
		<div class="row">
			<div id="navigation" class=" col-sm-4 sidebar3">
				<div class="left-navigation">
					<ul>
						<li><i class="fa fa-home" aria-hidden="true"></i>Home</li>

						<li><i class="fa fa-newspaper-o" aria-hidden="true"></i>News
							<span class="activebooks pull-right">3<!--기능 만들기 새글 등록 시 ++ 클릭하면 초기화   --></span></li>
						<li><i class="fa fa-calendar" aria-hidden="true"></i>Schedule</li>
						<li class="list">
							<div class="dropdown">
								<i class="fa fa-users" aria-hidden="true"></i>Team <i
									class="fa fa-plus pull-right" aria-hidden="true"></i>
							</div>
							<ul class="submenu hide">
								<li>경영지원팀</li>
								<li>인사팀</li>
								<li>개발팀</li>
								<li>영업팀</li>
							</ul>
						</li>
					</ul>
					<ul class="category">

						<li><i class="fa fa-wechat" aria-hidden="true"></i>Messenser</li>
						<li><i class="fa fa-circle-thin" aria-hidden="true"></i>About</li>
					</ul>
					<ul>
						<li><i class="fa fa-cog" aria-hidden="true"></i>Settings</li>
						<li><i class="fa fa-power-off" aria-hidden="true"></i>Logout</li>
					</ul>
				</div>
			</div>
			<div class="col-md-8 main-content">
				<div class="span4 plan" id="notice">
					<h4 align="center">공지사항</h4>
					<ul>
						<li class="plan-feature"><a href="#">제목1</a></li>
						<li class="plan-feature"><a href="#">제목2</a></li>
						<li class="plan-feature"><a href="#">제목3</a></li>
						<li class="plan-feature"><a href="#">제목4</a></li>
						<li class="plan-feature"><a href="#">제목5</a></li>
						<li class="plan-feature"><a href="#">제목6</a></li>
						<li class="plan-feature"><a href="#">제목7</a></li>
						<li class="plan-feature"><a href="#">제목8</a></li>
					</ul>
				</div>
			</div>

		</div>

		<div class="row"
			style="margin-top: 5em; margin-left: 10%; margin-right: 10%">


			<div class="col-md-6 main-content">
				<div class="span4 plan" id="newsfeed1">
					<h4 align="center">경영지원팀</h4>
					<ul>
						<li class="plan-feature"><a href="#">제목1</a></li>
						<li class="plan-feature"><a href="#">제목2</a></li>
						<li class="plan-feature"><a href="#">제목3</a></li>

					</ul>
				</div>
			</div>
			<div class="col-md-6 main-content">
				<div class="span4 plan" id="newsfeed1">
					<h4 align="center">인사팀</h4>
					<ul>
						<li class="plan-feature"><a href="#">제목1</a></li>
						<li class="plan-feature"><a href="#">제목2</a></li>
						<li class="plan-feature"><a href="#">제목3</a></li>

					</ul>
				</div>
			</div>
			<div class="col-md-6 main-content">
				<div class="span4 plan">
					<h4 align="center">개발팀</h4>

					<ul>
						<li class="plan-feature"><a href="#">제목1</a></li>
						<li class="plan-feature"><a href="#">제목2</a></li>
						<li class="plan-feature"><a href="#">제목3</a></li>

					</ul>
				</div>
			</div>

			<div class="col-md-6 main-content">
				<div class="span4 plan">
					<h4 align="center">영업팀</h4>

					<ul>
						<li class="plan-feature"><a href="#">제목1</a></li>
						<li class="plan-feature"><a href="#">제목2</a></li>
						<li class="plan-feature"><a href="#">제목3</a></li>

					</ul>
				</div>
			</div>
		</div>

		<div class="row"
			style="margin-top: 5em; margin-left: 10%; margin-right: 10%; margin-bottom: 10%">
			<div class="col-md-1 main-content"></div>
			<div class="col-md-10 main-content" align="center">
				<div id='wrap'>
					<div id='calendar'></div>
					<div style='clear: both'></div>
				</div>
			</div>
			<div class="col-md-1 main-content"></div>
		</div>

	</div>

	<!-- 
	<header style=" height: 60px; directionsplay: flex;"> <nav
		style="margin-top: 21px; height: 60px; ">
	<div style="width: 10%; float: left; text-align: right;">
		<img src="resources/images/main/comSymbol.png">
	</div>

	<div style="width: 30%; float: left; text-align: left;">
		<h1 style="margin-top: 7px; color: #004554">Toronto OpenSource</h1>
	</div>
	<div class="topnav">
		<a href="#home" style="width: 10%;">Home</a> <a href="#news"
			style="width: 10%;">News</a> <a href="#contact" style="width: 10%;">Team</a>
		부트 스트랩 드롭다운   경영지원팀  인사팀 등 각종 팀 넣을 것
		<a href="#about" style="width: 10%;">About</a> <a href="#about"
			style="width: 10%;">문의</a>
	</div>
	</nav> </header>


	<div id="mainimage"></div>
	<div class="blur">
		<div class="blurtext">
			<h1 style="font-size: 32px;">Toronto OpenSource</h1>
			<p style="font-size: 18px;">글로벌 시대의 트렌드를 선도합니다</p>
		</div>
	</div>

	<div class="main2">
		<h1 style="width: 200px; margin: 0px;">PRACTICE</h1>
		<p>전문분야</p>
	</div>
	<div class="container1">
		<div class="txtbox1">
			<div class="txtbox2">
				<ul class="middle-nav">
					<li><a class="active" href="#home" id="middle-menu">공지사항</a></li>
					<ul class="middle-list">
						<li id="noticeList"><span class="ntDPT">경영지원팀</span> <a
							href="http://www.donga.ac.kr/MM_PAGE/SUB007/SUB_007001.asp?PageCD=007001&amp;BIDX=15&amp;NUM=2267900"
							target="_blank">한국대학사회봉사협의회 5기 월드프렌즈 청년 중기봉사단원 모집 안내</a> <span>2018.05.01
								~ 2018.05.16</span></li>
						<li id="noticeList"><span class="ntDPT">경영지원팀</span> <a
							href="http://www.donga.ac.kr/MM_PAGE/SUB007/SUB_007001.asp?PageCD=007001&amp;BIDX=15&amp;NUM=2267900"
							target="_blank">한국대학사회봉사협의회 5기 월드프렌즈 청년 중기봉사단원 모집 안내</a> <span>2018.05.01
								~ 2018.05.16</span></li>
						<li id="noticeList"><span class="ntDPT">인사팀</span> <a
							href="http://www.donga.ac.kr/MM_PAGE/SUB007/SUB_007001.asp?PageCD=007001&amp;BIDX=15&amp;NUM=2267900"
							target="_blank">한국대학사회봉사협의회 5기 월드프렌즈 청년 중기봉사단원 모집 안내</a> <span>2018.05.01
								~ 2018.05.16</span></li>
						<li id="noticeList"><span class="ntDPT">개발팀</span> <a
							href="http://www.donga.ac.kr/MM_PAGE/SUB007/SUB_007001.asp?PageCD=007001&amp;BIDX=15&amp;NUM=2267900"
							target="_blank">한국대학사회봉사협의회 5기 월드프렌즈 청년 중기봉사단원 모집 안내</a> <span>2018.05.01
								~ 2018.05.16</span></li>
						<li id="noticeList"><span class="ntDPT">경영지원팀</span> <a
							href="http://www.donga.ac.kr/MM_PAGE/SUB007/SUB_007001.asp?PageCD=007001&amp;BIDX=15&amp;NUM=2267900"
							target="_blank">한국대학사회봉사협의회 5기 월드프렌즈 청년 중기봉사단원 모집 안내</a> <span>2018.05.01
								~ 2018.05.16</span></li>
					</ul>
					<li><a href="#news" id="middle-menu">업무관리</a></li>
					<li><a href="#contact" id="middle-menu">일정관리</a></li>
					<li><a href="#about" id="middle-menu">자유게시판</a></li>
					<a class="plusList" href="#"></a>
				</ul>
				</nav>
			</div>
		</div>
	</div>
 -->
</body>
</html>
