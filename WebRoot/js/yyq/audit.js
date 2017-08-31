var currentPage=1;//显示的当前页
$(function(){
	showCarPort(currentPage);
	
});
/*显示未审核车位信息 */
function showCarPort(currentPage){
	var location = $("#location").val();
	$.ajax({
		async:false,
  		url:"showCarPort.do",
  		dataType:"json",
  		data:{currentPage:currentPage,location:location},
  		success:function(data){
  		
  			createTable(data);
  			audit();//调用审核方法，使得审核按钮绑定事件
  			createPage(data);
  			
  		}
  	});
}
//创建未审核车位信息表格
function createTable(result){
	var tds = $("<tr id='thead'><th></th><th>产权证编号</th><th>小区位置</th><th>车位编号</th><th>产权证照片</th><th>操作</th></tr>");
	$("#carPorts").html(tds);
	//循环产生每一行
	for(var i=0;i<result.list.length;i++){
		var tr = $("<tr class='tabletr'></tr>");
		
		var tdId = $("<td></td>");
		tdId.html("<input type='hidden' class='chooseOne' value='"+result.list[i].portId+"'>");
		//产权证编号
	 	var tdNumber=$("<td></td>");
	 	tdNumber.text(result.list[i].propNumber);
	 	
	 	//小区位置
		var tdLocation = $("<td></td>");				
		tdLocation.text(result.list[i].location);
		//车位编号
		var tdPortNumber = $("<td></td>");			
		tdPortNumber.text(result.list[i].portNumber);
		// 产权证照片
		var tdPropImage = $("<td></td>");
		tdPropImage.html("<img src='"+result.list[i].propImage+"' style='width:20px;height:20px'>");
		var tdOther=$("<td></td>");
		tdOther.html("<input type='button' value='通过' class='option btn btn-info'>");
		tr.append(tdId);
		tr.append(tdNumber);
		tr.append(tdLocation);
		tr.append(tdPortNumber);	
		tr.append(tdPropImage);
		tr.append(tdOther);
		$("#carPorts").append(tr);
	}
	//表格末尾未显示完全用灰色的行填充 
	if(result.list.length%result.pageSize!=0||result.list.length==0){
		var len = result.list.length;
		var i = 0;
		while(len%result.pageSize!=0){
			len++;
			i++;
		}
		if(result.list.length==0){
			i=result.pageSize;
		}
		for(var k = 0;k<i;k++){
			var trspac = $("<tr style='background-color:GRAY'></tr>");
			var tdId = $("<td></td>");
			tdId.html("<span>&nbsp;</span>");
			var tdNumber=$("<td></td>");
			tdNumber.html("<span>&nbsp;</span>");
			var tdLocation=$("<td></td>");
			tdLocation.text("");
			var tdPortNumber = $("<td></td>");				
			tdPortNumber.text("");
			var tdPropImage = $("<td></td>");			
			tdPropImage.text("");	
			var tdOther=$("<td></td>");
			tdOther.html("");
			trspac.append(tdId);
			trspac.append(tdNumber);
			trspac.append(tdLocation);
			trspac.append(tdPortNumber);	
			trspac.append(tdPropImage);
			trspac.append(tdOther);
			$("#carPorts").append(trspac);
		}
	}
}
//创建页码
function createPage(data){
	$("#btnPage").html("");
	for(var i=0;i<data.pageBar.length;i++){
		var btn = $("<input type = 'button' value='"+data.pageBar[i]+"' class='pagebutton'>");
		  $("#btnPage").append(btn);
	}
	$(".pagebutton").click(function(){
		var pageNum = $(this).val();
		 currentPage=pageNum;//显示的当前页
		 showCarPort(currentPage);
	});
	if(currentPage!=1){
		$("#pre").removeAttr("disabled");
	}else{
		$("#pre").attr("disabled","disabled");
	}
	
	//前一页
	$("#pre").click(function(){
		if(currentPage!=1){
			$("#pre").removeAttr("disabled");
			currentPage =data.previousPage;
			showCarPort(currentPage);
		}else{
			$("#pre").attr("disabled","disabled");
		}
	});
	
	if(currentPage!=data.totalPage){
		$("#later").removeAttr("disabled");
		
	}else{
		$("#later").attr("disabled","disabled");
	}
	//后一页
	$("#later").click(function(){
		
		if(currentPage!=data.totalPage){
			$("#later").removeAttr("disabled");
			currentPage=data.nextPage;
			
			showCarPort(currentPage);
		}else{
			$("#later").attr("disabled","disabled");
		}
	});
}
//审核操作
function audit(){
	
	$(".option").click(function(){
		var portId = $(this).parent().parent().children().children().val();
		$.ajax({
			async:false,
	  		url:"audit.do",
	  		dataType:"json",
	  		data:{portId:portId},
	  		success:function(data){
	  			if(data==1){
	  				showCarPort(currentPage);
	  			}
	  		}
	  	});
		
		
	});
}


