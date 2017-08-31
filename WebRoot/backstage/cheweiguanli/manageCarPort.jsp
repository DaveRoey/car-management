<%--
  Created by IntelliJ IDEA.
  User: Dave
  Date: 2017/8/20
  Time: 23:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<div class="tpl-content-page-title">
    CBD 车位管理
</div>
<ol class="am-breadcrumb">
    <li><a href="#" class="am-icon-home">车位管理</a></li>
    <li><a href="#">车位管理</a></li>
    <li class="am-active">车位</li>
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
                        <button type="button" onclick="getPageByUrl('cheweiguanli/addCarPort.jsp')"
                                class="am-btn am-btn-default am-btn-success"><span
                                class="am-icon-plus"></span> 新增
                        </button>
                    </div>
                </div>
            </div>
            <div class="am-u-sm-12 am-u-md-3">
                <div class="am-form-group">
                    <select data-am-selected="{btnSize: 'sm'} " id='selectState'>
                        <option value="0">未出租</option>
                        <option value="1">已出租</option>
                    </select>
                </div>
            </div>
            <div class="tpl-portlet-input tpl-fz-ml">
                <div class="portlet-input input-small input-inline">
                    <div class="input-icon right">
                        <i class="am-icon-search" id="littleIcon"></i>
                        <input type="text" id='address' class="form-control form-control-solid" placeholder="地址搜索...">
                    </div>
                </div>

            </div>
        </div>
        <div class="am-g">
            <div class="am-u-sm-12">
                <form class="am-form">
                    <table id="dataTable" class="am-table am-table-striped am-table-hover table-main">
                        <thead>
                        <tr>
                            <th class="table-id">ID</th>
                            <th class="table-title">车位地址</th>
                            <th class="table-type">编号</th>
                            <th class="table-author am-hide-sm-only">状态</th>
                        </tr>
                        </thead>
                        <tbody id='tBody'>
                        <tr>
                            <td>1</td>
                            <td><a href="#">秋名山五菱大会一区</a></td>
                            <td class="am-hide-sm-only">A123</td>
                            <td>
                                <div class="am-btn-toolbar">
                                    <div class="am-btn-group am-btn-group-xs">
                                        <button class="am-btn am-btn-default am-btn-xs am-text-success"><span
                                                class="am-icon-pencil-square-o"></span> 正常
                                        </button>

                                    </div>
                                </div>
                            </td>
                        </tr>

                        </tbody>
                    </table>
                    <div class="am-cf">
                        <div class="am-fr">
                            <ul id="pageBar" class="am-pagination am-pagination-right tpl-pagination">
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

                </form>
            </div>


        </div>
    </div>
    <div class="tpl-alert"></div>
</div>
<script type="text/javascript">
    $(function () {
        getCars(1);
        $("#selectState").on("change", function () {
            getCars(1);
        });

        $("#address").on("input property", function () {
            getCars(1);
        });

    });
    /*获取数据*/
    function getCars(currentPage) {
        $.post("${pageContext.request.contextPath}/cheweiguanli/getList.do", {
            "currentPage": currentPage,
            "state": $("#selectState").val(),
            "address": $("#address").val()
        }, function (result) {

            var data = result.list;
            var tr = "";
            for (var i = 0; i < data.length; i++) {
                var state = "";
                if (data[i].portState == 0) {
                    state = "未出租";
                } else {
                    state = "已出租";
                }

                tr += "<tr>\n    <td>" + data[i].portId + "</td>\n    <td><a href=\"#\">" + data[i].portAdress + "</a></td>\n    <td class=\"am-hide-sm-only\">" + data[i].portNumber + "</td>\n    <td>\n " + state + "\n    </td>\n\n</tr>"
            }
            $("#dataTable").find("tbody").html(tr);
            createBar(result);
        });
    }

    /*创建分页按钮*/
    function createBar(result) {
        var $page = $("#pageBar");
        $page.html("");
        var pre;
        if (result.currentPage == 1) {
            pre = "<li class='am-disabled'><a href='#' onclick='getCars(" + result.previousPage + ")'>«</a></li>";
        } else {
            pre = "<li><a href='#' onclick='getCars(" + result.previousPage + ")'>«</a></li>";

        }
        /*上一页*/
        $page.append(pre);

        /*中间*/
        var bar = result.pageBar;
        for (var i = 0; i < bar.length; i++) {
            var li = "";
            if (result.currentPage == bar[i]) {
                li = "<li class='am-active'><a href='#' onclick='getCars(" + bar[i] + ")'>" + bar[i] + "</a></li>";
            } else {
                li = "<li><a href='#' onclick='getCars(" + bar[i] + ")'>" + bar[i] + "</a></li>";
            }
            $page.append(li);
        }
        /*下一页*/
        var next;
        if (result.totalPage === result.currentPage) {
            next = " <li class='am-disabled'><a href='#' onclick='getCars(" + result.nextPage + ")'>»</a></li>";

        } else {
            next = " <li><a href='#' onclick='getCars(" + result.nextPage + ")'>»</a></li>";
        }

        $page.append(next);
    }
</script>
</body>
</html>
