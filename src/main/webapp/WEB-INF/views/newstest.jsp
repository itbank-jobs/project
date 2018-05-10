<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	  $(".dark").click(function() {
	    $("#feed").addClass('dark');
	  });
	  $(".light").click(function() {
	    $("#feed").removeClass('dark');
	  });
	  var url = 'https://codepen.io/jobs/feed/';
	  
	  $.ajax({
	    type: "GET",
	    url: document.location.protocol + '//api.rss2json.com/v1/api.json?rss_url=' + encodeURIComponent(url),
	    dataType: 'json',
	    error: function() {
	      $("#feed").after("<center>Unable to load feed, Incorrect path or invalid feed</center>");
	    },
	    success: function(xml) {
	      values = xml.items;

	      for (var i = 0, j = values.length; i < j; i++) {
	        // console.log(values[i]);

	        $("#feed").append("<li><a href='" + values[i].link + "' target='_blank'>" + values[i].title + "</a><br><i>" + values[i].author + "</i><a href='" + values[i].link + "' class='apply'  target='_blank'>APPLY</a><div>" + values[i].content + "</div></li>");
	      }
	    }
	  });
	});
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
  background: #aaa  url(https://images.unsplash.com/photo-1456428199391-a3b1cb5e93ab?crop=entropy&fit=crop&fm=jpg&h=975&ixjsv=2.1.0&ixlib=rb-0.3.5&q=80&w=1425) center no-repeat;
  background-size: container;
  background-attachment: fixed;
}

body > h1 {
  color: #fff;
  text-align: center;
  font-family: serif;
  font-size: 55px;
  text-shadow:3px 3px 6px rgba(0,0,0,0.2);
  margin:40px 0 0 0;
}
.opt{
  text-align:right;
  width:95%;
  margin:0 auto;
}
.opt, .opt a{
  text-transform:uppercase;
  color:#666;
  font-size:9px
}
.opt a:hover{
   text-decoration:none;
}
.opt .post{
  background:#999;
  color:#ccc;
  text-decoration:none;
  border-radius:4px;
  padding:5px 10px;
  font-size:10px
}
.opt .post:hover{
  background:#444;
}
#feed {
  margin: 0;
  padding: 0
}

#feed > li {
  position: relative;
  padding: 20px 20px 0px 20px;
  color: #aaa;
  list-style: none;
  background: rgba(255,255,255,0.9);
  margin: 30px 2%;
  box-shadow: 5px 5px 6px 0 rgba(0, 0, 0, 0.2);
  border-radius: 3px;
  transition:all 0.2s;
  overflow:hidden;
  min-height:88px
}

li a {
  color: #08d;
  text-decoration: none;
  font-weight: bold;
  max-width: 80%;
  overflow: hidden
}
li a:hover{
  text-decoration:underline
}
li > div {
  opacity: 0;
  max-height: 0px;
  overflow: hidden;
  padding: 0 10px;
  transition: all 0.2s;
  box-sizing: border-box;
  background: #f5f5f5;
  font-size: 14px;
  margin: 20px auto;
  border:1px solid #ddd;
  color:#666;
  text-align:justify;
  box-shadow: 3px 5px 6px 0px rgba(0, 0, 0, 0.1) inset;
  border-radius: 3px
}
#feed > li:hover{
  padding-bottom:5px;
}
#feed li i{
  position:absolute;
  top:73px;
  left:30px;
  z-index:3;
  font-size:15px;
  transition:all 0.8s;
  display:block;
}
#feed li:hover i{
  opacity:0;
  transition:all 0.2s;
}
#feed li:hover > div {
  padding: 10px;
  max-height: 200px;
  opacity: 1;
  overflow: auto;
  transition:all 0.4s
}
#feed h1,#feed h2{
  font-size:16px
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
.apply:hover{
  background:#06a;
  text-decoration:none
}

#feed.dark > li{
  background:rgba(0,0,0,0.8)
}
#feed.dark li > div{
  background:rgba(0,0,0,0.8);
  border-color:#000;
  color:#aaa
}
</style>
</head>
<body>
	<h1>Job Board</h1>
	<div class="opt">
		<a href="https://codepen.io/jobs/post/" target="_blank" class="post">Post
			a Job</a> Change theme: <a href="#" class="dark">Dark</a> &mdash; <a
			href="#" class="light">Light</a>
	</div>
	<ul id="feed"></ul>
	<div
		style="font-size: 12px; text-align: center; color: #666; background: rgba(0, 0, 0, 0.8); max-width: 100%; width: 100vw; opacity: 0.9; padding: 5px 0;">
		Follow me on <a href="https://twitter.com/nodws" target="_b"
			style="color: #999">Twitter</a> new <a
			href="http://codepen.com/nodws" target="_b" style="color: #999">Pen</a>
		each week
	</div>
</body>
</html>