 

$(function(){
	alert(11);
	
});
$("#submited").on("click", function(){

	
	$.ajax({
	       async:false,
	       type: "post",
	       url:"../cheweiguanli/checkExistPorts.do",
	       data:{address:$("#address").val(),portNum:$("#portNum").val()},
	       success: function(data){	   
	    	 if(data=="exist")
	    	  {
	    		alert("已经有了")
	    	  }
	    	 else if(data=="DNE"){
	    		
	    		 getPageByUrl("${pageContext.request.contextPath}/cheweiguanli/add.do", $("#portForm").serializeArray());
         
	    		 
	    	 }
	       }  
	     
	    })
          
		

})