<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>


<div style="-ms-overflow-style: none;">
	<!--스크롤바 없이 스크롤 가능하게 함   -->
	<nav
		class="navbar navbar-default navbar-doublerow navbar-trans navbar-fixed-top">
		<!-- top nav -->

		<!-- 768px 이상 동작   -->
		<nav class="navbar navbar-top hidden-xs">
			<div class="container">
				<!-- left nav top -->
				<ul class="nav navbar-nav pull-left">
					<li id="home"><a href="typeB"><span class="text-white"><i
								class="fa fa-home"></i>&nbspHome</span></a></li>
					<li id="new"><a href="#"><span class="text-white"><i
								class="fa fa-newspaper-o"></i>&nbsp News</span></a></li>
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
		</nav>
		<!------------------>


		<!-- 768px 이하 동작   -->
		<nav id="mobile" class="hidden-view navbar navbar-top">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<div class="navbar-brand" style="color: #fff;">Project</div>
				</div>

				<div class="navbar-collapse collapse" id="navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li id="home"><a href="typeB"><span class="text-white"><i
									class="fa fa-home"></i>&nbspHome</span></a></li>

						<li class="dropdown"><a style="background-color: #00000000"
							href="#" class="dropdown-toggle" data-toggle="dropdown"
							role="button" aria-expanded="false"><span class="text-white"><i
									class="fa fa-newspaper-o"></i>&nbsp News</span><span class="text-white"><span
									class="caret"></span></span></a>

							<ul class="dropdown-menu" role="menu">
								<li><a style="color: #fff" href="news">공지사항</a></li>
								<li><a style="color: #fff" href="event">행사</a></li>
								<li class="divider"></li>
							</ul></li>

						<li class="dropdown"><a style="background-color: #00000000"
							href="#" class="dropdown-toggle" data-toggle="dropdown"
							role="button" aria-expanded="false"><span class="text-white"><i
									class="fa fa-users"></i>&nbsp Team</span> <span class="text-white"><span
									class="caret"></span></span> </a>
							<ul class="dropdown-menu" role="menu">
								<li><a style="color: #fff" href="list?teamNum=1">경영지원팀</a></li>
								<li><a style="color: #fff" href="list?teamNum=2">인사팀</a></li>
								<li><a style="color: #fff" href="list?teamNum=3">개발팀</a></li>
								<li><a style="color: #fff" href="list?teamNum=4">영업팀</a></li>
							</ul></li>
						<hr color="white">
						<li><a href="settings" class="text-white"><i
								class="fa fa-cog"></i>&nbspSettings</a></li>
						<li><a href="logout" class="text-white"><i
								class="fa fa-power-off"></i>&nbspLogout</a></li>
						<hr color="white">
						<li class="chatON"><span class="text-white"><i
								class="fa fa-wechat"></i>&nbsp Messenser</span></li>
						<hr color="white">
					</ul>

				</div>
			</div>
		</nav>
		<!------------------>


		<div class="dividline light-grey hidden-xs"></div>
		<!-- down nav -->
		<nav class="navbar navbar-down">
			<div class="container">
				<div class="flex-container hidden-xs">
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