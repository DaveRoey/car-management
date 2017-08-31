<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--
  Created by IntelliJ IDEA.
  User: Dave
  Date: 2017/8/20
  Time: 23:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
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
    <link rel="icon" type="image/png" href="../images/backimg/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="../images/backimg/i/app-icon72x72@2x.png">
    <meta name="apple-mobile-web-app-title" content="Amaze UI"/>
    <link rel="stylesheet" href="../css/backcss/comm/amazeui.min.css"/>
    <link rel="stylesheet" href="../css/backcss/comm/admin.css">
    <link rel="stylesheet" href="../css/backcss/comm/app.css">
    <script src="../js/backjs/comm/echarts.min.js"></script>
</head>

<body data-type="main">


<header class="am-topbar am-topbar-inverse admin-header">
    <!--logo-->
    <div class="am-topbar-brand">
        <a href="javascript:;" class="tpl-logo">
            <img src="../images/backimg/logo.png" alt="">
        </a>
    </div>
    <!--隐藏导航栏-->
    <div class="am-icon-list tpl-header-nav-hover-ico am-fl am-margin-right">

    </div>
    <button class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only"
            data-am-collapse="{target: '#topbar-collapse'}"><span class="am-sr-only">导航切换</span> <span
            class="am-icon-bars"></span></button>

    <!--顶部菜单-->
    <div class="am-collapse am-topbar-collapse" id="topbar-collapse">

        <ul class="am-nav am-nav-pills am-topbar-nav am-topbar-right admin-header-list tpl-header-list">


            <li class="am-hide-sm-only"><a href="javascript:void(0)" id="admin-fullscreen" class="tpl-header-list-link"><span
                    class="am-icon-arrows-alt"></span> <span class="admin-fullText">开启全屏</span></a></li>

            <li class="am-dropdown" data-am-dropdown data-am-dropdown-toggle>
                <a class="am-dropdown-toggle tpl-header-list-link" href="javascript:;">
                    <span class="tpl-header-list-user-nick">${sessionScope.manage.userName}</span>
                    <input type="hidden" id="userName" value="${sessionScope.manage.userName}"/>
                    <span class="tpl-header-list-user-ico"> <img
                        src="../images/backimg/user07.png"></span>
                </a>
                <ul class="am-dropdown-content">
                    <li><a href="javascript:void(0)" onclick="getPageByUrl('xinxiguanli/checkInfo.jsp')"><span class="am-icon-bell-o"></span> 资料</a></li>
                    <li><a href="javascript:void(0)" onclick="getPageByUrl('xinxiguanli/modifyInfo.jsp')"><span class="am-icon-cog"></span> 修改密码</a></li>
                    <li id="tuichu"><a><span class="am-icon-power-off"></span> 退出</a></li>
                </ul>
            </li>

        </ul>
    </div>
</header>


<div class="tpl-page-container tpl-page-header-fixed">

    <!--左侧导航条-->
    <div class="tpl-left-nav tpl-left-nav-hover">
        <div class="tpl-left-nav-title">
            管理 列表
        </div>
        <div class="tpl-left-nav-list">
            <ul class="tpl-left-nav-menu">
                <li class="tpl-left-nav-item">
                    <a href="#" onclick="getPageByUrl('home.html')" class="nav-link active">
                        <!--图标-->
                        <i class="am-icon-home"></i>
                        <span>首页</span>
                    </a>

                </li>
                <li class="tpl-left-nav-item">
                    <a href="#" class="nav-link tpl-left-nav-link-list">
                        <i class="am-icon-bar-chart"></i>
                        <span>信息管理</span>
                        <i class="am-icon-angle-right tpl-left-nav-more-ico am-fr am-margin-right"></i>
                    </a>
                    <!--子菜单-->
                    <ul class="tpl-left-nav-sub-menu">
                        <li>
                            <a href="javascript:void(0)" onclick="getPageByUrl('xinxiguanli/checkInfo.jsp')">
                                <i class="am-icon-angle-right"></i>
                                <span>查看信息</span>
                                <i class="am-icon-add tpl-left-nav-content-ico am-fr am-margin-right"></i>
                            </a>

                            <a href="javascript:void(0)" onclick="getPageByUrl('xinxiguanli/modifyInfo.jsp')">
                                <i class="am-icon-angle-right"></i>
                                <span>修改信息</span>
                                <i class="am-icon-edit tpl-left-nav-content-ico am-fr am-margin-right"></i>
                            </a>
                        </li>
                    </ul>
                </li>

                <%--管理员模块--%>
                <c:if test="${manage.flag==1}">
                    <li class="tpl-left-nav-item">
                        <a href="javascript:void(0)" class="nav-link tpl-left-nav-link-list">
                            <i class="am-icon-table"></i>
                            <span>权限管理</span>
                            <i class="am-icon-angle-right tpl-left-nav-more-ico am-fr am-margin-right"></i>
                        </a>
                        <!--子菜单-->
                        <ul class="tpl-left-nav-sub-menu">
                            <li>
                                <a href="javascript:void(0)" onclick="getPageByUrl('quanxianguanli/addManager.jsp')">
                                    <i class="am-icon-angle-right"></i>
                                    <span>添加用户</span>
                                    <i class="am-icon-add tpl-left-nav-content-ico am-fr am-margin-right"></i>
                                </a>
                                <a href="javascript:void(0)" onclick="getPageByUrl('quanxianguanli/manageUser.jsp')">
                                    <i class="am-icon-angle-right"></i>
                                    <span>用户管理</span>
                                    <i class="tpl-left-nav-content tpl-badge-success">
                                        18
                                    </i>
                                </a>
                            </li>
                        </ul>
                    </li>
                </c:if>


                <c:set value="${manage.role}" var="role"/>
                <%--用户管理--%>
                <c:if test="${fn:contains(role,'1' )}">
                    <li class="tpl-left-nav-item">
                        <a href="javascript:void(0)" onclick="getPageByUrl('qiyeguanli/manageEtp.jsp')"
                           class="nav-link">
                            <i class="am-icon-wpforms"></i>
                            <span>企业管理</span>
                        </a>
                    </li>

                    <li class="tpl-left-nav-item">
                        <a href="javascript:void(0)" class="nav-link tpl-left-nav-link-list">
                            <!--图标-->
                            <i class="am-icon-female" aria-hidden="true"></i>
                            <span>包租婆管理</span>
                            <i class="am-icon-angle-right tpl-left-nav-more-ico am-fr am-margin-right"></i>

                        </a>
                        <!--子菜单-->
                        <ul class="tpl-left-nav-sub-menu">
                            <li>
                                <a href="javascript:void(0)" onclick="getPageByUrl('baozupoguanli/manageLetter.jsp')">
                                    <i class="am-icon-angle-right"></i>
                                    <span>包租婆审核</span>
                                    <i class="am-icon-add tpl-left-nav-content-ico am-fr am-margin-right"></i>
                                </a>
                                <a href="javascript:void(0)" onclick="getPageByUrl('baozupoguanli/carCensor.jsp')">
                                    <i class="am-icon-angle-right"></i>
                                    <span>车位审核</span>
                                    <i class="tpl-left-nav-content tpl-badge-success">
                                        18
                                    </i>
                                </a>
                            </li>
                        </ul>

                    </li>
                </c:if>

                <%--合约管理--%>
                <c:if test="${fn:contains(role, '2')}">
                    <li class="tpl-left-nav-item">
                        <a href="javascript:void(0)" onclick="getPageByUrl('waibuheyue/manageOutTreaty.jsp')"
                           class="nav-link">
                            <!--图标-->
                            <i class="am-icon-book"></i>
                            <span>外部合约管理</span>
                        </a>
                    </li>

                    <li class="tpl-left-nav-item">
                        <a href="javascript:void(0)" onclick="getPageByUrl('zuhuheyue/manageRentTreaty.jsp')"
                           class="nav-link">
                            <!--图标-->
                            <i class="am-icon-book"></i>
                            <span>租户合约管理</span>
                        </a>


                    </li>
                </c:if>

                <%--投诉管理--%>
                <c:if test="${fn:contains(role, '3')}">
                    <li class="tpl-left-nav-item">
                        <a href="javascript:void(0)" class="nav-link tpl-left-nav-link-list">
                            <!--图标-->
                            <i class="am-icon-leanpub"></i>
                            <span>投诉管理</span>
                            <i class="am-icon-angle-right tpl-left-nav-more-ico am-fr am-margin-right"></i>
                        </a>
                        <!--子菜单-->
                        <ul class="tpl-left-nav-sub-menu">
                            <li>
                                <a href="javascript:void(0)" onclick="getPageByUrl('tousuguanli/rentercomplain.jsp')">
                                    <i class="am-icon-angle-right"></i>
                                    <span>抢租客投诉</span>
                                    <i class="am-icon-add tpl-left-nav-content-ico am-fr am-margin-right"></i>
                                </a>
                                <a href="javascript:void(0)" onclick="getPageByUrl('tousuguanli/lettercomplain.jsp')">
                                    <i class="am-icon-angle-right"></i>
                                    <span>包租婆投诉</span>
                                    <i class="tpl-left-nav-content tpl-badge-success">
                                        18
                                    </i>
                                </a>
                            </li>
                        </ul>
                    </li>

                </c:if>

                <%--车位管理--%>
                <c:if test="${fn:contains(role,'4')}">
                    <li class="tpl-left-nav-item">
                        <a href="javascript:void(0)" onclick="getPageByUrl('cheweiguanli/manageCarPort.jsp')"
                           class="nav-link">
                            <!--图标-->
                            <i class="am-icon-car"></i>
                            <span>车位管理</span>
                        </a>
                    </li>
                </c:if>


            </ul>
        </div>
    </div>

    <!--加载页面的容器-->
    <div class="tpl-content-wrapper" id="contentPage">

    </div>

</div>
<script src="../js/jquery/jquery-2.0.3.js"></script>
<script src="../js/backjs/comm/amazeui.min.js"></script>
<script src="../js/backjs/comm/app.js"></script>
<script src="../js/backjs/comm/iscroll.js"></script>
<script type="text/javascript">
    $(function () {
        getPageByUrl("home.html");

        /*切换导航*/
        $(".tpl-left-nav-item").on("click", function () {
            changeNav();
            $(this).find("a").first().addClass("active");
        });
        
        $("#tuichu").on("click",function(){
        	location.href="../xinxiguanli/clearsession.do";
    	 });

    });
    /*页面加载*/
    function getPageByUrl(page, data) {
        $("#contentPage").load(page, data, function () {

        })
    }

    //切换导航
    function changeNav() {
        $(".nav-link").each(function () {

            if ($(this).hasClass("active")) {
                $(this).removeClass("active");
            }
        });

    }
</script>
</body>
</html>
