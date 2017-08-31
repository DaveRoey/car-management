<%--
  Created by IntelliJ IDEA.
  User: Dave
  Date: 2017/8/20
  Time: 23:03
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
<div class="tpl-content-page-title">
    CBD 投诉管理
</div>
<ol class="am-breadcrumb">
    <li><a href="#" class="am-icon-home">投诉管理</a></li>
    <li><a href="#">包租婆投诉</a></li>
    <li class="am-active">投诉</li>
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

                    </div>
                </div>
                <div class="am-u-sm-12 am-u-md-3">
                    <div class="am-form-group">
                        <select data-am-selected="{btnSize: 'sm'}" id="stateSelect" onchange="stateChoose()">
                            <option value="所有状态" checked="checked">所有状态</option>
                            <option value="已受理">已受理</option>
                            <option value="不受理">不受理</option>
                            <option value="暂缓">暂缓</option>
                            <option value="无效">无效</option>
                        </select>
                    </div>
                </div>

            </div>
        </div>
        <div class="am-g">
            <div class="am-u-sm-12">
                <form class="am-form">
                    <table class="am-table am-table-striped am-table-hover table-main" id="letterTable">
                        <thead>
                        <tr>
                            <th class="table-id">ID</th>
                            <th class="table-title">投诉理由</th>
                            <th class="table-author am-hide-sm-only">投诉订单号</th>
                            <th class="table-date am-hide-sm-only">投诉日期</th>
                            <th class="table-date am-hide-sm-only">状态</th>
                            <th class="table-set">操作</th>
                        </tr>
                        </thead>
                        <tbody id="letterTBody">

                        </tbody>
                    </table>
                    <div class="am-cf">
                        <div class="am-fr" id="letterPageBtn">

                        </div>
                    </div>
                    <hr>

                </form>
            </div>

        </div>
    </div>
    <div class="tpl-alert"></div>
</div>
<script type="text/javascript" src="../js/yyq/letterComplain.js"></script>
</body>
</html>
