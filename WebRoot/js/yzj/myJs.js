var currentPage= 1;
var resource =null;
var sessionResource=null;
var rentPortState=null;
$("#showPwd").click(function () {
   $("#OPwd").attr("type","text");
})
$(function () {  
getResourceFromSession();
changeMyInfo();
changeRealName();
getMyPage();
getRentPortState();
changeRecord();
check();
})

$("#removerUser").click(function (){
	
	$.ajax({
		async:false,
		type:"post",
		url:"../../removeSession.do",
		success:function(){
		
		}
			
		
	})
	location.href="../../login.jsp";
	
})
$("#applyLater").click(function(){
	
	 $("#showDetails").html("");
	currentPage=currentPage+1;
	check();
	renewPage(resource);
	getRentPortState();
})

$("#applyPre").click(function(){
	
	$("#showDetails").html("");
	currentPage=currentPage-1;
	renewPage(resource);
	getRentPortState();
	
	check();
})
function getMyPage(){	
	
	$.ajax({
	       async:false,
	       type: "post",
	       url:"../../showRenterApply.do",
	       dataType:"json",
	       data:{currentPage:currentPage,renterId:sessionResource.renterId},
	        success:function (data) {
	        	 resource=data
	        	
	        	 var msg = "<div class='row'><div class='col-md-6'><span>甲方</span><input type='text' class='form-control' readOnly value="+data.list[currentPage-1].carPort.letter.realName
	             +"></div><div class='row'><div class='col-md-6'><span>乙方</span><input type='text' class='form-control' readOnly value="+data.list[currentPage-1].renter.realName+">"
	             var msg0="<div class='col-md-6'>车位<input type='text' class='form-control' readOnly value="+ data.list[currentPage-1].carPort.portNumber +"></div><div class='col-md-6'>留言<input type='textArea' readOnly id='message' class='form-control'" +
	             		"value="+ data.list[currentPage-1].message+">"           
	             var img= "<div class='col-md-6'>回复<input type='text' class='form-control' readOnly value="+data.list[currentPage-1].answer+"></div><div" +
	             		" class='col-md-6'>车位出租状态<input type='text' class='form-control' readOnly" +
	             		" id='rentPortState'></div>";
	             
	             $("#showDetails").html(msg);
	             $("#showDetails").append(msg0);
	             $("#showDetails").append(img);
	             
	       
	        }
	    })
}
//把数据显示到前台
function renewPage(resource){

 var msg = "<div class='row'><div class='col-md-6'><span>甲方</span><input type='text' class='form-control' readOnly value="+resource.list[currentPage-1].carPort.letter.realName
 +"></div><div class='row'><div class='col-md-6'><span>乙方</span><input type='text' class='form-control' readOnly value="+resource.list[currentPage-1].renter.realName+">"
 var msg0="<div class='col-md-6'>车位<input type='text' class='form-control' readOnly value="+ resource.list[currentPage-1].carPort.portNumber +"></div><div class='col-md-6'>留言<input type='textArea' id='message' readOnly class='form-control'" +
 		"value="+ resource.list[currentPage-1].message+">" ;          
 var img= "<div class='col-md-6'>回复<input type='text' class='form-control' readOnly value="+resource.list[currentPage-1].answer+"></div><div" +
 		" class='col-md-6'>车位出租状态<input type='text' class='form-control' readOnly id='rentPortState'></div>"
 
 $("#showDetails").html(msg);
 $("#showDetails").append(msg0);
 $("#showDetails").append(img);
}
//看看当前页是不是第一页或者最后一页
function check(){
if(currentPage==1){
	$("#applyPre").attr("disabled","disabled");		
	}
else{
	$("#applyPre").removeAttr("disabled");
	
}
if(currentPage==resource.list.length){
	$("#applyLater").attr("disabled","disabled")
}
else{
	
	$("#applyLater").removeAttr("disabled");
}

}
//从Session里面拿到Renter传到前台使用
function getResourceFromSession(){

	$.ajax({
	       async:false,
	       type: "post",
	       url:"../../getSessionDetails.do",
	       dataType:"json",
	       success: function(data){	   
	    	  sessionResource=data;  	  
	       }  
	     
	    })
		
	}
/*function reFrom(){
		$("#realName").val(sessionResource.realName);		
	}*/
//查看出租状态
function getRentPortState(){
	if(resource.list[currentPage-1].rentState==0){
		rentPortState="待回复";
		$("#rentPortState").val(rentPortState);
		$("#Confirm").val("等待审核中");
	}
	else if(resource.list[currentPage-1].rentState==1){
		rentPortState="租赁成功";
		$("#rentPortState").val(rentPortState);
		$("#Confirm").val("结束租赁")
	}
	else if(resource.list[currentPage-1].rentState==2){
		rentPortState="被拒"
		$("#rentPortState").val(rentPortState);
		$("#message").removeAttr("readOnly");
		$("#Confirm").val("再次预约")
	}
	else if(resource.list[currentPage-1].rentState==3){
		rentportState="交易完成"
		$("#Confirm").val("投诉(可选)")	
		
	}
}

$("#Confirm").click(function (){
	if($("#Confirm").val()=="结束租赁"){
		EndMyTrasaction();	
		
	}
	if($("#Confirm").val()=="再次预约"){
		
		reSendRequest();
		
	}
	
})
function reSendRequest(){

  $.ajax({
	  async:false,
	  type:"post",
	  url:"../../reSendTheRequest.do",
	  data:{rentId:resource.list[currentPage-1].rentId,rentMessage:$("#message").val()},
	  success:function(data){
		location.href="renterMain.html";
	  }
  });	
	
}
function EndMyTrasaction(){
	$.ajax({
	       async:false,
	       type: "post",
	       url:"../../EndTheTrasaction.do",
	       data:{rentId:resource.list[currentPage-1].rentId},
	       success: function(data){

	    	 location.href="renterMain.html";
	       }  
	     
	    })
	
}
function changeRealName(){
	var name =sessionResource.realName;
  $("#realName").text(name);

}
function changeMyInfo(){    
  			$("#userName").val(""+sessionResource.userName);
  			$("#realName").val(""+sessionResource.realName);
  			$("#address").val(""+sessionResource.address);
  			$("#indentNumber").val(""+sessionResource.indentNumber);
  			$("#phone").val(""+sessionResource.phone);
  			$("#profession").val(""+sessionResource.profession);
  			$("#email").val(""+sessionResource.email);
  			
  	 
}
function changeRecord(){
	$.ajax({
	       async:false,
	       type: "post",
	       url:"../../checkRecords.do",
	       data:{currentPage:currentPage,renterId:sessionResource.renterId},
	       success: function(data){
	    	  for(var i =0;i<=data.list.length;i++) {
	    		  
	    		  var extendsInfo="<tr><td>"+data.list[i].carPort.portNumber+"</td><td>"+ data.list[i].carPort.portNumber+"</td>" +
	    		  		"<td><input type=button value='投诉' aId="+data.list[i].carPort.letter.letterId +" bId="+i+" class='tousu'></td></tr>"
	    		  $("#infoTable").append(extendsInfo);
	    	  }
	    	 
	       }  
	     
	    })
	    $(".tousu").on("click",function(){
	        alert("1");
    		});
	
	   
}

