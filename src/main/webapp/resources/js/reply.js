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
              var chk = result;
              if(chk == 0) {
               alert("댓글이 등록 되었습니다.");
               window.location.reload();
              }},
               error: function(xhr, status, e) {
                  alert(e);
               }
            
         
      }); //ajax
   })
   
   $('#deleteReply').on('click',function(){
	 
	   var bnum = $("#num").html();
	   
	   $.ajax({
		   type : "post",
		   data : {bnum:bnum},
	   		url : '/proto/replyDelete',
	   		
	   	 success : function(result){
             var chk = result;
             if(chk == 0) {
              alert("댓글이 삭제 되었습니다.");
              window.location.reload();
             }},
              error: function(xhr, status, e) {
                 alert(e);
              }
	   		
	   });
   })
});