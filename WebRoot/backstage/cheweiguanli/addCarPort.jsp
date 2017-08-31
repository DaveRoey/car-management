<%--
  Created by IntelliJ IDEA.
  User: Dave
  Date: 2017/8/20
  Time: 23:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<!--面包导航-->
<div class="tpl-content-page-title">
    CBD 车位管理
</div>
<ol class="am-breadcrumb">
    <li><a href="#" class="am-icon-home">车位管理</a></li>
    <li><a href="#">添加车位</a></li>
    <li class="am-active">添加</li>
</ol>


<div class="tpl-portlet-components">
    <div class="portlet-title">
        <div class="caption font-green bold">
            <span class="am-icon-code"></span> 添加车位
        </div>

    </div>

    <div class="tpl-block ">
        <div class="am-tabs" data-am-tabs>
            <ul class="am-tabs-nav am-nav am-nav-tabs">
                <li class="am-active"><a href="#tab1">单个添加</a></li>
                <li><a href="#tab2">批量添加</a></li>
            </ul>

            <div class="am-tabs-bd">
                <div class="am-tab-panel am-fade am-in am-active" id="tab1">
                    <div class="am-u-md-4 am-u-md-offset-4">
                        <form class="am-form am-form-horizontal" id="carportForm">
                            <div class="am-form-group am-form-icon">
                                <i class="am-icon-product-hunt"></i>
                                <input type="text" class="am-form-field" placeholder="地址" name="portAdress" id="address">
                            </div>

                            <div class="am-form-group am-form-icon">
                                <i class="am-icon-newspaper-o"></i>
                                <input type="text" class="am-form-field" placeholder="车位编号" name="portNumber" id="portNum">
                            </div>
                            <small class="am-text-danger"></small>

                            <div class="am-form-group">
                                <button type="button" class="am-btn am-btn-success" id="submited">
                                    <i class="am-icon-plus"></i>
                                                                                                                                                     添加
                                </button>
                            </div>


                        </form>

                    </div>

                </div>

                <!--批量添加-->
                <div class="am-tab-panel am-fade" id="tab2">
                    <div class="am-u-md-4 am-u-md-offset-4">

                            <div class="am-form-group am-form-icon">
                                <i class="am-icon-product-hunt"></i>
                                <input type="text" class="am-form-field" placeholder="地址" id="location">
                            </div>
                            <table id="dataTable" class="am-table am-table-striped am-table-hover table-main">
                                <thead>
                                <tr>
                                    <th class="table-title">ID</th>
                                    <th class="table-type">车位编号</th>
                                    <th class="table-author am-hide-sm-only">车位数量</th>
                                    <th class="table-date am-hide-sm-only">操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>1</td>
                                    <td class="am-hide-sm-only">
                                        <input class="am-form-field am-input-sm" type="text" id="number1">


                                    </td>
                                    <td class="am-hide-sm-only">
                                        <input class="am-form-field am-input-sm" type="text" id="num1">

                                    </td>
                                    <td>
                                        <div class="am-btn-toolbar">
                                            <div class="am-btn-group am-btn-group-xs">
                                                <button class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only removeBtn">
                                                    <span class="am-icon-trash-o"></span> 删除
                                                </button>
                                            </div>
                                        </div>
                                    </td>
                                </tr>

                                </tbody>
                            </table>
                            <div class="am-btn-group am-btn-group-xs">
                                <button type="button"
                                        class="am-btn am-btn-default am-btn-success addBtn"><span
                                        class="am-icon-plus"></span> 新增车位
                                </button>

                                <button type="button" class="am-btn am-btn-default am-btn-warning"><span
                                        class="am-icon-save" id="saveAll"> 保存所有</span>
                                </button>
                                <input type="hidden" id="theHider" value="1">
                            </div>


                    </div>

                </div>
            </div>
        </div>

        <div class="am-g tpl-amazeui-form">
            <div class="am-u-sm-12 am-u-md-9">

            </div>
        </div>
    </div>
</div>
<script src="../js/yzj/jquery.json-2.4.js"></script>
<script type="text/javascript">

$(function(){
var counts =1;
   $("#submited").on("click", function (){
   
	$.ajax({	
	       async:false,
	       type: "post",
	       url:"${pageContext.request.contextPath}/cheweiguanli/checkExistPorts.do",
	       data:{address:$("#address").val(),portNum:$("#portNum").val()},
	       success: function(data){	   
	    	 if(data=="exist")
	    	  {
	    		alert("已经有了")
	    	  }
	    	 else if(data=="DNE"){
	   
	    		 getPageByUrl("${pageContext.request.contextPath}/cheweiguanli/add.do", $("#carportForm").serializeArray());
         
	    		 
	    	 }
	       }  
	     
	    })
})
        $(".addBtn").on("click", function () {
            addRow();
        });

        /*删除行*/
        $(document).on('click', '.removeBtn', function () {
            var number = $(this).parents("tbody").children("tr").length;
            /*只有一个不能删*/
            if (number === 1) {
                return;
            }
            //将后面所有的减1
            var elem = $(this).parents("tr").nextAll();
            elem.each(function () {
                var count = $(this).find("td:eq(0)").text();
                $(this).find("td:eq(0)").text(--count);
            });
            $(this).parents("tr").remove();
     
        });
});

    /*添加一行*/
    function addRow() {
        var count = $("#dataTable").find("tbody").find("tr:last").find("td:eq(0)").text();
        count++;
        counts=count;
        $("#theHider").val(count)
        var tr = "<tr>\n    <td>" + count + "</td>\n    <td class=\"am-hide-sm-only\">\n        <input class=\"am-form-field am-input-sm\" type=\"text\" id=number"+count+">\n\n\n    </td>\n    <td class=\"am-hide-sm-only\">\n        <input class=\"am-form-field am-input-sm\" type=\"text\" id=num"+count+">\n\n    </td>\n    <td>\n        <div class=\"am-btn-toolbar\">\n            <div class=\"am-btn-group am-btn-group-xs\">\n                <button class=\"am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only removeBtn\">\n                    <span class=\"am-icon-trash-o\"></span> 删除\n                </button>\n            </div>\n        </div>\n    </td>\n</tr>";
        $("#dataTable").find("tbody").append(tr);
        
    }
</script>
<script type="text/javascript" src="../js/yzj/addAsGroup.js"></script>
</body>
</html>
