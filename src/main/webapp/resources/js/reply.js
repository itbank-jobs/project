$(function(){
	$('#btnReply').on('click',function(){

		 var replytext = $("#replytext").val;
	     /*var bno = "${content.num}";*/
		 var bno = $("#num").val;
	     var param = {"replytext" : replytext, "bno":bno};
	     
	     $.ajax({
	         type : "post",
	         url : '/proto/insertReply',
	         data : param,
	         error: function() {
	            alert("efdkdjkl?")
	         },
	         success : function(){
	            alert("댓글이 등록 되었습니다.")
	         
	      }
	   })
	})
})
