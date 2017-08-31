<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Dave
  Date: 2017/8/20
  Time: 22:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>合约详情</title>
</head>
<body>
<!--面包导航-->
<div class="tpl-content-page-title">
    CBD 外部合约
</div>
<ol class="am-breadcrumb">
    <li><a href="#" class="am-icon-home">外部合约</a></li>
    <li><a href="#">查看详情</a></li>
    <li class="am-active">内容</li>
</ol>

<div class="tpl-portlet-components">
    <div class="portlet-title">
        <div class="caption font-green bold">
            <span class="am-icon-code"></span> 合约详情
        </div>

    </div>

    <div class="tpl-block ">

        <div class="am-g tpl-amazeui-form">


            <div class="am-u-sm-12 am-u-md-9">
                <form class="am-form am-form-horizontal">
                    <div class="am-form-group">
                        <label for="treaty-number" class="am-u-sm-3 am-form-label">合同号 </label>
                        <div class="am-u-sm-9">
                            <input type="text" disabled id="treaty-number" value="${treaty.treatyNumber}">
                        </div>
                    </div>

                    <div class="am-form-group">
                        <label for="start-date" class="am-u-sm-3 am-form-label">合同开始日期 </label>
                        <div class="am-u-sm-9">
                            <input type="text" disabled value="${treaty.startDate}" id="start-date">
                        </div>
                    </div>

                    <div class="am-form-group">
                        <label for="end-time" class="am-u-sm-3 am-form-label">合同结束日期 </label>
                        <div class="am-u-sm-9">
                            <input type="text" value="${treaty.endDate}" disabled id="end-time">
                        </div>
                    </div>

                    <div class="am-form-group">
                        <label for="treaty-com" class="am-u-sm-3 am-form-label">合同单位 </label>
                        <div class="am-u-sm-9">
                            <input type="text" disabled value="${treaty.company}" id="treaty-com">
                        </div>
                    </div>
                    <div class="am-form-group">
                        <label for="contact" class="am-u-sm-3 am-form-label">联系人 </label>
                        <div class="am-u-sm-9">
                            <input type="text" disabled value="${treaty.contact}" id="contact">
                        </div>
                    </div>
                    <div class="am-form-group">
                        <label for="phone" class="am-u-sm-3 am-form-label">联系电话 </label>
                        <div class="am-u-sm-9">
                            <input type="text" disabled value="${treaty.phone}" id="phone">
                        </div>
                    </div>
                    <div class="am-form-group">
                        <label for="port-number" class="am-u-sm-3 am-form-label">车位数量 </label>
                        <div class="am-u-sm-9">
                            <input type="text" disabled value="${treaty.count}" id="port-number">
                        </div>
                    </div>


                    <div class="am-form-group">
                        <label class="am-u-sm-3 am-form-label">合同图片 </label>
                        <div class="am-u-sm-9">
                            <img width="300" src="${pageContext.request.contextPath}/${treaty.treatyImg}" alt=""/>
                        </div>
                    </div>
                    <div class="am-form-group">
                        <div class="am-u-sm-9 am-u-sm-push-3">
                            <button type="button" id="returnBtn" class="am-btn am-btn-primary">返回</button>
                            <c:if test="${treaty.treatyState==1}">
                                <button type="button" id="checkBtn" class="am-btn am-fr am-btn-warning">续约详情</button>

                            </c:if>
                        </div>

                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(function () {
        /*回到管理界面*/
        $("#returnBtn").on("click", function () {
            getPageByUrl("waibuheyue/manageOutTreaty.jsp");
        });

        $("#checkBtn").on("click", function () {
            getPageByUrl("${pageContext.request.contextPath}/waibuheyue/checkNew.do",{"treatyId":${treaty.treatyId}});
        });
    });
</script>

</body>
</html>
