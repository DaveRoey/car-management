<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'changeLetterMessage.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/boot/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="css/yyq/lettermain.css">

  </head>
  
  <body>
  <div class="container">
  	<div class="col-sm-3"></div>
  	<div class="col-sm-6">
  		<form class="form-horizontal" role="form">
  			
  			<div class="form-group"><!-- 1 -->
  			
   				<label for="inputEmail3" class="col-sm-2 control-label">用户名</label>
   				 <div class="col-sm-9">
      				<input style="text-align: left;border: 0px;cursor: not-allowed;" type="button" class="form-control" id="userName" value="${sessionScope.user.userName }">
   					
   				 </div>
   				
  			</div>
  			<!-- 2 -->
 			<div class="form-group">
    			<label for="inputPassword3" class="col-sm-2 control-label">原密码</label>
   			 	<div class="col-sm-9">
      			<input type="password" class="form-control" id="oldPwd" placeholder="0-9长度8-15">
    			<span class="glyphicon glyphicon-eye-close password"></span>
    			<span class="glyphicon glyphicon-remove-circle col-sm-1"></span>
    			</div>
    			
  			</div>
  			<!-- 3 -->
  			<div class="form-group">
    			<label for="inputPassword3" class="col-sm-2 control-label">新密码</label>
   			 	<div class="col-sm-9">
      			<input type="password" class="form-control" id="newPwd" placeholder="0-9长度8-15">
    			<span class="glyphicon glyphicon-eye-close password"></span>
    			<span class="glyphicon glyphicon-remove-circle col-sm-1"></span>
    			</div>
    			<span class="col-sm-1"></span>
  			</div>
  			<!-- 4 -->
  			<div class="form-group">
    			<label for="inputPassword3" class="col-sm-2 control-label">确认密码</label>
   			 	<div class="col-sm-9">
      			<input type="password" class="form-control" id="surePwd" placeholder="0-9长度8-15，与前密码相同">
    			<span class="glyphicon glyphicon-eye-close password"></span>
    			<span class="glyphicon glyphicon-remove-circle col-sm-1"></span>
    			</div>
    			<span class="col-sm-1"></span>
  			</div>
  			<!-- 5 -->
  			<div class="form-group">
    			<label for="inputPassword3" class="col-sm-2 control-label">真是姓名</label>
   			 	<div class="col-sm-9">
      			<input style="text-align: left;border: 0px;cursor: not-allowed;" type="button" class="form-control" id="realName" value="${sessionScope.user.realName }">
    			
    			</div>
    			
  			</div>
  			<!-- 6 -->
  			<div class="form-group">
    			<label for="inputPassword3" class="col-sm-2 control-label">家庭地址</label>
   			 	<div class="col-sm-9">
      			<input type="text" class="form-control" id="address" value="${sessionScope.user.address }">
    			<span class="glyphicon glyphicon-remove-circle col-sm-1"></span>
    			</div>
    			<span class="col-sm-1"></span>
  			</div>
  			<!-- 7 -->
  			<div class="form-group">
    			<label for="inputPassword3" class="col-sm-2 control-label">身份证</label>
   			 	<div class="col-sm-9">
      			<input style="text-align: left;border: 0px;cursor: not-allowed;" type="button" class="form-control" id="indentNumber" value="${sessionScope.user.indentNumber }">
    			
    			</div>
    			
  			</div>
  			<!-- 8 -->
  			<div class="form-group">
    			<label for="inputPassword3" class="col-sm-2 control-label">电话号码</label>
   			 	<div class="col-sm-9">
      			<input type="text" class="form-control" id="phone" value="${sessionScope.user.phone }">
    			<span class="glyphicon glyphicon-remove-circle col-sm-1"></span>
    			</div>
    			<span class="col-sm-1"></span>
  			</div>
  			<!-- 9 -->
  			<div class="form-group">
    			<label for="inputPassword3" class="col-sm-2 control-label">职业</label>
   			 	<div class="col-sm-9">
      			<input type="text" class="form-control" id="profession" value="${sessionScope.user.profession }">
    			</div>
    			
  			</div>
  			<!-- 10 -->
  			<div class="form-group">
    			<label for="inputPassword3" class="col-sm-2 control-label">邮箱</label>
   			 	<div class="col-sm-9">
      			<input type="text" class="form-control" id="email" value="${sessionScope.user.email }">
    			</div>
    			
  			</div>

  			<div class="form-group">
  				<div class="col-sm-3"></div>
    			<div class="col-sm-offset-2 col-sm-9" style="text-align: center">
    			
      				<button type="submit" class="btn btn-default">确定</button>
   				</div>
  			</div>
		</form>
  	</div>
  	
  </div>
   
  </body>
  
  <script type="text/javascript" src="js/jquery/jquery-2.0.3.js"></script>
  <script type="text/javascript" src="js/yyq/letterChange.js"></script>
</html>
