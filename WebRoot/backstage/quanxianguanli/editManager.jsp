<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Dave
  Date: 2017/8/20
  Time: 22:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
</head>

<body data-type="index">


<!--面包导航-->
<div class="tpl-content-page-title">
    CBD 权限管理
</div>
<ol class="am-breadcrumb">
    <li><a href="#" class="am-icon-home">权限管理</a></li>
    <li><a href="#">修改权限</a></li>
    <li class="am-active">内容</li>
</ol>

<div class="tpl-portlet-components">
    <div class="portlet-title">
        <div class="caption font-green bold">
            <span class="am-icon-code"></span> 修改权限
        </div>
    </div>

    <div class="tpl-block">
        <div class="am-g">
            <div class="tpl-form-body tpl-form-line">
                <div class="am-u-sm-8 am-u-sm-offset-2 am-u-md-8 am-u-md-offset-2">
                    <form id="dataForm" class="am-form tpl-form-line-form">
                        <div class="am-form-group">
                            <label for="user-id" class="am-u-sm-3 am-form-label">工号 <span
                                    class="tpl-form-line-small-title">ID</span></label>
                            <div class="am-u-sm-9">

                                <input type="text" name="empId" class="am-form-field tpl-form-no-bg"
                                       value="${manager.empId}"
                                       id="user-id" disabled>

                            </div>
                        </div>

                        <div class="am-form-group">
                            <label for="user-name" class="am-u-sm-3 am-form-label">姓名 <span
                                    class="tpl-form-line-small-title">Name</span></label>
                            <div class="am-u-sm-9">
                                <input type="text" id="user-name" class="am-form-field tpl-form-no-bg"
                                       value="${manager.userName}"
                                       disabled/>
                            </div>
                        </div>

                        <div class="am-form-group">
                            <label for="user-phone" class="am-u-sm-3 am-form-label">电话 <span
                                    class="tpl-form-line-small-title">Phone</span></label>
                            <div class="am-u-sm-9">
                                <input type="text" id="user-phone" class="am-form-field tpl-form-no-bg"
                                       value="${manager.phone}"
                                       disabled/>
                            </div>
                        </div>

                        <div class="am-form-group">
                            <label for="user-phone" class="am-u-sm-3 am-form-label">权限 <span
                                    class="tpl-form-line-small-title">Role</span></label>

                            <c:set var="role" value=" ${manager.role}"/>
                            <%-- 用户管理--%>
                            <c:if test="${fn:contains(role, '1')}">
                                <label class="am-checkbox-inline">
                                    <input checked type="checkbox" value="1"> 用户管理
                                </label>
                            </c:if>
                            <c:if test="${!fn:contains(role, '1')}">
                                <label class="am-checkbox-inline">
                                    <input type="checkbox" value="1"> 用户管理
                                </label>
                            </c:if>

                            <%--车位管理--%>
                            <c:if test="${fn:contains(role, '2')}">
                                <label class="am-checkbox-inline">
                                    <input checked type="checkbox" value="2"> 合同管理
                                </label>
                            </c:if>
                            <c:if test="${!fn:contains(role, '2')}">
                                <label class="am-checkbox-inline">
                                    <input type="checkbox" value="2"> 合同管理
                                </label>
                            </c:if>

                            <%--合同管理--%>
                            <c:if test="${fn:contains(role, '3')}">
                                <label class="am-checkbox-inline">
                                    <input checked type="checkbox" value="3"> 投诉管理
                                </label>
                            </c:if>
                            <c:if test="${!fn:contains(role, '3')}">
                                <label class="am-checkbox-inline">
                                    <input type="checkbox" value="3"> 投诉管理
                                </label>
                            </c:if>

                            <%--投诉管理--%>
                            <c:if test="${fn:contains(role, '4')}">
                                <label class="am-checkbox-inline">
                                    <input checked type="checkbox" value="4"> 车位管理
                                </label>
                            </c:if>
                            <c:if test="${!fn:contains(role, '4')}">
                                <label class="am-checkbox-inline">
                                    <input type="checkbox" value="4"> 车位管理
                                </label>
                            </c:if>
                            <input type="hidden" name="role" id="roleStr">
                        </div>

                        <div class="am-form-group">
                            <div class="am-u-sm-9 am-u-sm-push-3">
                                <button id="saveEditBtn" type="button" class="am-btn am-btn-primary">保存修改</button>
                            </div>
                        </div>
                    </form>

                </div>

            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(function () {
        $("#saveEditBtn").on("click", function () {
            /*权限字符串*/
            var roleStr = "";
            $(":checked").each(function () {

                roleStr += $(this).val() + ":";
            });
            $("#roleStr").val(roleStr.substr(0, roleStr.length - 1));

            $.post("${pageContext.request.contextPath}/quanxianguanli/modify.do",{"empId":$("#user-id").val(),"role":$("#roleStr").val()}, function (data) {
                if ("ok" == data) {
                    getPageByUrl("quanxianguanli/manageUser.jsp")
                } else {
                    alert("失败");
                }
            });

        });
    });
</script>
</body>
</html>
