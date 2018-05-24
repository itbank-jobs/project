$(function(){
   $('#registerReply').on('click',function(){

       var replytext = $("#replytext").val();
      
       if (replytext == "") {
    	   $("#replytext").focus();
    	   return false;
       }
       
       var bnum = $("#num").val();
       /*var param = {"replytext" : replytext, "bno":bno};*/
     
        
        $.ajax({
            type : "post",
            data : {replytext:replytext, bnum:bnum},
            url : '/proto/insertReply',
            /*data : param,*/
            
            success : function(result){
            	var tmp = result.split('%');
            	
            	$('#Y').append('<tr style=\"padding: 5px;\"><td style=\"padding: 3px; padding-left: 40px;\" width=\"90%\">'+tmp[0]+' <font size=\"1px\">'+tmp[2]+'</font></td><td rowspan="2" width="10%"><button type=\"button\" class=\"deleteReply btn btn-warning\" style=\"background-color: transparent;" id=\"'+tmp[1]+'\">삭제</button></td></tr>');
            	$('#Y').append('<tr><td style=\"padding-left: 40px; width: 970px\">내용 :'+replytext+'</td></tr><td colspan=\"2\"><hr></td>');
            	$('.container').scrollTop($(".container")[0].scrollHeight+$("#Y")[0].scrollHeight);
            	$('.deleteReply').on('click',function(){
         		   var bnum = $("#num").val();
         		   var rnum = $(this).attr('id');
         			   
         		   $.ajax({
         			   type : "post",
         			   data : {bnum:bnum, rnum:rnum},
         		   		url : '/proto/replyDelete',
         		   		
         		   	 success : function(result){
      

         	             window.location.reload();
         	             },
         	              error: function(xhr, status, e) {
         	                 alert('1');
         	              }
         		   		
         		   });
         	   })
              },
               error: function(xhr, status, e) {
                  alert('2');
               }
            
         
      }); //ajax
   })
   
   $('.deleteReply').on('click',function(){
	   var bnum = $("#num").val();
	   var rnum = $(this).attr('id');
		   
	   $.ajax({
		   type : "post",
		   data : {bnum:bnum, rnum:rnum},
	   		url : '/proto/replyDelete',
	   		
	   	 success : function(result){
          
              window.location.reload();
              
             },
              error: function(xhr, status, e) {
                 alert(e);
              }
	   		
	   });
   })
   
   
});

