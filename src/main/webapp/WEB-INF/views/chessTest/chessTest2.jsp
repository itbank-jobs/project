<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<style>
html, body {
	width: 100%;
	height: 100%;
	padding: 0;
	margin: 0;
	font-family: sans-serif;
}
0
#chessboard {
	max-height: 455px;
	max-width: 455px;
	width: 100%;
	height: 100%;
	position: relative;
	margin: 20px;
	margin: 20px auto;
}

div * {
	padding: 0;
	margin: 0;
	box-sizing: border-box;
}

#cellprefix {
	width: 100%;
	height: 100%;
	max-height: 40px;
	max-width: 40px;
	float: left;
	margin: 5px;
	padding: 15px 0 0 20px;
}

.red {
	background: #FFC19E;
}

.review {
	position: fixed;
	width: 300px;
	height: 1000px;
	background-color: #09090a61;
	top: 0;
	right: 0;
}

img {
	border: 1px solid #00a4a2;
	width: 100%;
	height: 100%;
	max-height: 50px;
	max-width: 50px;
	float: left;
	/* margin: 3px; */
	transition: all 0.5s ease-in-out;
	border-radius: 5px;
	/* 	padding: 0 0 0 6px;
 */
	font-size: 30pt;
	cursor: pointer;
	z-index: 1;
}

img :hover {
	color: #fff;
	background: #B2CCFF;
	z-index: 2;
	transform: translate(10px, -10px);
	animation: solution 1.5s ease-in-out infinite alternate;
}

img {
	width: 50px;
	height: 50px;
}
</style>

<script type="text/javascript">
	$(document).ready(function() {
		

		var piece;
		var pre;
		var isClicked = false;
		var changeTurn;
		var turn = "W";
		var id;
		var srcName;
		var pieceName;
		var moveable;

		$('.chess').click(function() {
			id = $(this).attr('id');
			alert(id);

			if (isClicked == false) {

				piece = $("#" + id).children('img').attr("src"); // 해당 테이블 이미지 소스 경로
				srcName = piece.split("/", 3)[2];
				pieceName = srcName.split('.', 1);

				if (piece != " " && srcName.charAt(0) == turn) {

					pre = id;// 다음 수에 지울 원래 위치

					isClicked = true;
					moveable = moveCheck(pieceName, id);
	
				} else if (srcName.charAt(0) != turn) {
					alert("it's not your turn")
				}

			} else {
				changeTurn = move(moveable, id, pre, piece);

				if (changeTurn == true) {

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
	function moveCheck(pieceName, id) {
		pieceName += "";
		var color = pieceName.charAt(0);
		var piece = pieceName.substring(1);

		//		alert(color + "색" + piece);

		var moveable = new Array();
		var count = 0;
		var numId = id * 1;

		//pawn move 추가 ex) 앙파상, 프로모션, 상대 기물 잡기.

		//pawn
		if (piece == "pawn") {
			//흰색일경우			
			if (color == "W") {
				moveable[0] = numId - 10;

				if (Math.floor(id / 70) == 1) {
					moveable[1] = numId - 20;
				}

				//검정색일경우
			} else {
				moveable[0] = numId + 10;

				if (Math.floor(id / 20) == 1) {
					moveable[1] = numId + 20;
				}
			}
		}

		//rook일경우
		else if (piece == "rook") {
			alert("rook");

			var stop1 = false;
			var stop2 = false;
			var stop3 = false;
			var stop4 = false;

			var rookCount = 1;

			while (!(stop1 == true && stop2 == true && stop3 == true && stop4 == true)) {

				var tmp;

				if (stop1 == false) {

					tmp = numId - rookCount * 10;
					alert("stop1 " + tmp);

					if (isBlank(tmp) == false || tmp < 0) {

						stop1 = true;
					} else {

						moveable[count] = tmp;
						count++;
					}

				}

				if (stop2 == false) {

					tmp = numId + rookCount * 10;
					alert("stop2 " + tmp);

					if (isBlank(tmp) == false || tmp > 8) {

						stop2 = true;
					} else {

						moveable[count] = tmp;
						count++;
					}
				}

				if (stop3 == false) {

					tmp = numId % 10 - rookCount * 10;
					alert("stop3 " + tmp);

					if (isBlank(tmp) == false || tmp < 0) {

						stop3 = true;
					} else {

						moveable[count] = tmp;
						count++;
					}
				}

				if (stop4 == false) {

					tmp = numId % 10 + rookCount * 10;
					alert("stop4 " + tmp);

					if (isBlank(tmp) == false || tmp > 8) {

						stop4 = true;
					} else {

						moveable[count] = tmp;
						count++;
					}
				}

				rookCount++;
			}

		} else {
			alert("imp");
		}
		for (var i = 0; i < moveable.length; i++) {

			$("#" + moveable[i]).html("<img src = 'resources/images/dot.png'>");
		}

		return moveable;
	}

	function move(moveable, id, pre, piece) {
		var changeTurn = false;

		for (var i = 0; i < moveable.length; i++) {

			if (id == moveable[i]) {

				$("#" + moveable[i]).html("<img src = " + piece + ">");
				$("#" + pre).html("<img src = ' '>");
				changeTurn = true;
				continue;
			}

			$("#" + moveable[i]).html("<img src = ' '>");
		}

		return changeTurn;
	}


	function isBlank(id) {

		if ($("#" + id).children('img').attr("src") == ' ') {

			return true;
		}

		return false;
	}

	function mapId(id) {

		var numId = id * 1;
		var alphabet = String.fromCharCode(64 + numId % 10);
		var frontN = Math.floor(numId / 10);
		var result = "";

		result += alphabet;
		result += 9 - frontN;
		
		$("#result").append(result);
	}

	function init() {
		for (var i = 1; i < 9; i++) {
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
	<div id="chessboard">
		<c:forEach begin="1" end="8" varStatus="i">
			<fmt:formatNumber value="${9-i.count}" type="number" var="cnt" />
			<div id=cellprefix>${cnt}</div>
			<c:forEach begin="1" end="8" varStatus="j">
				<c:choose>

					<c:when test="${(i.count+j.count)%2==1}">
						<div id="${i.count}${j.count}" class="chess red" onclick="mapId(${i.count}${j.count})">
							<img src=" ">
						</div>
					</c:when>

					<c:otherwise>
						<div id="${i.count}${j.count}" class="chess" onclick="mapId(${i.count}${j.count})">
							<img src=" ">
						</div>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</c:forEach>
		<div id='cellprefix'></div>
		<c:set var="alphabet" value="${['A','B','C','D','E','F','G','H']}"
			scope="application" />
		<c:forEach begin="0" end="7" var="list" items="${alphabet }">

			<div id='cellprefix'>${list}</div>
		</c:forEach>
	</div>

	<div class="review" id="result">
	
	</div>

</body>
</html>