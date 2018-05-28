<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE >
<html>
<head>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<style>
.chessboard {
	padding: 0px;
	border: 1px solid black;
}
 td {
 	width : 30px;
	height : 30px;
	border: 1px solid #444444;
 }
th{
	
	border: 1px solid #444444;
}
.chess{
	width: 30px;
	height: 30px;	
}
img {
	width: 30px;
	height: 30px;	
}
</style>
<script type = "text/javascript">

$(document).ready(function(){
	var chess;
	var clickCK = false;
	<c:forEach begin="1" end="8" varStatus="Sstatus1">
	<c:forEach begin="1" end="8" varStatus="Sstatus2">
			$('#${Sstatus1.count}${Sstatus2.count}').click(function(){				
				if(clickCK == true){
					$('#${Sstatus1.count}${Sstatus2.count}').html('<img src="resources/images/Wpawn.png">');
					$(chess).html('');
					clickCK = false;
				}else{
						if($('#${Sstatus1.count}${Sstatus2.count}').html()=='<img src="resources/images/Wpawn.png">'){
							chess = '#${Sstatus1.count}${Sstatus2.count}';
							clickCK = true;
						}else{}						
				}
			});
			</c:forEach></c:forEach>
			
		//	for(var i =1 ;i<9;i++){
			//	$('#2'+i).html('<img src="resources/images/Wpawn.png">')
	//	}
});

</script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table class="chessboard">
	<c:forEach begin="1" end="8" varStatus="status1">
	<tr>
	<c:forEach begin="1" end="8" varStatus="status2">
	<td><div id="${status1.count}${status2.count}" class="chess"><c:if test = "${status1.count==1 && status2.count==1}"><img src="resources/images/Wpawn.png"></c:if></div></td>
	</c:forEach>
	</tr>
	</c:forEach>
	</table>
</body>
</html>
