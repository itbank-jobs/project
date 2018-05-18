<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<style>
.chessboard {
	padding: 0px;
	border: 1px solid black;
}

td {
	width: 50px;
	height: 50px;
	border: 1px solid #444444;
}

img {
	width: 50px;
	height: 50px;
}
</style>

<script type="text/javascript">
	$(document).ready(function(){
	

		var piece;
		var pre;
		var isClicked = false;
		var changeTurn;
		var turn = "W";
		var id;
		var srcName;
		var pieceName;
		var moveable;
		
		$('.chess').click(function(){
			
			id = $(this).attr('id');
			
			if(isClicked == false){
				
				piece = $("#" + id).children('img').attr("src"); // 해당 테이블 이미지 소스 경로
				srcName = piece.split("/", 3)[2];			
				pieceName = srcName.split('.', 1);
				
				if(piece != " " && srcName.charAt(0) == turn){

						pre = id;// 다음 수에 지울 원래 위치
						
						isClicked = true;
						moveable = moveCheck(pieceName, id);
						alert(moveable);
					} else if  (srcName.charAt(0) != turn){
						alert("it's not your turn");
					}
				
			} else {
					changeTurn = move(moveable, id, pre, piece);
					
					if (changeTurn == true){
						turn = (turn == 'W') ? 'B' : 'W';	
					} else {
						alert("invalid move");
					}	
					
					isClicked = false;
					moveable = null;
			} 
		});
		
		//init
		init();
		
	});

	//다른 기물들 움직임 추가, 체크 또는 체크메이트 추가. 나이트 빼고는 상대 기물 못넘게.
	function moveCheck(pieceName, id){
	 
		pieceName += "";
		var color = pieceName.charAt(0);
		var piece = pieceName.substring(1);
		
//		alert(color + "색" + piece);
		
		var moveable = new Array();
		var count = 0;
		var numId = id * 1;
		var tmp; //움직일 자리 임시 저장(function parameter로 이용하기 위해)
		
		//pawn move 추가 ex) 앙파상, 프로모션, 상대 기물 잡기.
		
		//pawn
		if(piece == "pawn"){

			var catch1;
			var catch2;

			//흰색일경우			
			if(color == "W"){
				tmp = numId - 10;
				
				if(isBlank(tmp)){
					moveable[count] = tmp;
					count++;
				}
				if(Math.floor(id / 70) == 1 && isBlank(numId - 20) == true){
					moveable[count] = numId - 20;
					count++;
				}
				
				catch1 =  (numId - 10  > 0 && numId % 10 - 1 > 0) ? numId - 11 : 0; // 왼쪽 위 기물
				catch2 =  (numId - 10  > 0 && numId % 10 + 1 < 9) ? numId - 9 : 0; // 오른쪽 위 기물
				
					
				if(catch1 != 0 && isBlank(catch1) == false){
					if($("#" + catch1).children('img').attr("src").split("/", 3)[2].charAt(0) == "B"){ //사이드 기물 색 확인
							
						moveable[count] = catch1;
						count++;
					}	
				}
				
				if(catch2 != 0 && isBlank(catch2) == false){
					if($("#" + catch1).children('img').attr("src").split("/", 3)[2].charAt(0) == "B"){ //사이드 기물 색 확인
							
						moveable[count] = catch2;
						count++;
					}	
				}
			
			//검정색일경우
			} else {
				tmp = numId + 10;
				
				if(isBlank(tmp)){
					moveable[count] = tmp;
					count++;
				}		
				if(Math.floor(id / 20) == 1 && isBlank(numId + 20) == true){
					moveable[count] = numId + 20;
					count++;
				}
				
				catch1 =  (numId + 10  < 90 && numId % 10 - 1 > 0) ? numId + 9 : 0; // 왼쪽 아래 기물
				catch2 =  (numId + 10  < 90 && numId % 10 + 1 < 9) ? numId + 11 : 0; // 오른쪽 아래 기물
				
					
				if(isBlank(catch1) == false){
					if($("#" + catch1).children('img').attr("src").split("/", 3)[2].charAt(0) == "W"){ //사이드 기물 색 확인
							
						moveable[count] = catch1;
						count++;
					}	
				}
				
				if(isBlank(catch2) == false){
					if($("#" + catch1).children('img').attr("src").split("/", 3)[2].charAt(0) == "W"){ //사이드 기물 색 확인
							
						moveable[count] = catch2;
						count++;
					}	
				}
			}	
		} 
		
		//rook일경우
		else if (piece == "rook"){
			alert("rook");
			
		
			var stop1 = false;
			var stop2 = false;
			var stop3 = false;
			var stop4 = false;
			
			var rookCount = 1;
			
			while(!(stop1 == true && stop2 == true && stop3 == true && stop4 == true)){
				
				if(stop1 == false){
					
					tmp = numId - rookCount * 10;
					alert("stop1 " + tmp);
					
					if(isBlank(tmp) == false || tmp < 10){
						
						stop1 = true;
					} else {
						
						moveable[count] = tmp;
						count++;
					}
				}
				
				if(stop2 == false){
					
					tmp = numId + rookCount * 10;
					alert("stop2 " + tmp);
					
					if(isBlank(tmp) == false || tmp > 80 ){
						
						stop2 = true;
					} else {
						
						moveable[count] = tmp;
						count++;
					}
				}
				
				if(stop3 == false){
					
					tmp = numId % 10 - rookCount * 10;
					alert("stop3 " + tmp);
					
					if(isBlank(tmp) == false || tmp < 0){
						
						stop3 = true;
					} else {
						
						moveable[count] = tmp;
						count++;
					}
				}
				
				if(stop4 == false){
					
					tmp = numId % 10 + rookCount * 10;
					alert("stop4 " + tmp);
					
					if(isBlank(tmp) == false || tmp > 8){
						
						stop4 = true;
					} else {
						
						moveable[count] = tmp;
						count++;
					}
				}
				
				
				rookCount++;
			}
			
			
		}
		else{
			alert("imp");
		}
		for(var i = 0; i < moveable.length; i++){
			
			$("#" + moveable[i]).html("<img src = 'resources/images/dot.png'>");
		}
		
		return moveable;
	}
	
	function move(moveable, id, pre, piece){		
		var changeTurn = false;
		
		for(var i = 0; i < moveable.length; i++){
			
			if(id == moveable[i]){
			
				$("#" + moveable[i]).html("<img src = " + piece + ">");	
				$("#" + pre).html("<img src = ' '>");
				changeTurn = true;
				continue;
			}		
			
			$("#" + moveable[i]).html("<img src = ' '>");	
		}
		
		return changeTurn;
	}
	
	function isBlank(id){
		
		if($("#" + id).children('img').attr("src") == ' '){
			
			return true;
		} 
		
		return false;
	}

	function init(){
		
		for(var i = 1; i < 9;i++){
			$("#2" + i).html("<img src = 'resources/images/Bpawn.png'>")
			$("#7" + i).html("<img src = 'resources/images/Wpawn.png'>")		
		}		
		
		$("#11").html("<img src='resources/images/Brook.png'>")
		$("#18").html("<img src='resources/images/Brook.png'>")
		$("#81").html("<img src='resources/images/Wrook.png'>")
		$("#88").html("<img src='resources/images/Wrook.png'>")
			
		
		$("#12").html("<img src='resources/images/BLknight.png'>")
		$("#17").html("<img src='resources/images/BRknight.png'>")
		$("#82").html("<img src='resources/images/WLknight.png'>")
		$("#87").html("<img src='resources/images/WRknight.png'>")
		
		$("#13").html("<img src='resources/images/Bbishop.png'>")
		$("#16").html("<img src='resources/images/Bbishop.png'>")
		$("#83").html("<img src='resources/images/Wbishop.png'>")
		$("#86").html("<img src='resources/images/Wbishop.png'>")
		
		$("#14").html("<img src='resources/images/Bqueen.png'>")
		$("#15").html("<img src='resources/images/Bking.png'>")
		$("#84").html("<img src='resources/images/Wqueen.png'>")
		$("#85").html("<img src='resources/images/Wking.png'>")	
	}
</script>

</head>
<body>

	<table class="chessboard">

		<c:forEach begin="0" end="7" varStatus="i">
			<tr>
				<c:forEach begin="0" end="7" varStatus="j">
					<td><div id="${i.count}${j.count}" <c:if test="${(i.count+j.count)%2==1}">style = "background-color : blue"</c:if>class="chess"><img src = " "></div></td>
				</c:forEach>
			</tr>
		</c:forEach>
	</table>
	
</body>
</html>