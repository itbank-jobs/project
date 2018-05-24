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

}

td {
	width: 70px;
	height: 70px;

}

.chess {
	background: #FFDD73;
}

.red {
	background: #C98500;
}

.availMoveChess, .availMoveRed{
	background: #B1DB4E;
}


img {
	width: 70px;
	height: 70px;
}

</style>

<script type="text/javascript">
	
	var isClicked = false; 												// 기물 잡고 놓는거 확인 하기 위한 값
	var id;																// 현재 좌표값
	var numId;															// id숫자로 변환
	var pre;															// 나중에 바꾸기 위해 저장 해놓는 기물 좌표값 	
	var turn = "W";														// 차례
	var piecePath;														// 이미지 소스 경로 저장
	var pieceFullName;
	var pieceName;
	var pieceColor = "";														// 기물 색

	var moveable;														// 움직일 수 있는 자리 저장 하는 배열


// 앙파상 위한 변수	
	var enPassantId = 0; 
	var enPassantCount = 0;
	

// 캐슬링을 위한 변수
	var rookArr = [false, false, false, false]; 						// 흑 퀸킹, 백 퀸킹
	var rookIdArr = [11, 18, 81, 88];									// 룩 아이디값. 순서는 위와 동일
	var kingArr = [false, false];										// 흑 킹, 백 킹
	
	$(document).ready(function(){
		$('.chess').click(function(){									// 기물 클릭 했을때 기능
			
			id = $(this).attr('id'); 									// 클릭된 자리의 좌표 값
			numId  = id * 1;
			
			if(isClicked == false){										// 처음 클릭 되었을때 (기물을 집었을 떄)
				piecePath = $("#" + id).children('img').attr("src");	// 이미지 전체 경로
				
				if(piecePath != " "){									// 선택된 자리가 빈칸이 아닐경우
					pieceFullName = piecePath.split("/", 3)[2].split('.', 1) + "";	// 기물 이름 이름 ex) Wpawn
					pieceName = pieceFullName.substring(1);
					pieceColor = pieceFullName.charAt(0);
					
					if(pieceColor == turn){								// 선택된 기물이 차례에 맞는 쪽의 기물일 경우
						pre = numId;										// 다음 수에 지울 원래 위치
						
						isClicked = true;								// 집었다로 바꿔줌
						moveCheck();									// 선택된 기물의 움직임 가능한 위치 확인
					} else if  (pieceColor != turn){					// 자신의 차례가 아닐 경우
						alert("it's not your turn");
					}
				}	
			} else {													// 기물이 집어져 있는 상태
					if (move()){										// 움직임 가능한지 확인후 가능하다면 기물을 옮긴 후에 true를 리턴
						
						enPassantCount++;								// 앙파상을 위한 카운터	
						enPassant();									// 앙파상이 가능한지 확인
						
						if(pieceName == "rook")
							rookMovedCheck();
						
						if(pieceName == "king"){
							kingMovedCheck();
							castling();
						}
						
						turn = (turn == 'W') ? 'B' : 'W';				// 차례 바꾸기
					} 
					
					showAvailMove(2);									// 움직임 가능 위치 표시 다시 지우기
					
					isClicked = false;									// 기물 놓기
					moveable = null;									// moveable 배열 초기화
			} 
		});
	
		init();															// 시작 기물 위치	
	});
	//pawn move 추가 ex) 프로모션, king에다가 check, checkmate확인 캐슬링
	function moveCheck(){
		
		moveable = new Array();											// moveable Array초기화
		var count = 0;													// moveable 배열의 카운터 초기화
		var tmp; 														//움직일 자리 임시 저장(function parameter로 이용하기 위해)
		
		
		if(pieceName == "pawn"){											// 기물 이름이 pawn 일때
			pawnMove(tmp, count);
		} else if (pieceName == "rook"){									
			rookMove(tmp, count);
		} else if (pieceName.endsWith("knight")){	
			nightMove(tmp, count)
		} else if (pieceName == "bishop"){
			bishopMove(tmp, count, 0);
		} else if (pieceName == "queen"){
			count = rookMove(tmp, count, 0);
			bishopMove(tmp, count, 0);
		} else if (pieceName == "king"){
			count = rookMove(tmp, count, 1);
			count = bishopMove(tmp, count, 1);
			castlingCheck(count);
		} else{
			alert("imp");
		}
		
		return showAvailMove(1);								// 움직일 수 있는 위치 표시
	}
	
	function showAvailMove(flag){										// 움직 일 수 있는 위치 표시 또는 삭제
		
		var tmp = $("#" + moveable[i]).attr("class") + "";
		var tmp2 = " ";
		
		if(moveable.length != 0){
			if(flag == 1){
				for(var i = 0; i < moveable.length; i++){	
					if(tmp.endsWith("red") ){
						$("#" + moveable[i]).addClass('availMoveRed');	
					} else {
						$("#" + moveable[i]).addClass('availMoveChess');	
					}
				}
			} else {
				for(var i = 0; i < moveable.length; i++){
					if(tmp.endsWith("red")){
						$("#" + moveable[i]).removeClass('availMoveRed');
					} else {
						$("#" + moveable[i]).removeClass('availMoveChess');	
					}
				}	
			}
		}
	}

	function move(){													// 기물 위치 옮기고 원래 있던 자리 빈칸으로
		
		for(var i = 0; i < moveable.length; i++){
			if(id == moveable[i]){
			
				$("#" + moveable[i]).html("<img src = " + piecePath + ">");	
				$("#" + pre).html("<img src = ' '>");
				return true;
			}			
		}
		
		return false;
	}
	
	function isBlank(id){
		
		if($("#" + id).children('img').attr("src") == ' '){
			
			return true;
		} 
		
		return false;
	}
	
	function isOurTeam(checkId){										// 우리 팀인지 확인
		
		if($("#" + checkId).children('img').attr("src") == " ")
			return false;
		
		var check = $("#" + checkId).children('img').attr("src").split("/", 3)[2].charAt(0);
		
		if(pieceColor == check){
			
			return true;
		} 
		
		return false;
		
	}
	
	function enPassant(){
		
		if(pieceName == "pawn" && enPassantCount == 2){
			if(id == enPassantId){
				
				var tmp;
				
				if(turn == 'W'){
					tmp = id * 1 + 10;
				} else {
					tmp = id * 1 - 10;
				}
				
				$("#" + tmp).html("<img src = ' '>");
			}
			enPassantId = 0;				
		}	
	}
	
	function isOOR(id){													// 범위를 벗어나는지 아닌지 확인
		
		if(id % 10 > 8 || id % 10 < 1 || id < 10 || id > 90){
			return true;
		}
	
		return false;
	}
	
	function available(tmp, count){
		//일단 범위 벗어나는지 체크
		if(!isOOR(tmp)){
			if(isBlank(tmp)){
				moveable[count] = tmp;
				count++;
				return true;
			} else if(!isOurTeam(tmp)){
				moveable[count] = tmp;
				count++;
			}
		}
		
		return false;
	}
	
	function pawnMove(tmp, count){
		var catchArr = new Array();												// 잡을 수 있는 기물 위치 저장 (0이 왼쪽 위 1이 오른쪽 위)		
		
		if(pieceColor == "W"){											// 흰색일경우	
			tmp = numId - 10; 										// 현재보다 한칸 앞의 id값
			
	 		catchArr[0] =  (numId - 10  > 0 && numId % 10 - 1 > 0) ? numId - 11 : 0; // 왼쪽 위 기물
	 		catchArr[1] =  (numId - 10  > 0 && numId % 10 + 1 < 9) ? numId - 9 : 0;  // 오른쪽 위 기물
	 		
	 		for(var i = 0; i < 2; i ++){
	 			if(catchArr[i] != 0 && !isBlank(catchArr[i]) && !isOurTeam(catchArr[i])){ 	// 왼쪽 위가 범위를 안벗어 나며 빈칸이 아니고
																									// 그 위치의 기물이 우리 팀이 아닐 경우							
						moveable[count] = catchArr[i];
						count++;		
				}
	 		}
			
			if(isBlank(tmp)){										// tmp 자리가 빈칸일 경우
				moveable[count] = tmp;								// moveable에 좌표 추가
				count++;
			}
			
			if(Math.floor(id / 70) == 1 && isBlank(numId - 20) == true){	// 폰의 첫 움직임일 경우 (두칸 움직임 가능, 앙파상 체크)
				moveable[count] = numId - 20;
				count++;
				enPassantCount = 0;
				enPassantId = numId - 10;
			}
		
		} else {													//검정색일경우
			tmp = numId + 10;
			
			catchArr[0] =  (numId + 10  < 90 && numId % 10 - 1 > 0) ? numId + 9 : 0; // 왼쪽 아래 기물
			catchArr[1] =  (numId + 10  < 90 && numId % 10 + 1 < 9) ? numId + 11 : 0; // 오른쪽 아래 기물
		
			for(var i = 0; i < 2; i ++){
	 			if(catchArr[i] != 0 && !isBlank(catchArr[i]) && !isOurTeam(catchArr[i])){ 	// 왼쪽 위가 범위를 안벗어 나며 빈칸이 아니고
																									// 그 위치의 기물이 우리 팀이 아닐 경우							
						moveable[count] = catchArr[i];
						count++;		
				}
	 		}
			
			if(isBlank(tmp)){
				moveable[count] = tmp;
				count++;
			}		
			if(Math.floor(id / 20) == 1 && isBlank(numId + 20) == true){
				moveable[count] = numId + 20;
				count++;
				enPassantCount = 0;
				enPassantId = numId + 10;
			}
			
		
		}	
		
		if(enPassantId != 0 && enPassantCount == 1){								// 앙파상 식
			
			for(var i = 0; i < 2; i ++){
				if(enPassantId == catchArr[i]){
					moveable[count] = catchArr[i];
					count++;
				} 
	 		}
		} 
	}
	
	function rookMove(tmp, count, flag){

		var stop1 = false;
		var stop2 = false;
		var stop3 = false;
		var stop4 = false;
		
		var rookCount = 1;
		
		while(!(stop1 == true && stop2 == true && stop3 == true && stop4 == true)){
			
			if(stop1 == false){
				
				tmp = numId - rookCount * 10;
	
				if(!available(tmp, count)){
					
					stop1 = true;
				} 
					
				count++;			
			}
			
			if(stop2 == false){
				
				tmp = numId + rookCount * 10;

				if(!available(tmp, count)){
					
					stop2 = true;
				} 
					
				count++;	
			}
			
			if(stop3 == false){
				
				tmp = numId % 10 - rookCount;
				var tmp2 = Math.floor(numId / 10) * 10 + tmp; 

				if(!available(tmp2, count)){
					
					stop3 = true;
				} 
					
				count++;	
			}
			
			if(stop4 == false){
				
				tmp = numId % 10 + rookCount;
				var tmp2 = Math.floor(numId / 10) * 10 + tmp;
				
				if(!available(tmp2, count)){
					
					stop4 = true;
				} 
					
				count++;	
			}
			
			rookCount++;
			if (flag == 1){
				break;
			}
		}
		
		return count;
	}
	
	function bishopMove(tmp, count, flag){
		
		var stop1 = false;
		var stop2 = false;
		var stop3 = false;
		var stop4 = false;
		
		var bishopCount1 = 1;
		var bishopCount2 = 1;
		
		while(!(stop1 == true && stop2 == true && stop3 == true && stop4 == true)){
			
			if(stop1 == false){
				tmp = numId - bishopCount1 * 10 - bishopCount2;
				
				if(!available(tmp, count)){
					
					stop1 = true;
				} 
					
				count++;			
			}
			
			if(stop2 == false){
				tmp = numId - bishopCount1 * 10 + bishopCount2;

				if(!available(tmp, count)){
					
					stop2 = true;
				} 
					
				count++;	
			}
			
			if(stop3 == false){	
				tmp = numId + bishopCount1 * 10 - bishopCount2;
				
				if(!available(tmp, count)){
					
					stop3 = true;
				} 
					
				count++;		
			}
			
			if(stop4 == false){
				tmp = numId + bishopCount1 * 10 + bishopCount2;
				
				if(!available(tmp, count)){
					
					stop4 = true;
				} 	
				count++;
			}
			
			bishopCount1++;
			bishopCount2++;
			
			if (flag == 1){
				break;
			}
		}
		
		return count;
	}
	
	function nightMove(tmp, count){
		var knightCount1 = -1;
		var knightCount2 = -2;
		
		for(var i = 1; i < 9; i++){
			
			tmp = numId + knightCount1 * 10 + knightCount2;
			
			available(tmp, count);
			count++;
			
			knightCount2 *= -1;
			
			if(i == 4){
				knightCount1 = -2;
				knightCount2 = -1;
			} else if(i % 2 == 0){
				knightCount1 *= -1;
			}
		}
	}
	
	function rookMovedCheck(){
		
		for(var i = 0; i < rookArr.length; i++){
			
			if(id != pre && rookIdArr[i] == pre){
				
				rookArr[i] = true;
				break;
			}
		}	
	}
	
	function kingMovedCheck(){
		
		for(var i = 0; i < kingArr.length; i++){
			
			if(id != pre && kingArr[i] == pre){
				
				kingArr[i] = true;	
				break;
			}
		}	
	}
	
	function castlingCheck(count){		
		for(var i = 0; i < rookIdArr.length; i++){			
			var blankCounter;
					
			if(numId - 4 == rookIdArr[i] && rookArr[i] == false){
				blankCounter = true;
				for(var j = 1; j < 4; j++){
					if(!isBlank(numId - j)){
						blankCounter = false;
						break;
					}
				}
				
				if(blankCounter == true){
					
					moveable[count] = numId - 2;
					count++;
				}
				
			}
			
			if(numId + 3 == rookIdArr[i] && rookArr[i] == false){
				blankCounter = true;
				for(var j = 1; j < 3; j++){
					if(!isBlank(numId + j)){
						blankCounter = false;
						break;
					}
				}
				
				if(blankCounter == true){
					
					moveable[count] = numId + 2;
					count++;
				}
			}
		}
	}

	function castling(){
		
		var rook;
		var rookId;
		
		if(numId == pre - 2){
			rookId = numId - 2;
			rook = $("#" + rookId).children('img').attr("src");
			alert(rookId + "src = " + rook);
			
			$("#" + numId + 1).html('<img src = "' + rook + '">');	
			$("#" + rookId).html("<img src = ' '>");
		}
		
		if(numId == pre + 2){
			rookId = numId + 1;
			rook = $("#" + rookId).children('img').attr("src");
			
			alert(rookId + "src = " + rook);
			
			$("#" + numId - 1).html('<img src = "' + rook + '">');	
			$("#" + rookId).html("<img src = ' '>");
			console.log(rookId);
		}
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
	
	//<c:if test="${(i.count+j.count)%2==1}">style = "background-color : blue"</c:if>
</script>

</head>
<body>
	<table class="chessboard">

		<c:forEach begin="0" end="7" varStatus="i">
			<tr>
				<c:forEach begin="0" end="7" varStatus="j">
					<td><div id="${i.count}${j.count}" <c:choose>
					<c:when test="${(i.count+j.count)%2==1}"> class="chess red"</c:when>
					<c:otherwise>class="chess"</c:otherwise> 
				</c:choose>><img src = " "></div></td>
				</c:forEach>
				
				
				
			</tr>
		</c:forEach>
	</table>
	
</body>
</html>