$(function(){

	
	
})


$("#saveAll").click(function(){
var count=	$("#theHider").val();
      var array= new Array();
	 for(var i=0;i<count;i++){
		 var result=$("#number"+(i+1)).val()+","+$("#num"+(i+1)).val()+","+$("#location").val();
	     array[i]=result;
	}
saveAll(array);
})

function saveAll(array){

	$.ajax({
	       async:false,
	       type: "post",
	       url:"../cheweiguanli/groupAdd.do",
	      data:$.toJSON(array),
	      contentType:"Application/JSON",
	   
	       success: function(data){	   
	    	    	  getPageByUrl("../../backstage/cheweiguanli/manageCarPort.jsp");
	       }  
	     
	    })
		
	}
	
