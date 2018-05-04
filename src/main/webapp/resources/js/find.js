//아이디 비밀번호 찾기
function findFunction() {
	
	var eNum = $("input[name=employeeNumber]").val();
	$.ajax({
	type : 'post',
	data : {employeeNumber:eNum},
	dataType : 'text',
	url : '/proto/find_PW',
	
	success : function(result){
		var empEmail = result;
		
		if(empEmail != 'not'){
			$('#Message').html('<font color="#000000"> '+empEmail+' </font><font color="#9fc3f8">로 비밀번호를 전송했습니다</font>')
		
			setTimeout("document.find.submit()",10000);
		}else{
			$('#Message').html('<font color="#9fc3f8">번호를 다시 한번 확인해 주세요</font>')
			
		}
		
		
	},
	error : function(xhr, status, e){
		$('#Message').html('<font color="#9fc3f8">번호를 다시 한번 확인해 주세요</font>')
	}
	
});
}