<%--
  Created by IntelliJ IDEA.
  User: Dave
  Date: 2017/8/20
  Time: 22:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>企业管理</title>
</head>
<body>

<!--面包导航-->
<div class="tpl-content-page-title">
    CBD 企业管理
</div>
<ol class="am-breadcrumb">
    <li><a href="#" class="am-icon-home">企业管理</a></li>
    <li><a href="#">企业管理</a></li>
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
            <div class="am-u-sm-6 am-u-md-2">
                <div class="am-btn-toolbar">
                    <div class="am-btn-group am-btn-group-xs">
                        <button type="button" onclick="getPageByUrl('qiyeguanli/addEtp.jsp')"
                                class="am-btn am-btn-default am-btn-success"><span
                                class="am-icon-plus"></span> 新增
                        </button>
                    </div>
                </div>
            </div>

            <div class="tpl-portlet-input tpl-fz-ml">
                <div class="portlet-input input-small input-inline">
                    <div class="input-icon">
                        <i class="am-icon-search"></i>
                        <input type="text" id="etpName" class="form-control form-control-solid" placeholder="企业名称..."></div>
                </div>
            </div>
            <div class="tpl-portlet-input tpl-fz-ml">
                <div class="portlet-input input-small input-inline">
                    <div class="input-icon">
                        <i class="am-icon-search"></i>
                        <input type="text" id="location" class="form-control form-control-solid" placeholder="楼层位置..."></div>
                </div>
            </div>
            <div class="tpl-portlet-input tpl-fz-ml">
                <div class="portlet-input input-small input-inline">
                    <div class="input-icon">
                        <i class="am-icon-search"></i>
                        <input type="text" id="contact" class="form-control form-control-solid" placeholder="联系人..."></div>
                </div>
            </div>
            <div class="tpl-portlet-input tpl-fz-ml">
                <div class="portlet-input input-small input-inline">
                    <div class="input-icon">
                        <i class="am-icon-search"></i>
                        <input type="text" id="phone" class="form-control form-control-solid" placeholder="联系电话..."></div>
                </div>
            </div>
        </div>
        <div class="am-g">
            <div class="am-u-sm-12">
                    <table class="am-table am-table-bd">
                        <thead>
                        <tr>
                            <th class="table-title">企业名称</th>
                            <th class="table-title">企业位置</th>
                            <th class="table-type">联系人</th>
                            <th class="table-set">联系电话</th>
                            <th class="table-set">操作</th>
                        </tr>
                        </thead>
                        <tbody id="findAllLike">
<!--                         <tr>
                            <td>朗沃科技有限公司</td>
                            <td><a href="#">成都一环路南一段</a></td>
                            <td>王尼玛</td>
                            <td>18787002728</td>
                            <td>
                                <div class="am-btn-toolbar">
                                    <div class="am-btn-group am-btn-group-xs">
                                        <button class="am-btn am-btn-default am-btn-xs am-text-secondary editBtn"><span
                                                class="am-icon-pencil-square-o"></span> 编辑
                                        </button>
                                        <button class="am-btn am-btn-default am-text-success checkBtn"><span
                                                class="am-icon-eye"></span> 查看
                                        </button>
                                        <button class="am-btn a
                                        m-btn-default am-btn-xs am-text-danger am-hide-sm-only delEtpBtn">
                                            <span class="am-icon-trash-o"></span> 删除
                                        </button>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>朗沃科技有限公司</td>
                            <td><a href="#">成都一环路南一段</a></td>
                            <td>王尼玛</td>
                            <td>18787002728</td>
                            <td>
                                <div class="am-btn-toolbar">
                                    <div class="am-btn-group am-btn-group-xs">
                                        <button class="am-btn am-btn-default am-btn-xs am-text-secondary editBtn"><span
                                                class="am-icon-pencil-square-o"></span> 编辑
                                        </button>
                                        <button class="am-btn am-btn-default am-text-success checkBtn"><span
                                                class="am-icon-eye"></span> 查看
                                        </button>
                                        <button class="am-btn a
                                        m-btn-default am-btn-xs am-text-danger am-hide-sm-only delEtpBtn">
                                            <span class="am-icon-trash-o"></span> 删除
                                        </button>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>朗沃科技有限公司</td>
                            <td><a href="#">成都一环路南一段</a></td>
                            <td>王尼玛</td>
                            <td>18787002728</td>
                            <td>
                                <div class="am-btn-toolbar">
                                    <div class="am-btn-group am-btn-group-xs">
                                        <button class="am-btn am-btn-default am-btn-xs am-text-secondary editBtn"><span
                                                class="am-icon-pencil-square-o"></span> 编辑
                                        </button>
                                        <button class="am-btn am-btn-default am-text-success checkBtn"><span
                                                class="am-icon-eye"></span> 查看
                                        </button>
                                        <button class="am-btn a
                                        m-btn-default am-btn-xs am-text-danger am-hide-sm-only delEtpBtn">
                                            <span class="am-icon-trash-o"></span> 删除
                                        </button>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>朗沃科技有限公司</td>
                            <td><a href="#">成都一环路南一段</a></td>
                            <td>王尼玛</td>
                            <td>18787002728</td>
                            <td>
                                <div class="am-btn-toolbar">
                                    <div class="am-btn-group am-btn-group-xs">
                                        <button class="am-btn am-btn-default am-btn-xs am-text-secondary editBtn"><span
                                                class="am-icon-pencil-square-o"></span> 编辑
                                        </button>
                                        <button class="am-btn am-btn-default am-text-success checkBtn"><span
                                                class="am-icon-eye"></span> 查看
                                        </button>
                                        <button class="am-btn a
                                        m-btn-default am-btn-xs am-text-danger am-hide-sm-only delEtpBtn">
                                            <span class="am-icon-trash-o"></span> 删除
                                        </button>
                                    </div>
                                </div>
                            </td>
                        </tr> -->
                        </tbody>
                    </table>
                    <div class="am-cf">
                        <div class="am-fr">
                            <ul class="am-pagination am-pagination-right tpl-pagination" id="pageUl">
                               <!--  <li class="am-disabled"><a href="#">«</a></li>
							    <li class="am-active"><a href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>
                                <li><a href="#">»</a></li> -->
                            </ul>
                        </div>
                    </div>
                    <hr>
            </div>
            
            <!-- 模态框 -->
            <div class="am-modal am-modal-no-btn" tabindex="-1" id="doc-modal-1">
            <div class="am-modal-dialog">
                <div class="am-modal-hd">企业信息
                    <a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close>&times;</a>
                </div>
                <div class="am-modal-bd">
                    <form class="am-form am-form-horizontal">
                        <div class="am-form-group">
                            <label for="user-number" class="am-u-sm-3 am-form-label">企业用户名</label>
                            <div class="am-u-sm-9">
                                <input type="text" disabled  id="etp-userName" class="am-form-field">
                            </div>
                        </div>

                        <div class="am-form-group">
                            <label for="user-relname" class="am-u-sm-3 am-form-label">企业名称</label>
                            <div class="am-u-sm-9">
                                <input type="text" disabled  id="etp-relName">
                            </div>
                        </div>

                        <div class="am-form-group">
                            <label for="user-addr" class="am-u-sm-3 am-form-label">企业地址</label>
                            <div class="am-u-sm-9">
                                <input type="text" disabled  id="etp-addr">
                            </div>
                        </div>
                        <div class="am-form-group">
                            <label for="user-indentity" class="am-u-sm-3 am-form-label">联系人</label>
                            <div class="am-u-sm-9">
                                <input type="text" disabled  id="etp-indentity">
                            </div>
                        </div>

                        <div class="am-form-group">
                            <label for="user-phone" class="am-u-sm-3 am-form-label">联系电话</label>
                            <div class="am-u-sm-9">
                                <input type="tel" disabled  id="etp-cphone">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        </div>
    </div>
    <div class="tpl-alert"></div>
    <div class="am-modal am-modal-confirm" tabindex="-1" id="my-confirm">
        <div class="am-modal-dialog">
            <div class="am-modal-hd">提示</div>
            <div class="am-modal-bd">
                你，确定要删除这条记录吗？
            </div>
            <div class="am-modal-footer">
                <span class="am-modal-btn" data-am-modal-cancel>取消</span>
                <span class="am-modal-btn" data-am-modal-confirm>确定</span>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
var currentPage = 1;

    $(function () {
        
        
        $(".checkBtn").on("click", function () {
            getPageByUrl("checkMannager.html");
        });

        $(".editBtn").on("click", function () {
            getPageByUrl("editManager.html");
        }); 
        

    	var etpName=$("#etpName").val();
    	var location=$("#location").val();
    	var contact=$("#contact").val();
    	var phone=$("#phone").val();
        sendAjax(etpName,location,contact,phone,currentPage);
        
    });
    
    $("#etpName").on("input property",function(){
    	var etpName=$("#etpName").val();
    	var location=$("#location").val();
    	var contact=$("#contact").val();
    	var phone=$("#phone").val();
    	sendAjax(etpName,location,contact,phone,currentPage);
    	
    });
    
    $("#location").on("input property",function(){
    	var etpName=$("#etpName").val();
    	var location=$("#location").val();
    	var contact=$("#contact").val();
    	var phone=$("#phone").val();
    	sendAjax(etpName,location,contact,phone,currentPage);
    	
    });
    
    $("#contact").on("input property",function(){
    	var etpName=$("#etpName").val();
    	var location=$("#location").val();
    	var contact=$("#contact").val();
    	var phone=$("#phone").val();
    	sendAjax(etpName,location,contact,phone,currentPage);
    	
    });
    
    $("#phone").on("input property",function(){
    	var etpName=$("#etpName").val();
    	var location=$("#location").val();
    	var contact=$("#contact").val();
    	var phone=$("#phone").val();
    	sendAjax(etpName,location,contact,phone,currentPage);
    	
    });
    
    function sendAjax(etpName,location,contact,phone,currentPage) {
		$.ajax({
			type : "POST",
			url : "../qiyeguanli/findLikeEnterprise.do",
			data : {
				currentPage : currentPage,
				etpName : etpName,
				location : location,
				contact : contact,
				phone : phone
			},
			success : function(result) {
				creatTable(result);
				creatPage(result);
			}
	});
    
    }
    function creatTable(result) {
		var findAllLike=$("#findAllLike");
		var msg="";
		for (var i = 0; i < result.list.length; i++) {
			msg+="<tr>"+
			"<td><input type='hidden' class='hidInput' value='"+result.list[i].etpId+"'>"+result.list[i].etpName+"</td>"+
			"<td><a href='#'>"+result.list[i].location+"</a></td>"+
			"<td>"+result.list[i].contact+"</td>"+
			"<td>"+result.list[i].phone+"</td>"+
			"<td>"+
			"<div class='am-btn-toolbar'>"+
			"<div class='am-btn-group am-btn-group-xs'>"+
			"<button class='am-btn am-btn-default am-text-success checkBtn'><span class='am-icon-eye'></span> 查看"+
			"</button>"+
			"<button class='am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only delEtpBtn' id='delEtpBtn'>"+
			"<span class='am-icon-trash-o'></span> 删除"+
			"</button>"+
			"</div>"+
			"</div>"+
			"</td>"+
			"</tr>";
		}
		//删除弹框
	       $(document).on("click",".delEtpBtn", function () {
	    	   var etpId=$(this).parent().parent().parent().parent().children().children().val();
	            $('#my-confirm').modal({
	                relatedTarget: this,
	                onConfirm: function (options) {
	                    var $link = $(this.relatedTarget).prev('a');
	                    	$.ajax({
	        				type : "post",
	        				url : "../qiyeguanli/deletEnterprise.do",
	        				data : {
	        					etpId:etpId
	        				},
	        				success : function(result) {
	        					if(result=="1"){
	        						alert("删除成功")
	        						/* location.href=$("#dataForm").serializeArray(); */
	        						getPageByUrl("qiyeguanli/manageEtp.jsp");
	        					}
	        					if(result=="2"){
	        						alert("删除失败，请重试")
	        					}
	        				}
	        		});

	                },
	                // closeOnConfirm: false,
	                onCancel: function () {

	                }
	            });
	        });
		findAllLike.html(msg);
	}
    
    function creatPage(result) {
		$("#pageUl").html("");
		$("#pageUl").append("<li class='am-disabled' id='pre'><a>«</a></li>");
		for (var i = 0; i < result.pageBar.length; i++) {
			if(result.currentPage ==result.pageBar[i]){
				var ul = $("<li class='am-active'><a class='name'>"+result.pageBar[i]+"</a></li>");

			}else{
				var ul = $("<li><a class='name'>"+result.pageBar[i]+"</a></li>");

			}
			$("#pageUl").append(ul);
		}
		$("#pageUl").append("<li class='am-disabled' id='later'><a>»</a></li>");
		$(".name").on("click", function() {
			var pageNum = $(this).text();
			currentPage = pageNum;//显示的当前页
	    	var etpName=$("#etpName").val();
	    	var location=$("#location").val();
	    	var contact=$("#contact").val();
	    	var phone=$("#phone").val();
			/* $(this).prop('style','background-color:red'); */
			sendAjax(etpName,location,contact,phone,currentPage);
			 
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
				currentPage = result.previousPage;
		    	var etpName=$("#etpName").val();
		    	var location=$("#location").val();
		    	var contact=$("#contact").val();
		    	var phone=$("#phone").val();
				sendAjax(etpName,location,contact,phone,currentPage);
			} else {
				$("#pre").attr("disabled", "disabled");
			}
		});

		if (currentPage != result.totalPage) {
			$("#later").removeAttr("disabled");
		} else {
			$("#later").attr("disabled", "disabled");
		}
		//后一页
		$("#later").click(function() {
			if (currentPage != result.totalPage) {
				$("#later").removeAttr("disabled");
				currentPage = result.nextPage;
				var etpName=$("#etpName").val();
		    	var location=$("#location").val();
		    	var contact=$("#contact").val();
		    	var phone=$("#phone").val();
				sendAjax(etpName,location,contact,phone,currentPage);
			} else {
				$("#later").attr("disabled", "disabled");
			}
		});
	}
    
    $(function () {
        var $model = $("#doc-modal-1");
        $(document).on("click",".checkBtn", function () {
        	var etpId=$(this).parent().parent().parent().parent().children().children().val();
        	$.ajax({
				type : "post",
				url : "../qiyeguanli/findEnterpriseById.do",
				data : {
					etpId:etpId
				},
				success : function(result) {
					$("#etp-userName").val(""+result.userName+"");
					$("#etp-relName").val(""+result.etpName+"");
					$("#etp-addr").val(""+result.location+"");
					$("#etp-indentity").val(""+result.contact+"");
					$("#etp-cphone").val(""+result.phone+"");
				}
		});
            $model.modal();
        });

    });
</script>

</body>
</html>
