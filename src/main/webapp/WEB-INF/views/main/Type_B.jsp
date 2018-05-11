<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<link media="all" type="text/css" rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/css/main.css">
<script type="text/javascript">
//toggle class scroll 
$(window).scroll(function() {
    if($(this).scrollTop() > 200)
    {
        $('.navbar-trans').addClass('afterscroll');
    } else
    {
        $('.navbar-trans').removeClass('afterscroll');
    }  

});
  
// demo only 
// open link in new tab without ugly target="_blank"
$("a[href^='http']").attr("target", "_blank");


$(document).ready(function(){
    $("#home").click(function(){
        $("#h").toggle(1000);
    });
    $("#new").click(function(){
        $("#n").toggle(1000);
    });
    $("#team").click(function(){
        $("#t").toggle(1000);
    });
    
});
</script>

<title>Insert title here</title>
</head>


<body style="overflow: hidden;">




<nav class="navbar navbar-default navbar-doublerow navbar-trans navbar-fixed-top">
  <!-- top nav -->
  <nav class="navbar navbar-top hidden-xs">
    <div class="container">
      <!-- left nav top -->
      <ul class="nav navbar-nav pull-left">
        <li id="home"><a href="#"><span class="text-white"><i class="fa fa-home"></i>Home</span></a></li>
        <li id="new"><a href="#"><span class="text-white">New</span></a></li>
        <li id="team"><a href="#"><span class="text-white">Team</span></a></li>
        
      </ul>
      <!-- right nav top -->
      <ul class="nav navbar-nav pull-right">
        <li><a href="#" class="text-white">Settings</a></li>
        <li><a href="#" class="text-white">Logout</a></li> 
      </ul>
    </div>
    <div class="dividline light-grey"></div>
  </nav>
  <!-- down nav -->
  <nav class="navbar navbar-down">
    <div class="container">
      <div class="flex-container">  
        <div class="navbar-header flex-item">
          <div class="navbar-brand">Project</div>
        </div>
        <ul id="h" class="nav navbar-nav flex-item hidden-xs" style="display: none;">
          <li><a href="view">Type - A</a></li>
          <li><a href="#">Type - B</a></li> 

        </ul>
        
        <ul id="n" class="nav navbar-nav flex-item hidden-xs" style="display: none;">
          <li><a href="#">공지사항</a></li>
          <li><a href="#">행사</a></li> 

        </ul>
        
        <ul id="t" class="nav navbar-nav flex-item hidden-xs" style="display: none;">
          <li><a href="#">경영지원팀</a></li>
          <li><a href="#">인사팀</a></li> 
          <li><a href="#">개발팀</a></li> 
          <li><a href="#">영업팀</a></li> 
        </ul>
        <ul class="nav navbar-nav flex-item hidden-xs pull-right">
          <li><a href="#">Messenser</a></li> 
        </ul>
        </div>  
      </div>
    </nav>
  </nav> 
<!--bg img  -->
<header>
    <img src="https://d2lm6fxwu08ot6.cloudfront.net/img-thumbs/960w/J70T3LHQ2O.jpg" style="width:100%">
</header>    
</body>
</html>