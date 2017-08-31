<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%--
  Created by IntelliJ IDEA.
  User: Dave
  Date: 2017/8/20
  Time: 22:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>查看管理员</title>
    <meta name="description" content="这是一个 index 页面">
    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <link rel="icon" type="image/png" href="../../images/backimg/i/favicon.png">
</head>
<body>
<!--面包导航-->
<div class="tpl-content-page-title">
    CBD 权限管理
</div>
<ol class="am-breadcrumb">
    <li><a href="#" class="am-icon-home">权限管理</a></li>
    <li><a href="#">信息查看</a></li>
    <li class="am-active">内容</li>
</ol>

<div class="tpl-portlet-components">
    <div class="portlet-title">
        <div class="caption font-green bold">
            <span class="am-icon-code"></span> 用户信息
        </div>
    </div>

    <div class="tpl-block">
        <div class="am-g">
            <div class="tpl-form-body tpl-form-line">
                <div class="am-u-sm-8 am-u-sm-offset-2 am-u-md-6 am-u-md-offset-3">
                    <form class="am-form">

                        <div class="am-form-group">
                            <label for="doc-ds-ipt-1">工号</label>
                            <input disabled type="text" id="doc-ds-ipt-1" value="${manager.empId}"
                                   class="am-form-field">
                        </div>

                        <div class="am-form-group">
                            <label for="doc-ds-ipt-2">姓名</label>
                            <input disabled type="text" value="${manager.userName}" id="doc-ds-ipt-2"
                                   class="am-form-field">
                        </div>
                        <div class="am-form-group">
                            <label for="doc-ds-ipt-3">电话</label>
                            <input disabled type="text" value="${manager.phone}" id="doc-ds-ipt-3"
                                   class="am-form-field">
                        </div>


                        <div class="am-form-group">
                            <label>用户权限</label><br>
                            <c:set var="role" value=" ${manager.role}"/>
                            <c:if test="${fn:contains(role, '1')}">
                                <label class="am-checkbox-inline">
                                    <input disabled checked type="checkbox" value="option1"> 用户管理
                                </label>
                            </c:if>

                            <c:if test="${fn:contains(role, '2')}">
                                <label class="am-checkbox-inline">
                                    <input disabled type="checkbox" value="option2"> 合同管理
                                </label>
                            </c:if>
                            <c:if test="${fn:contains(role, '3')}">

                                <label class="am-checkbox-inline">
                                    <input disabled checked type="checkbox" value="option3"> 投诉管理
                                </label>
                            </c:if>
                            <c:if test="${fn:contains(role, '4')}">
                                <label class="am-checkbox-inline">
                                    <input disabled checked type="checkbox" value="option4"> 车位管理
                                </label>
                            </c:if>

                        </div>
                        <a href="javascript:void(0)" id="btn" target="_parent" class="am-btn am-btn-primary am-active"
                           role="button">返回</a>
                    </form>

                </div>

            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(function () {
        $("#btn").on("click", function () {
            getPageByUrl("quanxianguanli/manageUser.jsp");
        });
    });

</script>
</body>
</html>
