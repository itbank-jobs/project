//숫자만 인코딩 소스 

function encodingNum(event) {
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if ( keyID == 8 ) 
		return;
	else
		event.target.value = event.target.value.replace(/[^0-9]/g, "");
}

// email 형식 인코딩 소스

function encodingEmail(event) {
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if ( keyID == 8 || keyID == 45 || keyID == 46 || keyID == 64 || keyID == 95)
		return;
	else
		event.target.value = event.target.value.replace(/[^A-Za-z0-9|-|-|@|_|.]/g, "");
}

//[이름] 한글+영어 인코딩 
function encodingName(event) {
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if ( keyID == 8)
		return;
	else
		event.target.value = event.target.value.replace(/[^A-Za-z|ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, "");
}