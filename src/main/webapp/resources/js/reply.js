$(function(){
   $('#registerReply').on('click',function(){

       var replytext = $("#replytext").val();
       var bnum = $("#num").html();
       /*var param = {"replytext" : replytext, "bno":bno};*/
     
        
        $.ajax({
            type : "post",
            data : {replytext:replytext, bnum:bnum},
            url : '/proto/insertReply',
            /*data : param,*/
            
            success : function(result){
            	var tmp = result.split('%');
            	$('#t').append('<tr><td><hr></td><tr>');
            	$('#t').append('<tr><td>작성자</td><td>'+tmp[0]+'</td>');
            	$('#t').append('</tr><tr><td>내용</td><td>'+replytext+'</td></tr>');
            	$('#t').append('<tr><td>등록일</td><td>'+tmp[2]+'</td></tr>');
            	$('#t').append('<tr><td><button type = \"button\" class = \"deleteReply\" id = \"'+tmp[1]+'">삭제</button></td></tr>');
            	$('.deleteReply').on('click',function(){
         		   var bnum = $("#num").html();
         		   var rnum = $(this).attr('id');
         			   
         		   $.ajax({
         			   type : "post",
         			   data : {bnum:bnum, rnum:rnum},
         		   		url : '/proto/replyDelete',
         		   		
         		   	 success : function(result){
      
         	   
         	              alert("댓글이 삭제 되었습니다.");
         	             window.location.reload();
         	             },
         	              error: function(xhr, status, e) {
         	                 alert(e);
         	              }
         		   		
         		   });
         	   })
              },
               error: function(xhr, status, e) {
                  alert(e);
               }
            
         
      }); //ajax
   })
   
   $('.deleteReply').on('click',function(){
	   var bnum = $("#num").html();
	   var rnum = $(this).attr('id');
		   
	   $.ajax({
		   type : "post",
		   data : {bnum:bnum, rnum:rnum},
	   		url : '/proto/replyDelete',
	   		
	   	 success : function(result){
          

              alert("댓글이 삭제 되었습니다.");
              window.location.reload();
              
             },
              error: function(xhr, status, e) {
                 alert(e);
              }
	   		
	   });
   })
});