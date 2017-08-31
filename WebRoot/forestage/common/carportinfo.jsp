<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script type="text/javascript" src="../../js/jquery/jquery-2.0.3.js"></script>
<script type="text/javascript" src="../../js/bootstrap.js"></script>
<link rel="stylesheet" href="../../css/bootstrap.css">
<link rel="stylesheet" href="../../css/carportinfo/animate.css">
<link rel="stylesheet" href="../../css/carportinfo/bootstrap.css">
<link rel="stylesheet" href="../../css/carportinfo/style.css">

<script src="../../js/carportinfo/jquery.min.js"></script>

	<script src="../../js/carportinfo/jquery.waypoints.min.js"></script>
	
	<script src="../../js/carportinfo/superfish.js"></script>
	<!-- Flexslider -->
	<script src="../../js/carportinfo/jquery.flexslider-min.js"></script>
	<!-- Date Picker -->
	<script src="../../js/carportinfo/bootstrap-datepicker.min.js"></script>
	
	<!-- Main JS -->
	<script src="../../js/carportinfo/main.js"></script>
</head>
<body>
	<aside id="fh5co-hero" class="js-fullheight">
	<div class="flexslider js-fullheight">
		<ul class="slides" style="padding-left: 0px">
			<li style="background-image: url(../../images/s1.jpg);">
				<div
					class="col-md-4 col-md-offset-4 col-md-pull-4 js-fullheight slider-text">
					<div class="slider-text-inner">
						<div class="desc">
							<span class="status">详细信息</span>
							<h5 class="bianhao" style="color: white;">编号:</h5>
							<h5 style="color: white;">￥<span class="price" style="font-size: 30px;color: red;"></span>/天</h5>
							<p class="address">地址:</p>
							<p class="time">发布时间:</p>
							<!-- <p class="name">车主名字:</p> -->
							<textarea class="form-control" rows="3" placeholder="留言"></textarea>
							<p>
							<button type="button" class="btn btn-success" id="btn-success">预约</button>
							<a href="parkingLotsInfo.jsp"><button type="button" class="btn btn-success" style="margin-left: 38%">返回</button></a>
							</p>
						</div>
					</div>
				</div>
			<!-- <ul class="slides">
				<div class="col-md-4 col-md-offset-4 col-md-pull-4 js-fullheight slider-text">
				<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
				</div>
				</div>
			</ul> -->		
		</ul>
		<!-- <div id="carousel-example-generic" class="carousel slide" data-ride="carousel" style="width: 600px;height: 400px;float: left;margin-top: -53%;z-index: 4;margin-left: 40%">
  Indicators
  <ol class="carousel-indicators">
    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
  </ol>

  Wrapper for slides
  <div class="carousel-inner">
   	<div class="item active">
      <img src="images/g1.jpg" alt="...">
  	</div>
    <div class="item">
      <img src="images/g2.jpg" alt="...">
  	</div>
  	<div class="item">
      <img src="images/g3.jpg" alt="...">
  	</div>
</div>
  Controls
  <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left"></span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right"></span>
  </a>
</div> -->
	</div>
	</aside>
</body>

<script type="text/javascript">
	$(function() {
		creatTable();
	});
	function creatTable() {
		var id = location.search;
		if (id.indexOf("?") != -1) {
			var portId = id.substr(1);
		}
		$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath}/carportFindAll.do",
			data : {
				portId : portId
			},
			success : function(result) {
				/* var msg = "";
				msg += "<li>证书编号:" + result.propNumber + "</li><li>地址:"
						+ result.location + "</li><li>租金:" + result.price
						+ "</li><li>发布时间:" + result.startTime + "</li>";
				infoid.append(msg); */
				$(".price").append(result.price);
				$(".bianhao").append(result.propNumber);
				$(".address").append(result.location);
				$(".time").append(result.startTime);
				/* $(".name").append(result.letter.userName); */
			}
		});
	}
	$("#btn-success").on("click",function(){
		var rentState=0;
		var message=$(".form-control").val();
		var id = location.search;
		if (id.indexOf("?") != -1) {
			var portId = id.substr(1);
		}
		$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath}/addcarportinfo.do",
			data : {
				rentState:rentState,
				message:message,
				portId:portId
			},
			success : function(result) {
			if(result=="login.jsp"){
			alert('请登录');
			location.href="../../"+result;
			}
			if(result=="parkingLotsInfo.jsp"){
			alert('预约成功');
			location.href=result;
			}
			if(result=="letter"){
			alert("包租婆不能预约")
			$("#btn-success").attr("disabled","disabled");
			}
			if(result=="enterprise"){
			alert("企业不能预约")
			$("#btn-success").attr("disabled","disabled");
			}
			}
			});
	});
</script>
</html>