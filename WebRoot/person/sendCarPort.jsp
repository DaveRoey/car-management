<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link href="../css/bootstrap.css" rel="stylesheet">
<link href="../css/boot/fileinput.min.css"  rel="stylesheet"
	type="text/css" />
<link href="css/bootstrap-datetimepicker.css"  rel="stylesheet"
	type="text/css" />

<script src="js/jquery-2.0.3.js"></script>
<script src="js/bootstrap.js" type="text/javascript"></script>
<script src="js/fileinput.min.js" type="text/javascript"></script>
<script src="js/distpicker.data.js"></script>
<script src="js/distpicker.js"></script>
<script src="js/main.js"></script>
<script src="js/bootstrap-datetimepicker.js"></script>
</head>
<body style="background-image:url('img/u=3144247502,4292034929&fm=26&gp=0.jpg') ">
	<div class="container-fluid" >
		<!-- head部分，装一些常用跳转页面 -->
		<div class="row" style="height: 60px;margin-bottom: 20px">
		
		</div>
		<div class="row">
			<span style="font-size: 32px;color: black">请填写你的车位详情：</span>		
		</div>
	
		<!-- 表单部分 -->
		<div class="row" style="">
			<!-- 用两个栅格来占位 -->
			<div class="col-md-2"></div>
			
			<div class="col-md-7" >
				<!-- 发布车位的表单 -->
				<form class="form form-vertical" id="dataform" action=<c:url value='/upLoadFile.do'/> style=""  method="post" enctype="multipart/form-data">
						<!-- propNumber产权证编号-->
						<div class="row" style="margin-bottom: 10px">
							<div class="col-md-2">产权证编号：</div>
							<div class="col-md-5"><input id="propNumber" name="propNumber" calss="form-control" style="width: 90%"></div>
							<div class="col-md-5" id="propNumbermsg"></div>
						</div>
					
						<!--location小区位置 ,用选择框 -->
						<div class="row" style="margin-bottom: 10px">
							<div class="col-md-2">选择地区：</div>
							
						<!--省市区级联 -->
							<div class="col-md-9">
							
							<div data-toggle="distpicker">
        
          
          <select class="form-control" name="province" style="width:120px;float:left;margin-right:10px" id="province2" data-province="---- 选择省 ----" ></select>

          <select class="form-control" name="city" style="width:120px;float:left;margin-right:10px" id="city2" data-city="---- 选择市 ----"></select>
    
          <select class="form-control" name="district" style="width:120px;float:left;margin-right:10px"  id="district2" data-district="---- 选择区 ----"></select>
        
      						</div>
      						
							</div>
							
						</div>
						<!--  portNumber;//详细地址 -->
						
						<div class="row" style="margin-bottom: 10px">
							<div class="col-md-2">详细地址：</div>
							<div class="col-md-5"><input name="locationsub" id="locationsub" class="form-control" style="width: 90%">
							
							<input type="hidden" id="location" name="location" value="">
							</div>
							<div class="col-md-5" id="locationmsg"></div>
						</div>
						
						<div class="row" style="margin-bottom: 10px">
							<div class="col-md-2">车位编号：</div>
							<div class="col-md-5"><input name="portNumber" class="form-control" id="portNumber" style="width: 90%">
							
							</div>
							<div class="col-md-5" id="portNumbermsg"></div>
						</div>
							
						<!-- BigDecimal price;//出租价格 -->
						<div class="row" style="margin-bottom: 10px">
							<div class="col-md-2">出租价格(元/天)：</div>
							<div class="col-md-5"><input name="price" id="price" class="form-control" style="width: 90%">
							
							</div>
							<div class="col-md-5" id="pricemsg"></div>
						</div>
						
						<!-- startTime -->
						<div class="row" style="margin-bottom: 10px">
							<div class="col-md-2">起始时间</div>
							<div class="col-md-5"><input name="startTime" class="form-control form_datetime" id="startTime" style="width: 90%">
							
							</div>
							<div class="col-md-5" ></div>
						</div>
						
						<!-- endTime -->
						<div class="row" style="margin-bottom: 10px">
							<div class="col-md-2">截至时间</div>
							<div class="col-md-5"><input name="endTime" class="form-control form_datetime" id="endTime" style="width: 90%">
							
							</div>
							<div class="col-md-5" ></div>
						</div>	
						
						<!-- propImage;//车位照片 -->
						<div class="row" style="margin-bottom: 10px">
							<div class="col-md-1" >产权证照片：</div>
							<div class="col-md-3">
								
								<input id="input-44" name="input44[]" type="file" multiple class="file-loading" required>
							</div>
							
						</div>
						
						<!-- 提交按钮 -->
						<div class="row">
							<div class="col-md-4"></div>
							<div class="col-md-4"><input type="button" id="submitbtn" value="提交"></div>
							<div class="col-md-4"></div>
						</div>
						
				
				</form>
			
			</div>
			<!-- 用两个栅格来占位 -->
			<div class="col-md-3" ></div>
		
		</div>	
	
	</div>
	
</body>

<script>
$(document).on('ready', function() {

$("#submitbtn").on("click",function(){

$("#location").attr("value",$("#province2").val()+" "+$("#city2").val()+" "+$("#district2").val()+" "+$("#locationsub").val())
if(true){


if($("#locationmsg").attr("errorState")=="true"&&$("#propNumbermsg").attr("errorState")=="true"&&$("#portNumbermsg").attr("errorState")=="true"){


$("#dataform").submit();
}else{
//错误状态不能提交表单
alert($("#locationmsg").attr("errorState"))
}

}
   
});


var btnCust ; 
    
    
    $("#input-44").fileinput({
    
    overwriteInitial: true,
    maxFileSize: 1500,
    showClose: false,
    showCaption: false,
    showBrowse: false,
    browseOnZoneClick: true,
    removeLabel: '',
    removeIcon: '<i class="glyphicon glyphicon-remove"></i>',
    removeTitle: 'Cancel or reset changes',
    elErrorContainer: '#kv-avatar-errors-2',
    msgErrorClass: 'alert alert-block alert-danger',
    defaultPreviewContent: '<img src="/uploads/" alt="Click here(只允许.jpg .png格式的图片)" style="width:160px"><h6 class="text-muted"></h6>',
    layoutTemplates: {main2: '{preview} ' + ' {remove} {browse}'},
    allowedFileExtensions: ["jpg", "png", "gif"]
    });
    
    //产权证编号验证
    $("#propNumbermsg").attr("errorState","false");
    var propNumberTest=/^[0-9]{9}$/;
    $("#propNumber").on("blur",function(){
    		$("#propNumbermsg").html("");
    		if(propNumberTest.test($("#propNumber").val())){
    		$("#propNumbermsg").attr("errorState","true");
    		}else{
    		$("#propNumbermsg").html("<p style='color:red'>产权证编号只能是9位数字</p>");
    		$("#propNumbermsg").attr("errorState","false");
    		}
 		
    })
    //地址非空验证
    $("#locationmsg").attr("errorState","false")
    $("#locationsub").on("blur",function(){
    
    $("#locationmsg").html("")
    if ($("#locationsub").val()==""){
    $("#locationmsg").html("<p style='color:red'>地址不能为空</p>");
    $("#locationmsg").attr("errorState","false")
    }else{
    $("#locationmsg").html("")
    $("#locationmsg").attr("errorState","true")
   }
    })
	
	//车位编号非空验证
	
	$("#portNumbermsg").attr("errorState","false")
    $("#portNumber").on("blur",function(){
    
    $("#portNumbermsg").html("")
    if ($("#portNumber").val()==""){
    $("#portNumbermsg").html("<p style='color:red'>地址不能为空</p>");
    $("#portNumbermsg").attr("errorState","false")
    }else{
    $("#portNumbermsg").html("")
    $("#portNumbermsg").attr("errorState","true")
   }
    })
    
    //加载日期组件  minView: '2'  表示只显示到天数
    $(".form_datetime").datetimepicker({format: 'yyyy-mm-dd ',minView: '2',todayBtn: 'linked'});
    
});
</script>
</html>