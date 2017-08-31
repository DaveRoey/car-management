<%--
  Created by IntelliJ IDEA.
  User: Dave
  Date: 2017/8/20
  Time: 23:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>查看租约合同</title>
</head>
<body>
<div class="tpl-content-page-title">
    CBD 租户合约
</div>
<ol class="am-breadcrumb">
    <li><a href="#" class="am-icon-home">外部合同</a></li>
    <li><a href="#">租户合约</a></li>
    <li class="am-active">查看租约</li>
</ol>

<div class="tpl-portlet-components">
    <div class="portlet-title">
        <div class="caption font-green bold">
            <span class="am-icon-code"></span> 添加合同
        </div>
    </div>
</div>
<div class="am-u-sm-12">
    <form class="am-form">
        <table class="am-table am-table-striped am-table-hover table-main">
            <thead>
            <tr>
                <th class="table-title">合同编号</th>
                <th class="table-type">生效日期</th>
                <th class="table-author am-hide-sm-only">截止日期</th>
                <th class="table-date am-hide-sm-only">企业名称</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>
                    <input id="treaty-id" type="hidden" value="${treaty.treatyId}">
                    <div class="am-form-group am-form-icon">
                        <i class="am-icon-chain"></i>
                        <input type="text" value="${treaty.treatyNumber}" disabled class="am-form-field">
                    </div>
                </td>
                <td>
                    <div class="am-form-group am-form-icon">
                        <i class="am-icon-calendar"></i>
                        <input type="text" value="${treaty.startDate}" disabled class="am-form-field">
                    </div>
                </td>
                <td>
                    <div class="am-form-group am-form-icon">
                        <i class="am-icon-calendar"></i>
                        <input type="text" value="${treaty.endDate}" disabled class="am-form-field">
                    </div>
                </td>
                <td class="am-hide-sm-only">
                    <div class="am-form-group am-form-icon">
                        <i class="am-icon-gethub"></i>
                        <input type="text" value="${treaty.enterprise.etpName}" class="am-form-field" disabled>
                    </div>
                </td>
            </tr>


            </tbody>
        </table>
    </form>
</div>


<div class="tpl-portlet-components">
    <div class="portlet-title">
        <div class="caption font-green bold">
            <span class="am-icon-code"></span> 合同车位
        </div>
    </div>
</div>
<div class="am-g">
    <div class="am-u-sm-12">
        <form class="am-form">
            <table id="dataTable" class="am-table am-table-striped am-table-hover table-main">
                <thead>
                <tr>
                    <th class="table-title">车位编号</th>
                    <th class="table-type">车位地址</th>
                    <th class="table-author am-hide-sm-only">车位编号</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>1</td>
                    <td>沙湾路</td>
                    <td>A123</td>

                </tr>

                </tbody>
            </table>
            <div class="am-cf">

                <div class="am-fr">
                    <ul id="pageBar" class="am-pagination tpl-pagination">
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

        </form>
    </div>
</div>
<script src="../../js/backjs/comm/amazeui.min.js"></script>
<script src="../../js/backjs/comm/iscroll.js"></script>
<script type="text/javascript">
    $(function () {
        getRentCart(1);
    });

    /*获取数据*/
    function getRentCart(currentPage) {
        $.post("${pageContext.request.contextPath}/zuhuheyue/getRentCarts.do", {
            "currentPage": currentPage,
            "treatyId": $("#treaty-id").val()
        }, function (result) {

            var data = result.list;
            var tr = "";
            for (var i = 0; i < data.length; i++) {
                //language=HTML
                tr += "<tr>\n    <td>" + data[i].port.portId + "</td>\n    <td>" + data[i].port.portAdress + "</td>\n    <td>" + data[i].port.portNumber + "</td>\n\n</tr>";
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
            pre = "<li class='am-disabled'><a href='#' onclick='getRentCart(" + result.previousPage + ")'>«</a></li>";
        } else {
            pre = "<li><a href='#' onclick='getRentCart(" + result.previousPage + ")'>«</a></li>";

        }
        /*上一页*/
        $page.append(pre);

        /*中间*/
        var bar = result.pageBar;
        for (var i = 0; i < bar.length; i++) {
            var li = "";
            if (result.currentPage == bar[i]) {
                li = "<li class='am-active'><a href='#' onclick='getRentCart(" + bar[i] + ")'>" + bar[i] + "</a></li>";
            } else {
                li = "<li><a href='#' onclick='getRentCart(" + bar[i] + ")'>" + bar[i] + "</a></li>";
            }
            $page.append(li);
        }
        /*下一页*/
        var next;
        if (result.totalPage === result.currentPage) {
            next = " <li class='am-disabled'><a href='#' onclick='getRentCart(" + result.nextPage + ")'>»</a></li>";

        } else {
            next = " <li><a href='#' onclick='getRentCart(" + result.nextPage + ")'>»</a></li>";
        }

        $page.append(next);
    }

</script>

</body>
</html>
