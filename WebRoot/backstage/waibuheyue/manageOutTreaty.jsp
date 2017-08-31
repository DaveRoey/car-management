<%--
  Created by IntelliJ IDEA.
  User: Dave
  Date: 2017/8/20
  Time: 22:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>外部合约</title>
</head>
<body>
<div class="tpl-content-page-title">
   CBD 外部合约
</div>
<ol class="am-breadcrumb">
    <li><a href="#" class="am-icon-home">外部合约</a></li>
    <li><a href="#">合约管理</a></li>
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
                        <button type="button" onclick="getPageByUrl('waibuheyue/addOutTreaty.jsp')"
                                class="am-btn am-btn-default am-btn-success"><span
                                class="am-icon-plus"></span> 新增
                        </button>
                    </div>
                </div>
            </div>
            <div class="am-u-sm-12 am-u-md-3">
                <div class="am-form-group">
                    <select id="stateSlect" data-am-selected="{btnSize: 'sm'}">
                        <option value="0">正常</option>
                        <option value="1">已续约</option>
                        <option value="2">已解约</option>
                    </select>
                </div>
            </div>
            <div class="am-u-sm-12 am-u-md-3">
                <div class="am-input-group am-input-group-sm">
                    <input type="text" id="searchCompany" class="am-form-field" placeholder="公司名称">
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
                        <th class="table-title">合同编号</th>
                        <th class="table-type">合同单位</th>
                        <th class="table-author am-hide-sm-only">联系人</th>
                        <th class="table-date am-hide-sm-only">联系电话</th>
                        <th class="table-date am-hide-sm-only">车位数量</th>
                        <th class="table-set">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>1</td>
                        <td>AKDK-34KD-3K34K-DFDD</td>
                        <td><a href="#">蜗牛创想有限公司</a></td>
                        <td>赵丽颖</td>
                        <td class="am-hide-sm-only">13832828382</td>
                        <td class="am-hide-sm-only">500</td>
                        <td>
                            <div class="am-btn-toolbar">
                                <div class="am-btn-group am-btn-group-xs">
                                    <button class="am-btn am-btn-default am-btn-xs am-text-secondary checkTreatyBtn"><span
                                            class="am-icon-eye"></span> 查看
                                    </button>
                                    <button class="am-btn am-btn-default am-btn-xs am-hide-sm-only editTreatyBtn"><span
                                            class="am-icon-copy"></span> 续约
                                    </button>
                                    <button class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only delTreatyBtn">
                                        <span class="am-icon-trash-o"></span> 解约
                                    </button>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>AKDK-34KD-3K34K-DFDD</td>
                        <td><a href="#">蜗牛创想有限公司</a></td>
                        <td>赵丽颖</td>
                        <td class="am-hide-sm-only">13832828382</td>
                        <td class="am-hide-sm-only">500</td>
                        <td>
                            <div class="am-btn-toolbar">
                                <div class="am-btn-group am-btn-group-xs">
                                    <button class="am-btn am-btn-default am-btn-xs am-text-secondary checkTreatyBtn"><span
                                            class="am-icon-eye"></span> 查看
                                    </button>
                                    <button class="am-btn am-btn-default am-btn-xs am-hide-sm-only editTreatyBtn"><span
                                            class="am-icon-copy"></span> 续约
                                    </button>
                                    <button class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only delTreatyBtn">
                                        <span class="am-icon-trash-o"></span> 解约
                                    </button>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>AKDK-34KD-3K34K-DFDD</td>
                        <td><a href="#">蜗牛创想有限公司</a></td>
                        <td>赵丽颖</td>
                        <td class="am-hide-sm-only">13832828382</td>
                        <td class="am-hide-sm-only">500</td>
                        <td>
                            <div class="am-btn-toolbar">
                                <div class="am-btn-group am-btn-group-xs">
                                    <button class="am-btn am-btn-default am-btn-xs am-text-secondary checkTreatyBtn"><span
                                            class="am-icon-eye"></span> 查看
                                    </button>
                                    <button class="am-btn am-btn-default am-btn-xs am-hide-sm-only editTreatyBtn"><span
                                            class="am-icon-copy"></span> 续约
                                    </button>
                                    <button class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only delTreatyBtn">
                                        <span class="am-icon-trash-o"></span> 解约
                                    </button>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>AKDK-34KD-3K34K-DFDD</td>
                        <td><a href="#">蜗牛创想有限公司</a></td>
                        <td>赵丽颖</td>
                        <td class="am-hide-sm-only">13832828382</td>
                        <td class="am-hide-sm-only">500</td>
                        <td>
                            <div class="am-btn-toolbar">
                                <div class="am-btn-group am-btn-group-xs">
                                    <button class="am-btn am-btn-default am-btn-xs am-text-secondary checkTreatyBtn"><span
                                            class="am-icon-eye"></span> 查看
                                    </button>
                                    <button class="am-btn am-btn-default am-btn-xs am-hide-sm-only editTreatyBtn"><span
                                            class="am-icon-copy"></span> 续约
                                    </button>
                                    <button class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only delTreatyBtn">
                                        <span class="am-icon-trash-o"></span> 解约
                                    </button>
                                </div>
                            </div>
                        </td>
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
                <hr>
            </div>
        </div>
        <div class="am-modal am-modal-confirm" tabindex="-1" id="my-confirm">
            <div class="am-modal-dialog">
                <div class="am-modal-hd">提示</div>
                <div class="am-modal-bd">
                    你，确定解除与<span id="company"></span>的合约吗？
                </div>
                <div class="am-modal-footer">
                    <span class="am-modal-btn" data-am-modal-cancel>取消</span>
                    <span class="am-modal-btn" data-am-modal-confirm>确定</span>
                </div>
            </div>
        </div>
    </div>
    <div class="tpl-alert"></div>
</div>
<script type="text/javascript">
    $(function () {
        var currentPage = 1;
        getOutTreaty(currentPage);

        /*触发模糊查询*/
        $("#searchCompany").on("input property", function () {
            getOutTreaty(1);
        });

        /*下拉框*/
        $("#stateSlect").on("change", function () {
            getOutTreaty(1);
        });
    });

    /*获取数据*/
    function getOutTreaty(currentPage) {
        $.post("${pageContext.request.contextPath}/waibuheyue/getList.do", {
            "currentPage": currentPage,
            "treatyState": $("#stateSlect").val(),
            "companyName": $("#searchCompany").val()
        }, function (result) {

            var data = result.list;
            var tr = "";
            for (var i = 0; i < data.length; i++) {
                var option="";
                if(data[i].treatyState=0){
                    option="<button class=\"am-btn am-btn-default am-btn-xs am-text-secondary checkTreatyBtn\"><span\n        class=\"am-icon-eye\"></span> 查看\n</button>\n<button class=\"am-btn am-btn-default am-btn-xs am-hide-sm-only editTreatyBtn\"><span\n        class=\"am-icon-copy\"></span> 续约\n</button>\n<button class=\"am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only delTreatyBtn\">\n    <span class=\"am-icon-trash-o\"></span> 解约\n</button>";
                }else if(data[i].treatyState=1){
                    option="<button class=\"am-btn am-btn-default am-btn-xs am-text-secondary checkTreatyBtn\"><span\n        class=\"am-icon-eye\"></span> 查看\n</button>\n<button class=\"am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only delTreatyBtn\">\n    <span class=\"am-icon-trash-o\"></span> 解约\n</button>";
                }else if(data[i].treatyState=2){
                    option="<button class=\"am-btn am-btn-default am-btn-xs am-text-secondary checkTreatyBtn\"><span\n        class=\"am-icon-eye\"></span> 查看\n</button>\n";
                }
                tr += "<tr>\n    <td>" + data[i].treatyId + "</td>\n    <td>" + data[i].treatyNumber + "</td>\n    <td><a href=\"#\">" + data[i].company + "</a></td>\n    <td>" + data[i].contact + "</td>\n    <td class=\"am-hide-sm-only\">" + data[i].phone + "</td>\n    <td class=\"am-hide-sm-only\">" + data[i].count + "</td>\n    <td>\n        <div class=\"am-btn-toolbar\">\n            <div class=\"am-btn-group am-btn-group-xs\">\n"+option+"\n            </div>\n        </div>\n    </td>\n</tr>";
            }
            $("#dataTable").find("tbody").html(tr);
            createBar(result);
            /*查看合同*/
            $(".checkTreatyBtn").on("click", "", function () {
                var $treatyId = $(this).parents("tr").find("td:eq(0)").text();
                getPageByUrl('${pageContext.request.contextPath}/waibuheyue/getTreaty.do', {
                    "method": "check",
                    "treatyId": $treatyId
                });
            });


            //解约弹框
            $(".delTreatyBtn").on("click", function () {

                /*获取公司名称*/
                var text = $(this).parents("tr").find("td:eq(2)").children("a").text();
                $("#company").text(text);
                $('#my-confirm').modal({
                    relatedTarget: this,
                    onConfirm: function (options) {
                        var $link = $(this.relatedTarget).prev('a');
                        var msg = $link.length ? '你要删除的链接 ID 为 ' + $link.data('id') :
                            '确定了，但不知道要整哪样';

                    },
                    // closeOnConfirm: false,
                    onCancel: function () {

                    }
                });
            });

            /*合同续约*/
            $(".editTreatyBtn").on("click", function () {
                var $treatyId = $(this).parents("tr").find("td:eq(0)").text();
                getPageByUrl('${pageContext.request.contextPath}/waibuheyue/getTreaty.do', {
                    "method": "reNew",
                    "treatyId": $treatyId
                });
            });

        });
    }

    /*创建分页按钮*/
    function createBar(result) {
        var $page = $("#pageBar");
        $page.html("");
        var pre;
        if (result.currentPage == 1) {
            pre = "<li class='am-disabled'><a href='#' onclick='getOutTreaty(" + result.previousPage + ")'>«</a></li>";
        } else {
            pre = "<li><a href='#' onclick='getOutTreaty(" + result.previousPage + ")'>«</a></li>";

        }
        /*上一页*/
        $page.append(pre);

        /*中间*/
        var bar = result.pageBar;
        for (var i = 0; i < bar.length; i++) {
            var li = "";
            if (result.currentPage == bar[i]) {
                li = "<li class='am-active'><a href='#' onclick='getOutTreaty(" + bar[i] + ")'>" + bar[i] + "</a></li>";
            } else {
                li = "<li><a href='#' onclick='getOutTreaty(" + bar[i] + ")'>" + bar[i] + "</a></li>";
            }
            $page.append(li);
        }
        /*下一页*/
        var next;
        if (result.totalPage === result.currentPage) {
            next = " <li class='am-disabled'><a href='#' onclick='getOutTreaty(" + result.nextPage + ")'>»</a></li>";

        } else {
            next = " <li><a href='#' onclick='getOutTreaty(" + result.nextPage + ")'>»</a></li>";
        }

        $page.append(next);
    }


</script>

</body>
</html>
