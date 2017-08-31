<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'audit.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/boot/bootstrap.css">
	

  </head>
  
  <body>
   	<div>
   		<label>小区位置</label><input type="text" name="location" id="location"> <input type="button" value="查询" class="btn btn-info" onclick="showCarPort(1)">
   		<table class="table-hover table table-striped table-bordered" id="carPorts">
  		
  		</table>
  		<input type="button" value="上一页" id="pre" class="btn btn-success">
  		<span id="btnPage"></span>
  		<input type="button" value="下一页" id="later" class="btn btn-success">
  		
   	</div>
  <a style="color: green;">jdjdjdjdjdj</a>
  </body>
  <script type="text/javascript" src="js/jquery/jquery-2.0.3.js"></script>
  <script type="text/javascript" src="js/yyq/audit.js"></script>

</html>
