<%--
  Created by IntelliJ IDEA.
  User: Dave
  Date: 2017/8/20
  Time: 22:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>个人信息管理</title>
    <meta name="description" content="这是一个 index 页面">
    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <link rel="icon" type="image/png"
          href="../../images/backimg/i/favicon.png">

</head>
<body>
<!--面包导航-->
<div class="tpl-content-page-title">CBD 信息管理</div>
<ol class="am-breadcrumb">
    <li><a href="#" class="am-icon-home">信息管理</a></li>
    <li><a href="#">查看信息</a></li>
    <li class="am-active">内容</li>
</ol>

<div class="tpl-portlet-components">
    <div class="portlet-title">
        <div class="caption font-green bold">
            <span class="am-icon-code"></span> 个人信息
        </div>


    </div>

    <div class="tpl-block">

        <div class="am-g">
            <div class="tpl-form-body tpl-form-line">
                <form class="am-form tpl-form-line-form">
                    <div class="am-form-group">
                        <label for="user-id" class="am-u-sm-3 am-form-label">工号 <span
                                class="tpl-form-line-small-title">ID</span></label>
                        <div class="am-u-sm-9">
                            <input type="text" class="am-form-field tpl-form-no-bg"
                                   id="user-id" disabled>

                        </div>
                    </div>

                    <div class="am-form-group">
                        <label for="user-name" class="am-u-sm-3 am-form-label">姓名
                            <span class="tpl-form-line-small-title">Name</span>
                        </label>
                        <div class="am-u-sm-9">
                            <input type="text" id="user-name"
                                   class="am-form-field tpl-form-no-bg" disabled/>
                        </div>
                    </div>

                    <div class="am-form-group">
                        <label for="user-phone" class="am-u-sm-3 am-form-label">电话
                            <span class="tpl-form-line-small-title">Phone</span>
                        </label>
                        <div class="am-u-sm-9">
                            <input type="text" id="user-phone"
                                   class="am-form-field tpl-form-no-bg"
                                   disabled/>
                        </div>
                    </div>


                </form>

            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(function () {
        checkInfo();
    });

    function checkInfo() {
        var empId =${sessionScope.manage.empId};
        $.ajax({
            type: "POST",
            url: "../xinxiguanli/checkInfo.do",
            data: {empId: empId},
            success: function (result) {
                $("#user-id").val(result.empId);
                $("#user-name").val(result.userName);
                $("#user-phone").val(result.phone);

            }
        });
    }
</script>
</body>
</html>
