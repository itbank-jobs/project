<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Chess Notation Save Simulator</title>
<style>
body {
	background-color: #fff;
}

form fieldset {
	margin-bottom: 25px;
}

form legend {
	font-size: 15px;
	font-weight: 600;
}

form label.reg {
	font-size: 14px;
	width: 110px;
	color: #390;
	font-weight: bold;
	float: left;
	text-align: right;
	margin-right: 10px;
}

form ul li {
	list-style: none;
	margin: 15px 0;
	font-size: 14px;
}
</style>
</head>
<body>
	<h1>체스 기보 저장 시뮬레이터</h1>
	<form action="NotationList" method=post name="chess">
		<fieldset>
			<legend>Nickname(not ID)</legend>
			<ul>
				<li>
					<!-- <label for="id">학번</label>
        	<input type="text" id="id" autofocus> --> <label for="name">NICKNAME</label>
					<input type="text" id="nickname" name="nickname">
				</li>
				<li><label for="class">Notation</label> <input type="text"
					id="Notation" name="notation"></li>

			</ul>
		</fieldset>
		<input type="submit" value="기보 전송" />
	</form>
</body>
</html>