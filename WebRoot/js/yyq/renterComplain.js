var currentPage=1;
var optionState=4;//所有状态
$(function(){
	
	sendAjax(currentPage,optionState);
	renterOption();
});

function userChoose(){
	var choose = $("#renterChoose").val();
	optionState= choose;
	sendAjax(currentPage,optionState);
	renterOption();
}
function sendAjax(currentPage,optionState){
	$.ajax({
		async:false,
  		url:"../tousuguanli/renterComplain.do",
  		data:{currentPage:currentPage,optionState:optionState},
  		success:function(data){
  			
  			createTable(data);
  			createPage(data);
  		}
  	});
}
function renterOption(){
	$(".clickBtn").click(function(){
		var optionSta = $(this).children().text();
		
		var clickId = $(this).parent().parent().parent().parent().children().eq(2).html();
		$.ajax({
			async:false,
	  		url:"../tousuguanli/renterComplainOption.do",
	  		data:{optionSta:optionSta,clickId:clickId},
	  		success:function(){
	  		}
	  	});
		sendAjax(currentPage,optionState);
	});
}
function createTable(data){
	$("#renterTable").html("");
	var renterT = "";
	var number = 0;
	for(var i=0;i<data.list.length;i++){
		number = number+1;
		var comState = "";
		var renterOption="";
		if(data.list[i].comState==0){
			comState="未受理";
			renterOption="<button class='am-btn am-btn-default am-btn-xs am-text-secondary clickBtn'><span"+
            "class='am-icon-pencil-square-o'></span> 受理"+
            "</button>"+
           " <button class='am-btn am-btn-default am-btn-xs am-hide-sm-only clickBtn'><span"+
                    "lass='am-icon-copy'></span> 无效"+
            "</button>"+
            "<button class='am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only clickBtn'>"+
                "<span class='am-icon-trash-o'></span> 暂缓处理"+
            "</button>";
		}else if(data.list[i].comState==1){
			comState="受理";
		}else if(data.list[i].comState==2){
			comState="无效";
		}else if(data.list[i].comState==3){
			comState="暂缓";
			renterOption="<button class='am-btn am-btn-default am-btn-xs am-text-secondary clickBtn'><span"+
            "class='am-icon-pencil-square-o'></span> 受理"+
            "</button>"+
           " <button class='am-btn am-btn-default am-btn-xs am-hide-sm-only clickBtn'><span"+
                    "lass='am-icon-copy'></span> 无效"+
            "</button>";
		}
		renterT=renterT+"<tr>"+
        "<td>"+number+"</td>"+
        "<td><a href='#'>"+data.list[i].reason+"</a></td>"+
        "<td class='am-hide-sm-only'>"+data.list[i].comId+"</td>"+
        "<td class='am-hide-sm-only'>"+data.list[i].comDate+"</td>"+
        "<td class='am-hide-sm-only'>"+comState+"</td>"+
        "<td>"+
            "<div class='am-btn-toolbar'>"+
                "<div class='am-btn-group am-btn-group-xs'>"+
                renterOption+
                "</div>"+
           " </div>"+
       " </td>"+
    "</tr>";
	}
	//创建空行
	var trSpace = "";
	for(var j=0;i+j<data.pageSize;j++){
		trSpace = trSpace+"<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>"
	}
	
	$("#renterTable").append(renterT);
	$("#renterTable").append(trSpace);
}
function createPage(data){
	$("#renterPageBtn").html("");
	var renterPageBtn="";
	renterPageBtn=renterPageBtn+"<li class='am-disabled pagePre'><a href='#'>«</a></li>";
		for(var i=0;i<data.pageBar.length;i++){
			if(data.pageBar[i]==currentPage){
				renterPageBtn=renterPageBtn+ "<li class='am-active pageBtn'><a href='#'>"+data.pageBar[i]+"</a></li>";
			}else{
				renterPageBtn=renterPageBtn+ "<li class='pageBtn'><a href='#'>"+data.pageBar[i]+"</a></li>";
			}
			
		}
		renterPageBtn=renterPageBtn+"<li class='am-disabled pageLater'><a href='#'>»</a></li>"
		$("#renterPageBtn").append(renterPageBtn);
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