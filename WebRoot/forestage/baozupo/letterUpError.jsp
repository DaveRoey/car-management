<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
   <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>

<script type="text/javascript" src="../../js/jquery/jquery-2.0.3.js"></script>
<body>
	<div style="margin-left: 50px;margin-top: 50px">
		<p>操作失败，原密码错误！！
		<span id="seconds" style="color: red">5</span>
		秒后,为您跳转到主页面......
		</p>
	
	</div>


<script type="text/javascript">
	 var i=5;
 window.setInterval(function(){
 if(i>0){
 i=i-1;
 $("#seconds").html(" "+i+"")
 }else{
 location.href="letterMain.html";
 }
 
 }, 1000)

</script>
</body>
</html>