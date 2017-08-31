var currentPage=1;
var rentState=null;
var address=null;
var pageForCondition=1;
$(function (){
	    findPageNumber();
	    getInfomation();
	    bound();
})



function findPageNumber(){
	
	$.ajax({
	       async:false,
	       type: "post",
	       url:"../cheweiguanli/findpageNum.do",
	       success: function(data){	   
	    	  for(var i =0;i<data;i++){
	    		  var theIcon="<li><a class='pageButton'>"+(i+1)+"</a></li>"	    
	    		  $("#pageNum").append(theIcon);
	    		
	    	  }
	    	  
	       }  
	     
	    })
	  
	
}
function bound(){
$(".pageButton").on("click",function(){
	$("#tBody").text("");
	currentPage=$(this).text();
	getInfomation();
})
}
function getInfomation(){

	$.ajax({
	       async:false,
	       type: "post",
	       url:"../cheweiguanli/carPortManage.do",
	       data:{currentPage:currentPage},
	       success: function(data){
	    	   
	    	   for(var i =0; i<data.list.length;i++)
	    		   {
	    		   if(data.list[i].portState==1){
                var State="已租";	    			   		   
	    		   }
	    		   else{
	    		var State="未租";	   
	    		   }
	    	 var result = "<tr><td>"+data.list[i].portId+"</td><td><a href='#'>"+data.list[i].portAdress+"</a></td>" +
	    	 		"<td class='am-hide-sm-only'>"+data.list[i].portNumber+"</td><td><div class='am-btn-toolbar'><div class='am-btn-group am-btn-group-xs'>" +
	    	 				"<button class='am-btn am-btn-default am-btn-xs am-text-success'><span class='am-icon-pencil-square-o'>"+State+"</button>" +
	    	 				"</div></td></tr>";
	    	         $("#tBody").append(result);
                
	    		   }
	    	   
	       }  
	     
	    })
}
function conditionQuery(){
	
	rentState=$("#select").val();
	address=$("#address").val()
	$.ajax({
	       async:false,
	       type: "post",
	       url:"../cheweiguanli/findByCondition.do",
	       data:{rentstate:rentState,address:address,Page:pageForCondition},
	       success: function(data){	   
	    	   $("#tBody").html("");
	    	  for(var i =0;i<data.list.length;i++){
	    		  if(data.list[i].portState==1){
	                  var State="已租";	    			   		   
	  	    		   }
	  	    		   else{
	  	    		var State="未租";	   
	  	    		   }
	    		  var result = "<tr><td>"+data.list[i].portId+"</td><td><a >"+data.list[i].portAdress+"</a></td>" +
	    	 		"<td class='am-hide-sm-only'>"+data.list[i].portNumber+"</td><td><div class='am-btn-toolbar'><div class='am-btn-group am-btn-group-xs'>" +
	    	 				"<button class='am-btn am-btn-default am-btn-xs am-text-success'><span class='am-icon-pencil-square-o'>"+State+"</button>" +
	    	 				"</div></td></tr>";
	    	         $("#tBody").append(result);	  
	    	  }
	    	  
	       }  
	     
	    })

}
$("#fun").click(function(){
	conditionQuery();
})
$("#previous").click(function(){
	currentPage=currentPage-1;
	$("#tBody").text("");
	 getInfomation();
	
})
$("#latter").click(function(){
	currentPage=currentPage+1;
	$("#tBody").text("");
	getInfomation();
	
})