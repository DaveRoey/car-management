var currentPage=1;
var optionState="所有状态";
$(function(){
	
	currentPage=1;
	optionState="所有状态";
	sendAjax(currentPage,optionState);
});
function stateChoose(){
	var choose = $("#stateSelect").val();
	optionState= choose;
	sendAjax(currentPage,optionState);
}
function letterOption(){
	$(".clickBtn").click(function(){
		var optionSta = $(this).children().text();
		var clickId = $(this).parent().parent().parent().parent().children().eq(2).html();
		$.ajax({
			async:false,
	  		url:"../tousuguanli/letterComplainOption.do",
	  		data:{optionSta:optionSta,clickId:clickId},
	  		success:function(){
	  		}
	  	});
		sendAjax(currentPage,optionState);
	});
}
function sendAjax(currentPage,optionState){
	$.ajax({
		async:false,
  		url:"../tousuguanli/letterComplain.do",
  		data:{currentPage:currentPage,optionState:optionState},
  		success:function(data){
  			
  			createTable(data);
  			createPage(data);
  		}
  	});
}
function createTable(data){
	$("#letterTBody").html("");
	var number = 1;
	
	for(var i=0;i<data.list.length;i++){
		var tr1=$("<tr></tr>");
		
		var tdId=$("<td></td>");
		tdId.text(number);
		number = number+1;
		var tdReson=$("<td></td>");
		tdReson.text(data.list[i].reason);
		
		var tdComId=$("<td></td>");
		tdComId.text(data.list[i].comId);
		var tdComDate=$("<td></td>");
		
		tdComDate.text(data.list[i].comDate);
		var tdComState=$("<td></td>");
		if(data.list[i].comState==3){
			tdComState.text("暂缓");
		}else if(data.list[i].comState==0){
			tdComState.text("未受理");
		}else if(data.list[i].comState==1){
			tdComState.text("受理");
		}else if(data.list[i].comState==2){
			tdComState.text("无效");
		}
		var userOption = "";
		switch(data.list[i].comState){
		case 2: break;
		case 1:break;
		case 3: userOption = "<div class='am-btn-toolbar'>"+
        "<div class='am-btn-group am-btn-group-xs'>"+
        "<button class='am-btn am-btn-default am-btn-xs am-text-secondary clickBtn'><span"+
                "class='am-icon-pencil-square-o'></span> 受理"+
        "</button>"+
        "<button class='am-btn am-btn-default am-btn-xs am-hide-sm-only clickBtn'><span"+
                "class='am-icon-copy'></span> 无效"+
        "</button>"+
        "</div>"+
        "</div>";
		break;
		case 0: userOption = "<div class='am-btn-toolbar'>"+
        "<div class='am-btn-group am-btn-group-xs'>"+
        "<button class='am-btn am-btn-default am-btn-xs am-text-secondary clickBtn'><span"+
                "class='am-icon-pencil-square-o'></span> 受理"+
        "</button>"+
        "<button class='am-btn am-btn-default am-btn-xs am-hide-sm-only clickBtn'><span"+
                "class='am-icon-copy'></span> 无效"+
        "</button>"+
        "<button class='am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only clickBtn'>"+
            "<span class='am-icon-trash-o'></span> 暂缓处理"+
        "</button>"+
        "</div>"+
        "</div>";break;
		}
		var tdOption=$("<td></td>");
		
		tdOption.html(userOption);
		
		tr1.append(tdId);
		tr1.append(tdReson);
		tr1.append(tdComId);
		tr1.append(tdComDate);
		tr1.append(tdComState);
		tr1.append(tdOption);
		$("#letterTBody").append(tr1);
	}
	//加空行
	var space = "";
	for(var j=0;i+j<data.pageSize;j++){
		space = space+"<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>"
	}
	$("#letterTBody").append(space);
	letterOption();
}
function createPage(data){
	$("#letterPageBtn").html("");
	var letterBtn="<ul class='am-pagination tpl-pagination'>"+
    "<li class='am-disabled pagePre'><a href='#'>«</a></li>'";
	for(var i=0;i<data.pageBar.length;i++){
	
		if(data.pageBar[i]==currentPage){
			letterBtn = letterBtn+"<li class='am-active pageBtn'><a href='#'>"+data.pageBar[i]+"</a></li>";
		}else{
			letterBtn = letterBtn+"<li class='pageBtn'><a href='#'>"+data.pageBar[i]+"</a></li>";
		}
		
    
	}
	letterBtn = letterBtn+"<li class='am-disabled pageLater'><a href='#'>»</a></li>"+"</ul>";
	
	$("#letterPageBtn").append(letterBtn);
	pressBtn(data);
}
function pressBtn(data){
	$(".pagePre").on("click",function(){
		currentPage = data.previousPage;
		sendAjax(currentPage,optionState);
	});
	$(".pageLater").on("click",function(){
		currentPage = data.nextPage;
		sendAjax(currentPage,optionState);
	});
	$(".pageBtn").on("click",function(){
		
		currentPage = $(this).children().html();
		sendAjax(currentPage,optionState);
	});
	
	
} 