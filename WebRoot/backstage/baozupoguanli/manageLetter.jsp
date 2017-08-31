<%--
  Created by IntelliJ IDEA.
  User: Dave
  Date: 2017/8/20
  Time: 22:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>管理员主界面</title>
    <meta name="description" content="这是一个 index 页面">
    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <link rel="icon" type="image/png" href="../../images/backimg/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="../../images/backimg/i/app-icon72x72@2x.png">
    <meta name="apple-mobile-web-app-title" content="Amaze UI"/>
    <link rel="stylesheet" href="../css/backcss/comm/amazeui.min.css"/>
    <link rel="stylesheet" href="../css/backcss/comm/admin.css">
    <link rel="stylesheet" href="../css/backcss/comm/app.css">
    <script src="../../js/backjs/comm/echarts.min.js"></script>

</head>

<body data-type="generalComponents">

<div class="tpl-content-page-title">
    CBD 包租婆管理
</div>
<ol class="am-breadcrumb">
    <li><a href="#" class="am-icon-home">包租婆管理</a></li>
    <li><a href="#">包租婆管理</a></li>
    <li class="am-active">内容</li>
</ol>
<div class="tpl-portlet-components">
    <div class="portlet-title">
        <div class="caption font-green bold">
            <span class="am-icon-code"></span> 列表
        </div>


    </div>
    <div class="tpl-block">
        <div class="am-g">
            <div class="am-u-sm-12 am-u-md-6">
                <div class="am-btn-toolbar">
                    <div class="am-btn-group am-btn-group-xs">
                        <button type="button" class="am-btn am-btn-default am-btn-success" id="shenHeAll"><span
                                class="am-icon-archive"></span> 审核
                        </button>
                        <button type="button" class="am-btn am-btn-default am-btn-danger" id="delAll"><span
                                class="am-icon-trash-o"></span> 删除
                        </button>

                    </div>
                </div>
            </div>
            <div class="am-u-sm-12 am-u-md-3">
                <div class="am-form-group">
                    <select data-am-selected="{btnSize: 'sm'}" id="stateSelect">
                        <option value="0">未审核</option>
                        <option value="4">全部</option>
                        <option value="1">已审核</option>
                        <option value="2">已禁用</option>
                    </select>
                </div>
            </div>


            <div class="tpl-portlet-input tpl-fz-ml">
                <div class="portlet-input input-small input-inline">
                    <div class="input-icon right">
                        <i class="am-icon-search"></i>
                        <input type="text" class="form-control form-control-solid" id="letterName" placeholder="姓名查询..."></div>
                </div>
            </div>


        </div>
    </div>
    <div class="am-g">
        <div class="am-u-sm-12">

                <table class="am-table am-table-striped am-table-hover table-main">
                    <thead>
                    <tr>
                        <th class="table-check"><input type="checkbox" class="tpl-table-fz-check" id="checkAll"></th>
                        <th class="table-title">用户名</th>
                        <th class="table-type">地址</th>
                        <th class="table-author am-hide-sm-only">身份证</th>
                        <th class="table-date am-hide-sm-only">电话</th>
                        <th class="table-set">操作</th>
                    </tr>
                    </thead>
                    <tbody id="letterTable">
                    <tr>
                        <td><input type="checkbox"></td>
                        <td><a href="#">刘亦菲</a></td>
                        <td>四川重庆三峡移民</td>
                        <td class="am-hide-sm-only">777777777788888888</td>
                        <td class="am-hide-sm-only">18780028102</td>
                        <td>
                            <div class="am-btn-toolbar">
                                <div class="am-btn-group am-btn-group-xs">
                                    <button class="am-btn am-btn-default am-btn-xs am-text-success"><span
                                            class="am-icon-search"></span> 审核
                                    </button>
                                    <button class="am-btn am-btn-default am-btn-xs am-hide-sm-only checkBtn"><span
                                            class="am-icon-eye"></span> 查看
                                    </button>
                                    <button class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only">
                                        <span class="am-icon-trash-o"></span> 删除
                                    </button>
                                </div>
                            </div>
                        </td>
                    </tr>
                   
                    
                    

                    </tbody>
                </table>
                <div class="am-cf">

                    <div class="am-fr">
                        <ul class="am-pagination tpl-pagination" id="pageUl">
                            <li class="am-disabled"><a href="#">«</a></li>
                            <li class="am-active"><a href="#">1</a></li>
                            <li><a href="#">2</a></li>
                            <li><a href="#">3</a></li>
                            <li><a href="#">4</a></li>
                            <li><a href="#">5</a></li>
                            <li><a href="#">»</a></li>
                        </ul>
                    </div>
                </div>


                <hr>

        </div>

        <!--模态框-->
        <div class="am-modal am-modal-no-btn" tabindex="-1" id="doc-modal-1">
            <div class="am-modal-dialog">
                <div class="am-modal-hd">包租婆信息
                    <a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close>&times;</a>
                </div>
                <div class="am-modal-bd">
                        <div class="am-form-group">
                            <label for="user-number" class="am-u-sm-3 am-form-label">用户名</label>
                            <div class="am-u-sm-9">
                                <input type="text" disabled value="李美丽" id="user-number" class="am-form-field">
                            </div>
                        </div>

                        <div class="am-form-group">
                            <label for="user-relname" class="am-u-sm-3 am-form-label">真实姓名</label>
                            <div class="am-u-sm-9">
                                <input type="text" disabled value="撸至深" id="user-relname">
                            </div>
                        </div>

                        <div class="am-form-group">
                            <label for="user-addr" class="am-u-sm-3 am-form-label">家庭地址</label>
                            <div class="am-u-sm-9">
                                <input type="text" disabled value="四川成都郫县红光大道" id="user-addr">
                            </div>
                        </div>
                        <div class="am-form-group">
                            <label for="user-indentity" class="am-u-sm-3 am-form-label">身份证</label>
                            <div class="am-u-sm-9">
                                <input type="text" disabled value="510525199609114131" id="user-indentity">
                            </div>
                        </div>

                        <div class="am-form-group">
                            <label for="user-phone" class="am-u-sm-3 am-form-label">电话号码</label>
                            <div class="am-u-sm-9">
                                <input type="tel" disabled value="18780026189" id="user-phone">
                            </div>
                        </div>

                        <div class="am-form-group">
                            <label for="user-profess" class="am-u-sm-3 am-form-label">职业</label>
                            <div class="am-u-sm-9">
                                <input type="tel" disabled value="医生" id="user-profess">
                            </div>
                        </div>
                        <div class="am-form-group">
                            <label for="user-email" class="am-u-sm-3 am-form-label">邮箱</label>
                            <div class="am-u-sm-9">
                                <input type="text" disabled value="38978828@qq.com" id="user-email" placeholder="重复密码">
                            </div>
                        </div>
                </div>
            </div>
        </div>

    </div>
</div>
<div class="tpl-alert"></div>
<script src="../js/jquery.json-2.4.js"></script>
<script type="text/javascript">
    $(function () {
    
    
      		//删除	
      			$(document).on("click",".shanchubtnyg",function(){
      			var id=$(this).prop("value");
      			alert(id);
      			$.ajax({
      				url:"${pageContext.request.contextPath}/LetterOfManager/delLetter.do",
					type:"post",
					data:{"letterId":id},
					success: function(result){
						
					}
      			
      			
      			})
      			
      			})
        
        
      
      //先显示默认界面
      var currentPage=1;
     showLetter(currentPage)  ;
     
     
     
     	//
       function showLetter(currentPage){
       $.ajax({
       url : "${pageContext.request.contextPath}/LetterOfManager/showLetters.do",
       type : "post",
       data: {"stateSelect":$("#stateSelect").val(),"letterName":$("#letterName").val(),"currentPage":currentPage},
       success:function(result){
      		
      		$("#letterTable").html("");
      		
      		var msg;
      	
      		var selectnum=$("#stateSelect").val();
      		if(selectnum==4){
      		//全部界面
      		for (var i = 0; i < result.list.length; i++) {
				msg+="<tr><td><input type='checkbox' class='isChecked' value='"+result.list[i].letterId+"'></td><td>"+result.list[i].userName
				+"</td><td>"+result.list[i].address
				+"</td><td>"+result.list[i].indentNumber
				+"</td><td>"+result.list[i].phone
				+"</td><td><div class='sam-btn-toolbar'><div class='am-btn-group am-btn-group-xs'></div></div></td></tr>"
			}
			$("#letterTable").append(msg)
      		
      		}else if(selectnum==0){
      		//未审核的界面
      		for (var i = 0; i < result.list.length; i++) {
				msg+="<tr><td><input type='checkbox' class='isChecked' value='"+result.list[i].letterId+"'></td><td>"+result.list[i].userName
				+"</td><td>"+result.list[i].address
				+"</td><td>"+result.list[i].indentNumber
				+"</td><td>"+result.list[i].phone
				+"</td><td><div class='sam-btn-toolbar'><div class='am-btn-group am-btn-group-xs'><button class='am-btn am-btn-default am-btn-xs am-text-success shenhebtnyg' value='"+result.list[i].letterId+"'><span class='am-icon-search'>审核</span></button></div></div></td></tr>"
			}
			$("#letterTable").append(msg)
      		}else if(selectnum==1){
      		//已审核的界面
      		for (var i = 0; i < result.list.length; i++) {
				msg+="<tr><td><input type='checkbox' class='isChecked' value='"+result.list[i].letterId+"'></td><td>"+result.list[i].userName
				+"</td><td>"+result.list[i].address
				+"</td><td>"+result.list[i].indentNumber
				+"</td><td>"+result.list[i].phone
				+"</td><td><div class='sam-btn-toolbar'><div class='am-btn-group am-btn-group-xs'></div></div></td></tr>"
			}
			$("#letterTable").append(msg)
      		
      		}else {
      		//禁用的界面
      		for (var i = 0; i < result.list.length; i++) {
				msg+="<tr><td><input type='checkbox'></td><td>"+result.list[i].userName
				+"</td><td>"+result.list[i].address
				+"</td><td>"+result.list[i].indentNumber
				+"</td><td>"+result.list[i].phone
				+"</td><td><div class='sam-btn-toolbar'><div class='am-btn-group am-btn-group-xs'></div></div></td></tr>"
			}
			$("#letterTable").append(msg)
      		
      		}
      		//为审核、查看、删除绑定事件
      		//审核
      			$(".shenhebtnyg").on("click",function(){
      			var id=$(this).prop("value");
      			
      			//为啥跳到主界面？
      			shenheone(id);
      			
      			showLetter(1);
      			
      			
      			})
      		
      		//添加复选框全选，反选操作		

						$("#checkAll").on("click", function() {
							var temp = $(this).prop("checked");
							
							$(".isChecked").prop("checked", temp);
						})

						//全选反选操作优化
						$(".isChecked").on("click", function() {

							var temp = true;
							$(".isChecked").each(function() {
								temp = temp && $(this).prop("checked");
								$("#checkAll").prop("checked", temp);
							})

						});
						
						//发送批量审核
						$("#shenHeAll").on("click", function() {
							//将选中的书id放入集合中
							var list = [];
							
							$(".isChecked").each(function(){
							     if($(this).prop("checked")){
							     list.push($(this).prop("value"))
							     }
							});
							
							//发送审核ajax
							sendShenHeList(list);
							showLetter(1);
							
						})	
						
						//发送批量删除
						$("#delAll").on("click", function() {
							//将选中的书id放入集合中
							var list = [];
							
							$(".isChecked").each(function(){
							     if($(this).prop("checked")){
							     list.push($(this).prop("value"))
							     }
							});
							
							//发送删除ajax
							sendDelList(list);
							showLetter(1);
						})
						
			
			//模态框绑定
			function modelinit(id){
				var modelMsg="";
				modelMsg="<div class='am-modal-dialog'><div class='am-modal-hd'>包租婆信息<a href='javascript: void(0)' class='am-close am-close-spin' data-am-modal-close>&times;</a></div><div class='am-modal-bd'><div class='am-form-group'><label for='user-number' class='am-u-sm-3 am-form-label'>用户名</label><div class='am-u-sm-9'><input type='text' disabled value='"+result.list[id].userName+"' id='user-number' class='am-form-field'></div></div><div class='am-form-group'><label for='user-relname' class='am-u-sm-3 am-form-label'>真实姓名</label><div class='am-u-sm-9'><input type='text' disabled value='"+result.list[id].realName+"' id='user-relname'></div></div><div class='am-form-group'><label for='user-addr' class='am-u-sm-3 am-form-label'>家庭地址</label><div class='am-u-sm-9'><input type='text' disabled value='"+result.list[id].address+"' id='user-addr'></div></div><div class='am-form-group'><label for='user-indentity' class='am-u-sm-3 am-form-label'>身份证</label><div class='am-u-sm-9'><input type='text' disabled value='"+result.list[id].indentNumber+"' id='user-indentity'></div></div><div class='am-form-group'><label for='user-phone' class='am-u-sm-3 am-form-label'>电话号码</label><div class='am-u-sm-9'><input type='tel' disabled value='"+phone+"' id='user-phone'></div></div><div class='am-form-group'><label for='user-profess' class='am-u-sm-3 am-form-label'>职业</label> <div class='am-u-sm-9'><input type='tel' disabled value='"+profession+"' id='user-profess'> </div></div><div class='am-form-group'><label for='user-email' class='am-u-sm-3 am-form-label'>邮箱</label><div class='am-u-sm-9'><input type='text' disabled value='"+result.list[id].email+"' id='user-email' placeholder=''></div></div></div></div>";
				$("#doc-modal-1").html(modelMsg)
			}
				
      		
      		//加载page
      		
      		$("#pageUl").html("");
      		var pageMsg="<li><a href='#' id='currentdel'>«</a></li>";
      		for (var j = 0; j < result.totalPage; j++) {
                if(currentPage==(j+1)){
                    pageMsg+="<li class='am-active'><a href='#' class='pageBtn'>"+(j+1)+"</a></li>";
                }else{
                    pageMsg+="<li><a href='#' class='pageBtn'>"+(j+1)+"</a></li>";
                }
			}
			pageMsg+="<li><a href='#' id='currentadd'>»</a></li>"
			$("#pageUl").append(pageMsg);
      		
      		$(".pageBtn").on("click",function(){
      		
      		currentPage=$(this).text();
      		
      		showLetter(currentPage);
      		})
      		//为上一页绑定事件
      		$("#currentdel").on("click",function(){
      		if(currentPage>1){
      		currentPage=currentPage-1;
      		showLetter(currentPage);
      		}
      		})
      		//为下一页绑定事件
      		$("#currentadd").on("click",function(){
      		if(currentPage<result.totalPage){
      		currentPage=currentPage+1;
      		showLetter(currentPage);
      		}
      		})
      		
       }
       })
       
       }

	//模糊搜索绑定事件
	$("#stateSelect").on("change",function(){
		
		var letterName=$("#letterName").val();
		showLetter(1);
	})
	
	$("#letterName").on("blur",function(){
    	
    	showLetter(1);
    
    
   
   
    })
    
    
    function getPageByUrl(page, data) {
        $("#contentPage").load(page, data, function () {

        })
    }
  
  //查看
      			$(document).on("click",".checkbtnyg",function(){
      			var id=$(this).prop("value");
      			modelinit(id);
      			$("#doc-modal-1").modal();
      			});
    		
    		//审核list
    		function sendShenHeList(list){
    			if(list.length>0){
					$.ajax({
							url:"${pageContext.request.contextPath}/LetterOfManager/shenHeLetters.do",
							type:"post",
							async:false,
							data:$.toJSON(list),
							contentType:"application/json",
							success: function(result){
							alert("111");
								location.href="${pageContext.request.contextPath}/backstage/main.jsp";
								
								}
							})
							}
    			
    		}
    		
    		//删除list
    		function sendDelList(list){
    				if(list.length>0){
							
						$.ajax({
							url:"${pageContext.request.contextPath}/LetterOfManager/delLetters.do",
							type:"post",
							data:$.toJSON(list),
							contentType:"application/json",
							success: function(result){
								
								getPageByUrl("baozupoguanli/manageLetter.jsp");
								}
							})
						}
    		}
    
    	//单个审核
    		function shenheone(id){
    				$.ajax({
      				url:"${pageContext.request.contextPath}/LetterOfManager/shenHeLetter.do",
      				type:"get",
      				data:{"letterId":id},
      				success: function(){
      						
      						
      						
      					}
      				})
    			
    		}
    
    })
</script>
</body>
</html>
