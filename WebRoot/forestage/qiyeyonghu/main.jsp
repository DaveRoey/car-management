<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../css/bootstrap.css"/>
<link rel="stylesheet" type="text/css" href="../../css/yg/reset.css"/>
<link rel="stylesheet" href="../../css/yg/fontcss.css" media="screen" type="text/css" />
<style type="text/css">

        ul{
            display: none;
            width: inherit;
            border: 0px solid #CCCCCC;
            cursor: pointer;
        }
        ol li {
            margin-bottom: 5px;
            color: #222222;
        }
        ol li a{
            color: #222222;
            font-size: 20px;
            opacity: 0.7;
        }
        ul li{
            font-size: 14px;
            width: inherit;
            text-align: center;
            line-height: 25px;
        }
        ul li:hover{
            background: #52baff;
            color: #fff;
        }
        .myTree{
            width: inherit;
            height: 40px;
            line-height: 40px;
            font-size: 18px;
            color: #4c4c4c;
            border: 0px solid #ccc;
            text-align: center;
            cursor: pointer;
        }
        .myTree:hover{
            color: #52baff;
        }
    </style>


</head>
<body>
	<div class="container-fluid">
        <!-- 头部(包含注销、个人中心等功能)-->
        <div class="row" style="background-color: rgba(54, 251, 104, 0.03);height: 50px;margin-bottom: 20px;">
            <div class="col-md-8" style="margin-top: 10px">
            </div>
            <div class="col-md-1" style="margin-top: 10px" >
                
            </div>
            <div class="col-md-1" style="margin-top: 10px">
                <a href="../../qiyeyonghu/stop.do" class="active" >退出登陆</a>
            </div>

        </div>
        <!-- 分隔模块，-->
        <div class="row" style="margin-bottom: 20px">
            <div class="col-md-1"  ></div>
            <!--分隔模块主体-->
            <div class="col-md-10" style="background-color:red;opacity:0.5;height: 70px">
                <p aria-label="CodePen">
                    <span data-text="企">企</span><span data-text="业">业</span><span data-text="用">用</span><span data-text="户">户</span><span data-text="中">中</span><span data-text="心">心</span>
                </p>
            </div>

            <div class="col-md-1"></div>
        </div>
        <!-- 主体部分-->
        <div class="row" style="margin-bottom: 20px;height: 300px" >
            <!--两边分隔-->
            <div class="col-md-1"></div>
            <!--界面主体-->
            <div class="col-md-10">
                <div class="row" style="height: 200px">
                    <!--菜单-->
                    <div class="col-md-2" style="">
                        <div class="navBox" style="background-color: rgba(33, 235, 150, 0.07)">
                            <div class="myTree">账户相关</div>
                            <ul style="display: block;">
                                <li id="changePwd">修改密码</li>


                            </ul>
                            <div class="myTree">个人信息</div>
                            <ul>
                                <li id="showInfor">我的信息</li>
                                <li id="changeInfor">修改信息</li>
                               <!-- <li id="wanshanInfor">完善我的信息</li> --> 
                            </ul>
                            <div class="myTree">交易相关</div>
                            <ul>
                                <li id="showhetong">已成交的合同</li>
                                <li id="freeCarPort">空闲车位</li>
                            </ul>
                        </div>


                    </div>
                    <!--显示主体（表格。。。）-->
                    <div class="col-md-10">
                        <div class="row">
                            <div class="col-md-1"></div>
                            <!--显示内容的部分-->
                            <div class="col-md-11" style="background-color: rgba(33, 235, 150, 0.07)">
                                <div class="row" style="margin: 10px" id="mainTable">

                                </div>
                                <div class="row"  >
                                	<div class="col-md-4"></div>
                                	<div class="col-md-8" >
                                		<nav aria-label="Page navigation">
                                			<ul class="pagination" id="pagediv" style="margin: 0px">
                                			</ul>
                                		</nav>
                                	</div>
                                	
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
            <!-- 最右边空格-->
            <div class="col-md-1"></div>

        <!--底部-->
        <div class="row" style="background-color: #222222;"></div>
        <div class="row" style="">

            <div class="col-md-2 " style="height: 100px">
            </div>
            <div class="col-md-2">
                <ol>
                    <li style="font-size: 26px">合作单位</li>
                    <li><a href="#" >阿里巴巴</a></li>
                    <li><a href="#">京东</a></li>
                    <li><a href="#">郎沃</a></li>
                </ol>
            </div>
            <div class="col-md-2">
                <ol>
                    <li style="font-size: 26px">关于我们</li>
                    <li><a href="#" >企业文化</a></li>
                    <li><a href="#">加入我们</a></li>
                    <li><a href="#">郎沃</a></li>
                </ol>
            </div>
            <div class="col-md-2">
                <ol>
                    <li style="font-size: 26px">帮助中心</li>
                    <li><a href="#" >常见问题</a></li>
                    <li><a href="#">更多帮助</a></li>
                    <li><a href="#">意见反馈</a></li>
                </ol>
            </div>
            <div class="col-md-2">
                <ol>
                    <li style="font-size: 26px">关于郎沃</li>
                    <li><a href="#" >了解郎沃</a></li>
                    <li><a href="#">加入郎沃</a></li>

                </ol>
            </div>

        </div>


        </div>





    </div>

</body>
<script src="../../js/jquery/jquery-2.0.3.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
        $(".myTree").on("click",function(){
            $(this).next("ul").slideToggle(300).siblings("ul").slideUp(500)
        })
        //默认显示“我的信息”
       // $("#mainTable").html("");
        //var msg="<div class='row form-group'><div class='col-md-2 '>企业名称：</div><div class='col-md-5'><input type='text' class='form-control' disabled placeholder=''  value=''></div></div><div class='row form-group'><div class='col-md-2 '>企业位置：</div><div class='col-md-5'><input type='text' class='form-control' disabled placeholder='' value=''></div> </div> <div class='row form-group'><div class='col-md-2 '>法人代表：</div><div class='col-md-5'><input type='text' class='form-control' disabled placeholder='' value=''></div></div><div class='row form-group'><div class='col-md-2 '>联系电话：</div><div class='col-md-5'><input type='text' class='form-control ' disabled placeholder=''  value=''></div></div>"
        //$("#mainTable").append(msg);

        //"修改密码"事件
        $("#changePwd").on("click",function(){
            $("#mainTable").html("");
            
           //修改密码的界面信息
            var msg="<div class='row form-group'><div class='col-md-2 '>原密码：</div><div class='col-md-5'><input type='text' class='form-control' placeholder='请输入6-15位原密码' id='oldpwd' ></div><div class='col-md-5' id='oldErrorMsg'></div></div><div class='row form-group'><div class='col-md-2'>新密码：</div><div class='col-xs-5'><input type='text'  class='form-control'placeholder='请输入6-15位新密码'  id='newpwd'></div> <div class='col-md-5' id='newErrorMsg'></div></div><div class='row form-group'><div class='col-md-2'>确认新密码：</div><div class='col-xs-5'><input type='text'  class='form-control' placeholder='请确认新密码密码' id='secondpwd'></div><div class='col-md-5' id='secondErrorMsg'></div></div><div class='row form-group'><div class='col-md-3'> </div><div class='col-md-3'><input type='button' class='btn btn-default' value='提交' id='sendChangePwd'></div></div>";
            $("#mainTable").append(msg);
            
            //“密码”正则验证
            var pwdzhengze=/^[0-9a-zA-Z]{6,15}$/;
           	var oldErrorMsgstate=$("#oldErrorMsg").attr("errorState","true");
            var newErrorMsgstate=$("#newErrorMsg").attr("errorState","true");
            var secondErrorMsgstate=$("#secondErrorMsg").attr("errorState","true");
            //密码格式统一验证方法
            function pwdtest(msgbody ,errorbody){
            	 msgbody.on("blur",function(){
            		errorbody.html("");
            	 if(pwdzhengze.test($(this).val())){
            	  errorbody.html("");
            	  errorbody.prop("errorState","false")
            	  
            	 }else{
            	 	errorbody.html("<span style='color:red'>请输入6-15位数字或者字母</span>");
            	 	errorbody.prop("errorState","true");
            	 	
            	 }
            	 
            	})
            	
            }
            //两次密码输入验证
          	function checkpwd(){
          		  $("#secondpwd").on("blur",function(){
            	$("#secondErrorMsg").html(" ")
            	if($("#secondpwd").val()!=$("#newpwd").val()){
            	$("#secondErrorMsg").html("<span style='color:red'>两次密码不一致</span>");
            	$("#secondErrorMsg").prop("errorState","true")
            	}else{
            		$("#secondErrorMsg").html(" ")
            		$("#secondErrorMsg").prop("errorState","false")
            	}
            })
          	}
            
            
            
            pwdtest($("#oldpwd"),$("#oldErrorMsg"));
            pwdtest($("#newpwd"),$("#newErrorMsg"));
            pwdtest($("#secondpwd"),$("#secondErrorMsg"));
            checkpwd();
            
            
            
            //为“提交”绑定事件
            $("#sendChangePwd").on("click",function(){
            
            	 var newpwd=$("#newpwd").val();
            	 var oldpwd=$("#oldpwd").val();
            	  oldErrorMsgstate=$("#oldErrorMsg").prop("errorState");
           		  newErrorMsgstate=$("#newErrorMsg").prop("errorState");
                  secondErrorMsgstate=$("#secondErrorMsg").prop("errorState");
                 
            	 if(oldErrorMsgstate=="false"&&newErrorMsgstate=="false"&&secondErrorMsgstate=="false"){
           			//验证通过，fasong
           				
				$.ajax({
            	url:"${pageContext.request.contextPath}/qiyeyonghu/changePwd.do",
            	type:"post",
            	data:{"newpwd":newpwd,"oldpwd":oldpwd},
            	success:function(result){
            		if(result=="ok"){
            			$("#mainTable").html("修改密码成功");
            		}else{
            			$("#mainTable").html("与原密码不匹配，修改密码失败");
            		}
            	}
            
            	})
           			
            }
            	
            })
        })
        //“我的信息”事件
        $("#showInfor").on("click",function(){
            $("#mainTable").html("");
            
            $.ajax({
            	url:"${pageContext.request.contextPath}/qiyeyonghu/showInfor.do",
            	type:"post",
            	success:function(result){
            		var msg="<div class='row form-group'><div class='col-md-2 '>企业名称：</div><div class='col-md-5'><input type='text' class='form-control' disabled placeholder=''  value='"+result.etpName+"'></div></div><div class='row form-group'><div class='col-md-2 '>企业位置：</div><div class='col-md-5'><input type='text' class='form-control' disabled placeholder='' value='"+result.location+"'></div> </div> <div class='row form-group'><div class='col-md-2 '>法人代表：</div><div class='col-md-5'><input type='text' class='form-control' disabled placeholder='' value='"+result.contact+"'></div></div><div class='row form-group'><div class='col-md-2 '>联系电话：</div><div class='col-md-5'><input type='text' class='form-control ' disabled placeholder=''  value='"+result.phone+"'></div></div>"
            		$("#mainTable").append(msg);	
            	}
            })
            
        })
        //“修改信息”事件
        $("#changeInfor").on("click",function(){
        	$("#mainTable").html("");
        	$.ajax({
        		url:"${pageContext.request.contextPath}/qiyeyonghu/showInfor.do",
        		type:"post",
        		success:function(result){
        		var msg="";
        		msg="<div class='row form-group'><div class='col-md-2 '>企业名称：</div><div class='col-md-5'><input type='text' class='form-control'  placeholder='"+result.etpName+"'  value='' id='etpName'></div></div><div class='row form-group'><div class='col-md-2 '>企业位置：</div><div class='col-md-5'><input type='text' class='form-control'  placeholder='"+result.location+"' value='' id='location'></div> </div> <div class='row form-group'><div class='col-md-2 '>法人代表：</div><div class='col-md-5'><input type='text' class='form-control'  placeholder='"+result.contact+"' value='' id='contact'></div></div><div class='row form-group'><div class='col-md-2 '>联系电话：</div><div class='col-md-5'><input type='text' class='form-control '  placeholder='"+result.phone+"'  value='' id='phone'></div></div><div class='row form-group'><div class='col-md-3'> </div><div class='col-md-3'><input type='button' class='btn btn-default' value='提交' id='sendChangeInfor'></div></div>"
        		$("#mainTable").append(msg);
        		
        			//为提交修改信息绑定事件
        			$("#sendChangeInfor").on("click",function(){
        				var  etpName=$("#etpName").val();
        				var location=$("#location").val();
        				var contact=$("#contact").val();
        				var phone=$("#phone").val();
        				
        				
        				
        				if(true){
        					$.ajax({
        					url:"${pageContext.request.contextPath}/qiyeyonghu/changeInfor.do",
        					type:"post",
        					data:{"etpName":etpName,"location":location,"contact":contact,"phone":phone},
        					success:function(result){
        						if(result=="ok"){
        							$("#mainTable").html("修改信息成功")
        						}else{
        							$("#mainTable").html("修改信息失败，请重新再试")
        						}
        					}
        				})
        				
        				}
        			})	
        		}
        	})
            
           
        })
        //“完善我的信息”事件
        //$("#wanshanInfor").on("click",function(){
          //  $("#mainTable").html("");
            //var msg="";
            //$("#mainTable").append(msg);
        //})
        //“已成交合同”事件
        $("#showhetong").on("click",function(){
            $("#mainTable").html("");
            
            var currentPage=1;
            showHeTong(currentPage);
            function showHeTong(currentPage){
            $("#mainTable").html("");
            		$.ajax({
            			url:"${pageContext.request.contextPath}/qiyeyonghu/showAllHeTong.do",
            			type:"post",
            			data:{"currentPage":currentPage},
            			success:function(result){
            			initTable(result);
            			initPage(result);
            			
            			 //为“查看车位”增加事件
            			$(".showCarPort").on("click",function(){
                			$("#mainTable").html("");
                			var carcurrentPage=1;
                			var treatyId=$(this).prop("id");
                			showCarport(carcurrentPage,treatyId);
                			
                			function showCarport(carcurrentPage,treatyId){
                			$("#mainTable").html("");
                				$.ajax({
                				url:"${pageContext.request.contextPath}/qiyeyonghu/showAllCarport.do",
                				type:"post",
                				data:{"treatyId":treatyId,"currentPage":carcurrentPage},
                				success:function(result){
                					 
            						var carmsg="<table class='table'><thead><tr><td>地址</td><td>车位编号</td><td>价格</td><td>开始时间</td><td>截至时间</td></tr></thead><tbody>"
            						//循环获得表格数据
            						for (var i = 0; i < result.list.length; i++) {
									carmsg+="<td>"+result.list[i].port.portAdress+"</td><td>"+result.list[i].port.portNumber+"</td><td>20</td><td>2014年10月20日</td><td>2014年10月27日</td></tr>"
									}
			           		 		carmsg+="</tbody></table>";
           		 					$("#mainTable").append(carmsg);	
           		 					//加载page
           		 					initcarpage(result);
           		 					 //加载page的方法
            function initcarpage(result){
            	$("#pagediv").html(" ");
            	var pageMsg="<li id='currentdel'><a href='#' >«</a></li>";
      			for (var j = 0; j < result.totalPage; j++) {
				 if(carcurrentPage==(j+1)){
				 pageMsg+="<li class='active'><a href='#' class='pageBtn'>"+(j+1)+"</a></li>";
				 }else{
				 pageMsg+="<li><a href='#' class='pageBtn'>"+(j+1)+"</a></li>";
				 }
				}
				pageMsg+="<li id='currentadd'><a href='#' >»</a></li>"
				$("#pagediv").append(pageMsg);	
				//增加点击事件
				$(".pageBtn").on("click",function(){
      		
      				carcurrentPage=$(this).text();
      				
      				showCarport(carcurrentPage, treatyId);
      				
      			})
      			//为上一页绑定事件
      			$("#currentdel").on("click",function(){
      			if(carcurrentPage>1){
      				
      			carcurrentPage=carcurrentPage-1;
      			showCarport(carcurrentPage, treatyId);
      			}else{
      				//否则上一页禁用
      				
      				}
      			})
      			//为下一页绑定事件
      			$("#currentadd").on("click",function(){
      			if(carcurrentPage<result.totalPage){
      			carcurrentPage=carcurrentPage+1;
      			
      			showCarport(carcurrentPage, treatyId)
      			}
      			})
            }
                					
                				}
                			})
                			}
                			
                			
           				
            			})
            		}
            	})
            	
            }
            //加载表格的方法
            function initTable(result){
            	var msg="<table class='table'><thead><tr><td>合同号</td><td>合同开始日期</td><td>合同结束日期</td></tr></thead><tbody>";
            	//循环获得表格数据
            	for (var i = 0; i < result.list.length; i++) {
					msg+="<tr><td>"+result.list[i].treatyNumber+"</td><td>"+result.list[i].treatyNumber+"</td><td>"+result.list[i].treatyNumber+"</td><td><input type='button' class='btn showCarPort' value='查看车位' id='"+result.list[i].treatyId+"' ></td></tr>";
				}
           		 msg+="</tbody></table>";
           		 $("#mainTable").append(msg);
            }
            //加载page的方法
            function initPage(result){
            	$("#pagediv").html(" ");
            	var pageMsg="<li id='currentdel'><a href='#' >«</a></li>";
      			for (var j = 0; j < result.totalPage; j++) {
				if(currentPage==(j+1)){
					pageMsg+="<li class='active'><a href='#' class='pageBtn'>"+(j+1)+"</a></li>";
				}else{
					pageMsg+="<li ><a href='#' class='pageBtn'>"+(j+1)+"</a></li>";
					}
				}
				pageMsg+="<li id='currentadd'><a href='#' >»</a></li>"
				$("#pagediv").append(pageMsg);	
				//增加点击事件
				$(".pageBtn").on("click",function(){
      		
      				currentPage=$(this).text();
      				
      				
      				showHeTong(currentPage);
      				
      			})
      			//为上一页绑定事件
      			$("#currentdel").on("click",function(){
      			if(currentPage>1){
      				
      			currentPage=currentPage-1;
      			showHeTong(currentPage);
      			}else{
      				//否则上一页禁用
      				
      				}
      			})
      			//为下一页绑定事件
      			$("#currentadd").on("click",function(){
      			if(currentPage<result.totalPage){
      			currentPage=currentPage+1;
      			
      			showHeTong(currentPage);
      			}
      			})
            }
           
        })
        //“空闲车位”事件
        $("#freeCarPort").on("click",function(){
            $("#mainTable").html("");
            var carCurrentPagefree=1;
            //加载第一页
            initFreeCar(carCurrentPagefree);
            function initFreeCar(carCurrentPagefree){
            	$("#mainTable").html("");
            	$.ajax({
            		url:"${pageContext.request.contextPath}/qiyeyonghu/showFreeCarPort.do",
            		type:"post",
            		data:{"currentPage":carCurrentPagefree},
            		success:function(result){
            		//加载表格数据
            		
            var carmsg="<table class='table'><thead><tr><td>地址</td><td>车位编号</td><td>价格</td><td>最长可租日期</td></tr></thead><tbody>";
            for (var i = 0; i < result.list.length; i++) {
				carmsg+="<td>"+result.list[i].portAdress+"</td><td>"+result.list[i].portNumber+"</td><td>20</td><td>2014年10月20日</td></tr>"
			}
            	carmsg+="</tbody></table>";
            $("#mainTable").append(carmsg);
            		//加载page
            		initcarpagefree(result)
            		}
            	})
            }
            
            function initcarpagefree(result){
            	$("#pagediv").html(" ");
            	var pageMsg="<li id='currentdel'><a href='#' >«</a></li>";
      			for (var j = 0; j < result.totalPage; j++) {
					if(carCurrentPagefree==(j+1)){
					pageMsg+="<li class='active'><a href='#' class='pageBtn'>"+(j+1)+"</a></li>";
					}else{
						pageMsg+="<li><a href='#' class='pageBtn'>"+(j+1)+"</a></li>";
					}
				}
				pageMsg+="<li id='currentadd'><a href='#' >»</a></li>"
				$("#pagediv").append(pageMsg);	
				//增加点击事件
				$(".pageBtn").on("click",function(){
      			
      				carCurrentPagefree=$(this).text();
      				
      				initFreeCar(carCurrentPagefree);
      				
      			})
      			//为上一页绑定事件
      			$("#currentdel").on("click",function(){
      			if(carCurrentPagefree>1){
      				
      			carCurrentPagefree=carCurrentPagefree-1;
      			initFreeCar(carCurrentPagefree)
      			}else{
      				//否则上一页禁用
      				
      				}
      			})
      			//为下一页绑定事件
      			$("#currentadd").on("click",function(){
      			if(carCurrentPagefree<result.totalPage){
      			carCurrentPagefree=carCurrentPagefree+1;
      			
      			initFreeCar(carCurrentPagefree)
      			}
      			})
            }
            
            
        })
    })
</script>
</html>