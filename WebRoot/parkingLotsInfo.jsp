<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>租车信息</title>
</head>
<script type="application/x-javascript">
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
function hideURLbar(){ window.scrollTo(0,1); } 
</script>
<!-- //for-mobile-apps -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="css/galleryeffect.css" rel="stylesheet" type="text/css"
	media="all" />
<link rel="stylesheet" href="css/jquery.flipster.css">
<link rel='stylesheet' href='css/dscountdown.css' type='text/css'
	media='all' />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/font-awesome.css" rel="stylesheet">
<link href="http://fonts.googleapis.com/css?family=Press+Start+2P"
	rel="stylesheet">
<link href="http://fonts.googleapis.com/css?family=Faster+One"
	rel="stylesheet">
<link
	href="http://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i"
	rel="stylesheet">
<link href="css/AnotherWritter.css" type="text/css">
	<script type="text/javascript" src="js/jquery/jquery-2.0.3.js"></script>
<style type="text/css">
.headContainer {
	position: fixed;
	width: 15%;
	height: 80%;
}
</style>
<body>
<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="MainPage.html">HOME</a>
        </div>
        <div class="navbar-brand" id="geren">个人中心</div>
        <div class="navbar-collapse collapse" style="float: right;">
          <form action="login.jsp" class="navbar-form navbar-right" role="form">
            <!-- <div class="form-group">
              <input type="text" placeholder="UserName" class="form-control" name="userName">
            </div>
            <div class="form-group">
              <input type="password" placeholder="Password" class="form-control" name="password">
            </div> -->
           
            <button type="submit" class="btn btn-success" id="login">LOGIN</button>
          	<span style="color: red" id="spanname" >${user.userName}</span>
         	<span><input type="hidden" name ="userName" id="userName" value=${user.userName} ></span>
          </form>
        </div>
      </div>
    </div>
	<div class="services" id="service">
		<div style="text-align: center;">
			<!-- <input type="text" id="location" name="location" placeholder="根据区域搜索" />
	<button id="chaxunbtn" >查询</button> -->

		</div>
		<div style="float: right;padding-right: 5%;" id="showtimes"></div>
		<!-- <div class="headContainer">
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right"
				>

					<li><a href="#service"
						class="hvr-underline-from-center scroll">包租婆个人中心</a></li>
					<li><a href="#team" class="hvr-underline-from-center scroll">求租客个人中心</a></li>
					<li><a href="#gallery"
						class="hvr-underline-from-center scroll">企业中心</a></li>

				</ul>
			</div>
		</div> -->
		<div class="container">
			<div class="wthree_title_agile">
				<h3>
					租车 <span>信息</span> 一览
				</h3>
			</div>
			<div class="row">
				<div class="col-lg-6" style="float: right;">
					<div class="input-group">
						<input type="text" class="form-control" id="location"
							name="location" placeholder="根据区域搜索"> <span
							class="input-group-btn">
							<button class="btn btn-info" type="button" id="chaxunbtn" style="margin-left:5px ">
							<span class="glyphicon glyphicon-search" style="color: green;"></span></button>
						</span>
					</div>
				</div>
			</div>
			<p class="sub_para">click to show detail info</p>
			<div class="inner_w3l_agile_gr1ids" id="vidpinjie" title="点击查看详情">
							
			</div>
			<div class="clearfix"></div>

		</div>
	</div>
	<div class="pagination" style="margin-left: 30%;">
		<input type="button" value="上一页" id="pre" class="btn btn-success">
		<span id="btnPage"></span> <input type="button" value="下一页" id="later"
			class="btn btn-success">
	</div>
</body>

<script type="text/javascript">
	var currentPage = 1;
	var portState=0;
	$(function() {
		addInfo(currentPage);
		if($("#userName").val()!=""){
			$("#spanname").append("  欢迎您登陆");
			$("#login").css('display','none');
		}else{
			$("#login").css('display','block');
		}
		panduan();
	});
	function panduan(){
		$("#geren").on("click",function(){
		$.ajax({
			type : "POST",
			url : "panduan.do",
			success : function(result) {
				location.href=result;
				}
	});
		});
	}
	//增加地址状态分页  
	function addInfo(currentPage) {
		var location = $("#location").val();
		$.ajax({
			type : "POST",
			url : "parkingLostInfo.do",
			data : {
				currentPage : currentPage,
				location : location,
				portState : portState
			},
			success : function(result) {
				creatPage(result);
				creatTable(result);
				
				$("#chaxunbtn").on("click", function() {
					var location = $("#location").val();
					addInfo(currentPage);
				});
			}
		});
		
	}

	//动态添加信息
	function creatTable(result) {

		var divinfo = $("#vidpinjie");
		var msg = '';
		for (var i = 0; i < result.list.length; i++) {
			var str=result.list[i].location;
			var strin=str.substring(0,3);
			var img=result.list[i].propImage;
			if(img==null){
				img="images/moren.png";
			}
					msg += "<a href='carportinfo.jsp?"+result.list[i].portId+"'><div class='col-md-3 agileits_service_grid_btm_left'><div class='agileits_service_grid_btm_left1'><div class='agileits_service_grid_btm_left2' id='divinfo'><h5>大概信息</h5><p>地址:"
					+ strin
					+ "</p><p>money(￥"
					+ result.list[i].price
					+ "/月)</p></div><img src='"+img+"' class='img-responsive'  style='height: 250px'></div></div></a>"
		}
		divinfo.html(msg);	
		if(result.list.length==0){
			/* $("#vidpinjie").html("<img alt='你找错了' src='images/s1.jpg' style='height:500px;width:100%'>"); */
			$("#vidpinjie").html("<h2 style='color:red;text-align: center;'>暂无符合车位,请重新输入或点击任意可选按钮返回查看</h2>")	
			$("#location").val("");
		}
	}
	//分页
	function creatPage(data) {
		$("#btnPage").html("");
		for (var i = 0; i < data.pageBar.length; i++) {
			 var btn = $("<input type = 'button' value='"+data.pageBar[i]+"' class='pagebutton'>"); 
			/* var btn =$("<ul class='pagination'><li value='"+data.pageBar[i]+"'></li></ul>") */
			$("#btnPage").append(btn);
		}
		$(".pagebutton").on("click", function() {
			var pageNum = $(this).val();
			currentPage = pageNum;//显示的当前页
	 		addInfo(currentPage); 
			$(this).css("background-color","yellow")
			 
		});
		if (currentPage != 1) {
			$("#pre").removeAttr("disabled");
		} else {
			$("#pre").attr("disabled", "disabled");
		}

		//前一页
		$("#pre").click(function() {
			if (currentPage != 1) {
				$("#pre").removeAttr("disabled");
				currentPage = data.previousPage;
				addInfo(currentPage);
			} else {
				$("#pre").attr("disabled", "disabled");
			}
		});

		if (currentPage != data.totalPage) {
			$("#later").removeAttr("disabled");
		} else {
			$("#later").attr("disabled", "disabled");
		}
		//后一页
		$("#later").click(function() {
			if (currentPage != data.totalPage) {
				$("#later").removeAttr("disabled");
				currentPage = data.nextPage;
				addInfo(currentPage);
			} else {
				$("#later").attr("disabled", "disabled");
			}
		});
		
	}

	//显示时间
	function show_cur_times() {
		//获取当前日期
		var date_time = new Date();
		//定义星期
		var week;
		//switch判断
		switch (date_time.getDay()) {
		case 1:
			week = "星期一";
			break;
		case 2:
			week = "星期二";
			break;
		case 3:
			week = "星期三";
			break;
		case 4:
			week = "星期四";
			break;
		case 5:
			week = "星期五";
			break;
		case 6:
			week = "星期六";
			break;
		default:
			week = "星期天";
			break;
		}

		//年
		var year = date_time.getFullYear();
		//判断小于10，前面补0
		if (year < 10) {
			year = "0" + year;
		}

		//月
		var month = date_time.getMonth() + 1;
		//判断小于10，前面补0
		if (month < 10) {
			month = "0" + month;
		}

		//日
		var day = date_time.getDate();
		//判断小于10，前面补0
		if (day < 10) {
			day = "0" + day;
		}

		//时
		var hours = date_time.getHours();
		//判断小于10，前面补0
		if (hours < 10) {
			hours = "0" + hours;
		}

		//分
		var minutes = date_time.getMinutes();
		//判断小于10，前面补0
		if (minutes < 10) {
			minutes = "0" + minutes;
		}

		//秒
		var seconds = date_time.getSeconds();
		//判断小于10，前面补0
		if (seconds < 10) {
			seconds = "0" + seconds;
		}

		//拼接年月日时分秒
		var date_str = year + "年" + month + "月" + day + "日 " + hours + ":"
				+ minutes + ":" + seconds + " " + week;

		//显示在id为showtimes的容器里
		document.getElementById("showtimes").innerHTML = date_str;
	}

	//设置1秒调用一次show_cur_times函数
	setInterval("show_cur_times()", 100);
</script>
</html>