<%--
  Created by IntelliJ IDEA.
  User: Dave
  Date: 2017/8/20
  Time: 22:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>用户管理</title>
    <meta name="description" content="这是一个 login 页面">
    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp"/>

</head>
<body>
<!--面包导航-->
<div class="tpl-content-page-title">
    CBD 权限管理
</div>
<ol class="am-breadcrumb">
    <li><a href="#" class="am-icon-home">权限管理</a></li>
    <li><a href="#">用户管理</a></li>
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
            <div class="am-u-sm-12 am-u-md-6">
                <div class="am-btn-toolbar">
                    <div class="am-btn-group am-btn-group-xs">
                        <button type="button" onclick="getPageByUrl('quanxianguanli/addManager.jsp')"
                                class="am-btn am-btn-default am-btn-success"><span
                                class="am-icon-plus"></span> 新增
                        </button>
                    </div>
                </div>
            </div>

            <div class="am-u-sm-12 am-u-md-3">
                <div class="am-input-group am-input-group-sm">
                    <input placeholder="输入名字.." type="text" id="searchUser" class="am-form-field">
                    <span class="am-input-group-btn">
            <button class="am-btn  am-btn-default am-btn-success tpl-am-btn-success am-icon-search"
                    type="button"></button>
          </span>
                </div>
            </div>
        </div>
        <div class="am-g">
            <div class="am-u-sm-12">

                <table id="dataTable" class="am-table am-table-striped am-table-hover table-main">
                    <thead>
                    <tr>
                        <th class="table-id">ID</th>
                        <th class="table-title">工号</th>
                        <th class="table-title">姓名</th>
                        <th class="table-type">电话</th>
                        <th class="table-set">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>1</td>
                        <td><a href="#">dave</a></td>
                        <td>19383838384</td>
                        <td>
                            <div class="am-btn-toolbar">
                                <div class="am-btn-group am-btn-group-xs">
                                    <button type="button"
                                            class="am-btn am-btn-default am-btn-xs am-text-secondary editManageBtn"><span
                                            class="am-icon-pencil-square-o"></span> 编辑
                                    </button>
                                    <button type="button"
                                            class="am-btn am-btn-default am-text-success checkManageBtn"><span
                                            class="am-icon-eye"></span> 查看
                                    </button>
                                    <button type="button"
                                            class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only delManageBtn">
                                        <span class="am-icon-trash-o"></span> 删除
                                    </button>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td><a href="#">Business management</a></td>
                        <td>default</td>
                        <td>
                            <div class="am-btn-toolbar">
                                <div class="am-btn-group am-btn-group-xs">
                                    <button class="am-btn am-btn-default am-btn-xs am-text-secondary editManageBtn"><span
                                            class="am-icon-pencil-square-o"></span> 编辑
                                    </button>
                                    <button class="am-btn am-btn-default am-text-success checkManageBtn"><span
                                            class="am-icon-eye"></span> 查看
                                    </button>
                                    <button class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only delManageBtn">
                                        <span class="am-icon-trash-o"></span> 删除
                                    </button>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>3</td>
                        <td><a href="#">Business management</a></td>
                        <td>default</td>
                        <td>
                            <div class="am-btn-toolbar">
                                <div class="am-btn-group am-btn-group-xs">
                                    <button class="am-btn am-btn-default am-btn-xs am-text-secondary editManageBtn"><span
                                            class="am-icon-pencil-square-o"></span> 编辑
                                    </button>
                                    <button class="am-btn am-btn-default am-text-success checkManageBtn"><span
                                            class="am-icon-eye"></span> 查看
                                    </button>
                                    <button class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only delManageBtn">
                                        <span class="am-icon-trash-o"></span> 删除
                                    </button>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>4</td>
                        <td><a href="#">Business management</a></td>
                        <td>default</td>
                        <td>
                            <div class="am-btn-toolbar">
                                <div class="am-btn-group am-btn-group-xs">
                                    <button class="am-btn am-btn-default am-btn-xs am-text-secondary editManageBtn"><span
                                            class="am-icon-pencil-square-o"></span> 编辑
                                    </button>
                                    <button class="am-btn am-btn-default am-text-success checkManageBtn"><span
                                            class="am-icon-eye"></span> 查看
                                    </button>
                                    <button class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only delManageBtn">
                                        <span class="am-icon-trash-o"></span> 删除
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


            </div>

        </div>
    </div>
    <div class="tpl-alert"></div>
    <div class="am-modal am-modal-confirm" tabindex="-1" id="my-confirm">
        <div class="am-modal-dialog">
            <div class="am-modal-hd">提示</div>
            <div class="am-modal-bd">
                你，确定要删除"<span id="manager">"</span>吗？
            </div>
            <div class="am-modal-footer">
                <span class="am-modal-btn" data-am-modal-cancel>取消</span>
                <span class="am-modal-btn" data-am-modal-confirm>确定</span>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(function () {
        getManages(1);
        /*触发模糊查询*/
        $("#searchUser").on("input property", function () {
            getManages(1);
        });
        //删除弹框
        $(document).off().on("click", ".delManageBtn", function () {
            /*获取公司名称*/
            var text = $(this).parents("tr").find("td:eq(2)").text();
            $("#manager").text(text);
            var $empId = $(this).parents("tr").find("td:eq(1)").text();
            $('#my-confirm').modal({
                relatedTarget: this,
                onConfirm: function (options) {
                    var $link = $(this.relatedTarget).prev('a');
                    $.post("${pageContext.request.contextPath}/quanxianguanli/remove.do", {"empId": $empId}, function (data) {
                        if ("ok" == data) {
                            getManages(1);
                        } else {
                            alert(data);
                        }
                    });
                },
                // closeOnConfirm: false,
                onCancel: function () {

                }
            });
        });
        /* 查看信息*/
        $(document).on("click", ".checkManageBtn", function () {
            var $empId = $(this).parents("tr").find("td:eq(1)").text();
            getPageByUrl("${pageContext.request.contextPath}/quanxianguanli/getManager.do", {
                "empId": $empId,
                "method": "check"
            });
        });

        /*修改权限*/
        $(document).on("click", ".editManageBtn", function () {
            var $empId = $(this).parents("tr").find("td:eq(1)").text();
            getPageByUrl("${pageContext.request.contextPath}/quanxianguanli/getManager.do", {
                "empId": $empId,
                "method": "edit"
            });
        });

    });

    /*获取数据*/
    function getManages(currentPage) {
        $.post("${pageContext.request.contextPath}/quanxianguanli/getList.do", {
            "currentPage": currentPage,
            "userName": $("#searchUser").val()
        }, function (result) {

            var data = result.list;
            var tr = "";
            for (var i = 0; i < data.length; i++) {
                tr += "<tr>\n    <td>" + data[i].managerId + "</td>\n    <td>" + data[i].empId + "</td>\n    <td><a href=\"#\">" + data[i].userName + "</a></td>\n    <td>" + data[i].phone + "</td>\n    <td>\n        <div class=\"am-btn-toolbar\">\n            <div class=\"am-btn-group am-btn-group-xs\">\n                <button type=\"button\"\n                        class=\"am-btn am-btn-default am-btn-xs am-text-secondary editManageBtn\"><span\n                        class=\"am-icon-pencil-square-o\"" + data[i].empId + "></span> 编辑\n                </button>\n                <button type=\"button\" class=\"am-btn am-btn-default am-text-success checkManageBtn\"><span\n                        class=\"am-icon-eye\"></span> 查看\n                </button>\n                <button type=\"button\"\n                        class=\"am-btn am-btn-default am-btn-xs am-text-danger delManageBtn\">\n                    <span class=\"am-icon-trash\"></span> 删除\n                </button>\n            </div>\n        </div>\n    </td>\n</tr>";
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
            pre = "<li class='am-disabled'><a href='#' onclick='getManages(" + result.previousPage + ")'>«</a></li>";
        } else {
            pre = "<li><a href='#' onclick='getManages(" + result.previousPage + ")'>«</a></li>";

        }
        /*上一页*/
        $page.append(pre);

        /*中间*/
        var bar = result.pageBar;
        for (var i = 0; i < bar.length; i++) {
            var li = "";
            if (result.currentPage == bar[i]) {
                li = "<li class='am-active'><a href='#' onclick='getManages(" + bar[i] + ")'>" + bar[i] + "</a></li>";
            } else {
                li = "<li><a href='#' onclick='getManages(" + bar[i] + ")'>" + bar[i] + "</a></li>";
            }
            $page.append(li);
        }
        /*下一页*/
        var next;
        if (result.totalPage === result.currentPage) {
            next = " <li class='am-disabled'><a href='#' onclick='getManages(" + result.nextPage + ")'>»</a></li>";

        } else {
            next = " <li><a href='#' onclick='getManages(" + result.nextPage + ")'>»</a></li>";
        }

        $page.append(next);
    }
</script>

</body>
</html>
