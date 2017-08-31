var currentPage=1;//显示的当前页
var pageShow;
$(function(){
	showCarPort(currentPage);
	showMessage();
});

function showCarPort(currentPage){
	$.ajax({
		async:false,
  		url:"../../showLetterCarPort.do",
  		dataType:"json",
  		data:{currentPage:currentPage},
  		success:function(data){
  		
  			createShowPage(data);
  			createPage(data);
  			
  		}
  	});
}
function createPage(data){
	$("#btnPage").html("");
	var btn="<input type='button' value='上一页' id='pre' class='btn btn-success'>";
	for(var i=0;i<data.pageBar.length;i++){
		if(data.pageBar[i]==currentPage){
			 btn =btn+ "<input type = 'button' value='"+data.pageBar[i]+"' class='pagebutton' style='background-color:blue'> ";
		}else{
			 btn =btn+ "<input type = 'button' value='"+data.pageBar[i]+"' class='pagebutton'>";
		}
		
	}
	btn =btn+ "<input type='button' value='下一页' id='later' class='btn btn-success'>";
	$("#btnPage").append(btn);
	$(".pagebutton").on("click",function(){
		var pageNum = $(this).val();
		 currentPage=pageNum;//显示的当前页
		 showCarPort(currentPage);
	});
	//前一页
	$("#pre").on("click",function(){
			currentPage =data.previousPage;
		showCarPort(currentPage);
	});
	//后一页
	$("#later").on("click",function(){
			currentPage=data.nextPage;
		showCarPort(currentPage);
	});
}
function createShowPage(result){
	var tds = $("<div class='row'><div class='col-md-5 col-sm-5 col-xs-5'><h2 style='color:black'>产权证编号</h2></div>"+
	     "<div class='col-md-3 col-sm-3 col-xs-3' ><h2 style='color:black'>地址</h2></div>"+
	     "<div class='col-md-2 col-sm-2 col-xs-2' ><h2 style='color:black'>租赁状态</h2></div>"+
	     "<div class='col-md-2 col-sm-2 col-xs-2'><h2 style='color:black'>联系方式</h2></div>"+
     "</div>");
	$("#showPage").html(tds);
	for(var i=0;i<result.list.length;i++){
		var state;
		var divRow = $("<div class='row' style='font-size: 20px;color:black'> </div>");
		var divPropNumber = $("<div class='col-md-5 col-sm-5 col-xs-5' style='color:black'></div>");
		divPropNumber.text(result.list[i].propNumber)
		var divLocation = $("<div class='col-md-3 col-sm-3 col-xs-3' style='color:black'></div>");
		divLocation.text(result.list[i].location);
		var divPortState =$("<div class='col-md-2 col-sm-2 col-xs-2' style='color:black'></div>");
		if(result.list[i].portState==0){
			state="未发布";
		}else if(result.list[i].portState==1){
			state="发布";
		}else if(result.list[i].portState==2){
			state="未通过";
		}else if(result.list[i].portState==3){
			state="已租";
		}else{
			state="过期";
		}
		divPortState.text(state);
		var divPhone = $("<div class='col-md-2 col-sm-2 col-xs-2' style='color:black'></div>");
		divPhone.text(result.list[i].letter.phone);
		divRow.append(divPropNumber);
		divRow.append(divLocation);
		divRow.append(divPortState);
		divRow.append(divPhone);
		$("#showPage").append(divRow);
		$("#showPage").append("<br>");
		
	}
	
	
}

function clickApplyPage(){
	 currentPage=1;
	 sendAjaxApplyPage();
}

function sendAjaxApplyPage(){
	$.ajax({
		async:false,
  		url:"../../showApply.do",
  		dataType:"json",
  		data:{currentPage:currentPage},
  		success:function(data){
  		
  			createShowApplyPage(data);
  			createApplyPage(data);
  		}
  	});
}

function createShowApplyPage(result){
	
		$("#applyPage").html("");
		for(var i=0;i<result.list.length;i++){
			
			var divRow = $("<div class='row'> </div>");
			var divPortId = $("<input type='hidden' value='"+result.list[i].rentId+"'></input>");
			
			var divPropNumber = $("<div class='col-md-2' style='font-size:24px;'></div>");
			divPropNumber.text(result.list[i].renter.userName)
			var divLocation = $("<div class='col-md-2' style='font-size:24px;margin-left:-3%'></div>");
			divLocation.text(result.list[i].renter.phone);
			var divPortState =$("<div class='col-md-2' style='font-size:24px;'></div>");
			divPortState.text(result.list[i].carPort.portNumber);
			var divPhone = $("<div class='col-md-2' style='font-size:24px;margin-left:-3%'></div>");
			divPhone.text(result.list[i].message);
			
			var divAnswer = $("<div class='col-md-2' style=''></div>");
			divAnswer.html("<input type='text' value='' class ='form-control' style='line-height:15px;background-color:white;'>");
			
			var divOther = $("<div class='col-md-2' ></div>");
			divOther.html("<input type='button' value='通过' class='option btn btn-info'>&nbsp;<input type='button' value='拒绝' class='option btn btn-info'>");
			divRow.append(divPortId);
			divRow.append(divPropNumber);
			divRow.append(divLocation);
			divRow.append(divPortState);
			divRow.append(divPhone);
			divRow.append(divAnswer);
			divRow.append(divOther);
			$("#applyPage").append(divRow);
			$("#applyPage").append("<br>");
		}
		
		letterOption();
}

function letterOption(){
	$(".option").click(function(){
		var rentId = $(this).parent().parent().children().val();
		var answer = $(this).parent().parent().children().eq(5).children().val();
		var rentState=$(this).val();
		if(rentState=="通过"){
			rentState=1;
		}else{
			rentState=2;
		}
		$.ajax({
			async:false,
	  		url:"../../letterOption.do",
	  		dataType:"json",
	  		data:{rentId:rentId,answer:answer,rentState:rentState},
	  		success:function(data){
	  			
	  		}
	  	});
		sendAjaxApplyPage();
	})
}

function createApplyPage(data){
	$("#applyBtnPage").html("");
	for(var i=0;i<data.pageBar.length;i++){
		if(data.pageBar[i]==currentPage){
			var btn = $("<input type = 'button' value='"+data.pageBar[i]+"' class='applyPagebutton' style='background-color:blue'> style='color:black'");
		}else{
			var btn = $("<input type = 'button' value='"+data.pageBar[i]+"' class='applyPagebutton'> style='color:black'");
		}
		
		  $("#applyBtnPage").append(btn);
	}
	$(".applyPagebutton").click(function(){
		var pageNum = $(this).val();
		 currentPage=pageNum;//显示的当前页
		 sendAjaxApplyPage(currentPage);
	});
	if(currentPage!=1){
		$("#applyPre").removeAttr("disabled");
	}else{
		$("#applyPre").attr("disabled","disabled");
	}
	//前一页
	$("#applyPre").click(function(){
		if(currentPage!=1){
			$("#applyPre").removeAttr("disabled");
			currentPage =data.previousPage;
			sendAjaxApplyPage(currentPage);
		}else{
			$("#applyPre").attr("disabled","disabled");
		}
	});
	
	if(currentPage!=data.totalPage){
		$("#applyLater").removeAttr("disabled");
	}else{
		$("#applyLater").attr("disabled","disabled");
	}
	//后一页
	$("#applyLater").click(function(){
		if(currentPage!=data.totalPage){
			$("#applyLater").removeAttr("disabled");
			currentPage=data.nextPage;
			
			sendAjaxApplyPage(currentPage);
		}else{
			$("#applyLater").attr("disabled","disabled");
		}
	});
}

function showMessage(){
	$.ajax({
		async:false,
  		url:"../../getMyDetails.do",
  		dataType:"json",
  		success:function(data){
  			if(data.password==0){//修改过
  				
  				$("#mainIcon").text(""+data.userName);
  	  			$("#userName").val(""+data.userName);
  	  		$("#realName").val(""+data.realName);
	  			$("#newPwd").val(""+data.password);
  			$("#surePwd").val(""+data.password);
  	  			
  	  			$("#address").val(""+data.address);
  	  			$("#indentNumber").val(""+data.indentNumber);
  	  			$("#phone").val(""+data.phone);
  	  			$("#profession").val(""+data.profession);
  	  			$("#email").val(""+data.email);
  			}else{
  				//未修改过
  				
  				$("#mainIcon").text(""+data.userName);
  	  			$("#userName").val(""+data.userName);
  	  			$("#realName").val(""+data.realName);
  	  			$("#address").val(""+data.address);
  	  			$("#indentNumber").val(""+data.indentNumber);
  	  			$("#phone").val(""+data.phone);
  	  			$("#profession").val(""+data.profession);
  	  			$("#email").val(""+data.email);
  			}
  			
  		}
  	});
}
function clickRecord(){
	currentPage = 1;
	sendRencordAjax(currentPage);
}
function sendRencordAjax(currentPage){
	$.ajax({
		async:false,
  		url:"../../showRecord.do",
  		dataType:"json",
  		data:{currentPage:currentPage},
  		success:function(data){
  		
  			record(data);
  			recordPage(data);
  		}
  	});
	
}

function record(data){
	$("#record").html("");
	var trRecord = "";
	for(var i = 0;i<data.list.length;i++){
		
		trRecord = trRecord+ "<form action='../../tousu.do' method='POST'><p class='tm-text'><input type='hidden' value='"+data.list[i].renter.renterId+" name='positiveId'><span style='margin-right: 13%;font-size:20px'>"
			+data.list[i].carPort.portNumber+
			"</span><span style='margin-right: 13%;font-size:20px'>"
		+data.list[i].describes+"</span><span style='margin-right:13%;font-size:20px'>"+
		"<input type='hidden' value="+data.list[i].rentId+" name='rentPort.rentId'>"+
		"<input type='text' name='reason'/></span>" +
		"<button value='投诉' class='btn btn-info recordOption'>投诉</button></form>"
		+"</p>"
	}
	//创建空行 	
	for(var j=0;i+j<data.pageSize;j++){
		trRecord = trRecord+ "<p class='tm-text'><span style='margin-right: 40%;font-size:20px'>"
		+"&nbsp;"+
		"</span><span style='margin-right: 38%;font-size:20px'>"
	+"&nbsp;"+"</span>"+
	"<span value='投诉'>&nbsp;</span>"
	+"</p>"
	}
	
	$("#record").append(trRecord);
	letterRecordOption();
}
function recordPage(data){
	$("#recordBtn").html("");
	var btn="";
	btn = btn+"<input type = 'button' value='«' class='recordpagebuttonpre'>";
	for(var i=0;i<data.pageBar.length;i++){
		if(data.pageBar[i]==currentPage){
			btn = btn+"<input type = 'button' value='"+data.pageBar[i]+"' class='recordpagebutton' style='background-color:blue'>";
		}else{
			btn = btn+"<input type = 'button' value='"+data.pageBar[i]+"' class='recordpagebutton'>";
		}
		
	}
	btn = btn+"<input type = 'button' value='»' class='recordpagebuttonlater'>";
	 $("#recordBtn").append(btn);
	 clickRecordBtn(data);
}
function clickRecordBtn(data){
	$(".recordpagebuttonpre").on("click",function(){
		currentPage = data.previousPage;
		sendRencordAjax(currentPage);
		
	});
	$(".recordpagebutton").on("click",function(){
	currentPage = $(this).val();
	
	sendRencordAjax(currentPage);
	});
	$(".recordpagebuttonlater").on("click",function(){
	currentPage = data.nextPage;
	sendRencordAjax(currentPage);
	
});
}
function letterRecordOption(){
	$(".recordOption").on("click",function(){
		var option = $(this).parent().children().val();
		
		location.href="recordOption.do?option="+option;
		
	});
}
function exitLetter(){
	location.href="../../exitLetter.do";
}
