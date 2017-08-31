<%--
  Created by IntelliJ IDEA.
  User: Dave
  Date: 2017/8/20
  Time: 22:55
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
    CBD 包租婆管理
</div>
<ol class="am-breadcrumb">
    <li><a href="#" class="am-icon-home">包租婆管理</a></li>
    <li><a href="#">车位审核</a></li>
    <li class="am-active">车位</li>
</ol>
<div class="tpl-portlet-components">
    <div class="portlet-title">
        <div class="caption font-green bold">
            <span class="am-icon-code"></span> 列表
        </div>
    </div>

    <div class="am-g">
        <div class="tpl-table-images">
            <div id="carPortTable">

                <div class="am-u-sm-12 am-u-md-6 am-u-lg-4">

                </div>
                <div class="am-u-sm-12 am-u-md-6 am-u-lg-4">
                </div>
                <div class="am-u-sm-12 am-u-md-6 am-u-lg-4">


                </div>
            </div>
            <div class="am-u-lg-12">
                <div class="am-cf">

                    <div class="am-fr">
                        <ul class="am-pagination tpl-pagination" id="pageUl">

                        </ul>
                    </div>
                </div>
                <hr>
            </div>

        </div>

    </div>
</div>
<!--模态框-->
<div class="am-modal am-modal-no-btn" tabindex="-1" id="doc-modal-1" id="informodal">
    <div class="am-modal-dialog">
        <div class="am-modal-hd">车位信息
            <a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close>&times;</a>
        </div>
        <div class="am-modal-bd">
            <div class="am-form-group">
                <label for="user-number" class="am-u-sm-3 am-form-label">主人姓名</label>
                <div class="am-u-sm-9">
                    <input type="text" disabled value="李美丽" id="user-number" class="am-form-field">
                </div>
            </div>

            <div class="am-form-group">
                <label for="user-relname" class="am-u-sm-3 am-form-label">车位地址</label>
                <div class="am-u-sm-9">
                    <input type="text" disabled value="四川成都郫县中心大道二段一号" id="user-relname">
                </div>
            </div>
            <div class="am-form-group">
                <label for="user-indentity" class="am-u-sm-3 am-form-label">车位编号</label>
                <div class="am-u-sm-9">
                    <input type="text" disabled value="A123" id="user-indentity">
                </div>
            </div>
            <div class="am-form-group">
                <label for="user-phone" class="am-u-sm-3 am-form-label">产权证编号</label>
                <div class="am-u-sm-9">
                    <input type="tel" disabled value="AKDK-DDDF-SERE-DFDFD-SEFS-SFSD" id="user-phone">
                </div>
            </div>

            <div class="am-form-group">
                <label for="user-profess" class="am-u-sm-3 am-form-label">联系电话</label>
                <div class="am-u-sm-9">
                    <input type="tel" disabled value="18780026190" id="user-profess">
                </div>
            </div>

        </div>
    </div>
</div>
<script type="text/javascript">
    $(function () {

        //加载第一页
        var currentPage = 1;
        showCarPort(currentPage);

        function showCarPort(currentPage) {
            $.ajax({
                url: "${pageContext.request.contextPath}/LetterOfManager/showCarPorts.do",
                type: "post",
                data: {"currentPage": currentPage},
                success: function (result) {

                    var msg = "";
                    $("#carPortTable").html("");


                    for (var i = 0; i < result.list.length; i++) {
                        msg += "<div class='am-u-sm-12 am-u-md-6 am-u-lg-4'><div class='tpl-table-images-content'><div class='tpl-table-images-content-i-time'>发布时间：" + result.list[i].startTime + "</div><div class='tpl-i-title'>地址：" + result.list[i].location + "</div><a href='javascript:;' class='tpl-table-images-content-i'><span class='tpl-table-images-content-i-shadow'></span><img width='100' height='147' src='../" + result.list[i].propImage + "' alt=''></a><div class='tpl-table-images-content-block'><div class='tpl-i-font'>电话：" + result.list[i].letter.phone + "</div><div class='tpl-i-more'><ul><li><span class='am-icon-user am-text-secondary'>Dave</span></li></ul></div><div class='am-btn-toolbar'><div class='am-btn-group am-btn-group-xs tpl-edit-content-btn'><button type='button' class='am-btn am-btn-default am-btn-success checkBtn' value=" + i + "><span class='am-icon-plus'></span > 详情</button><button type='button' class='am-btn am-btn-default am-btn-warning shenhebtn' value='" + i + "' ><span class='am-icon-archive' >审核</span> </button></div></div> </div></div></div>"
                    }
                    $("#carPortTable").append(msg);

                    //为审核按钮绑定事件
                    $(".shenhebtn").on("click", function () {
                        var id = $(this).prop("value");

                        //处理审核要求

                        $.ajax({
                            url: "${pageContext.request.contextPath}/LetterOfManager/shenHeCarPort.do",
                            type: "post",
                            data: {"carPortId": result.list[id].portId},
                            success: function (data) {

                                showCarPort(1);
                            }
                        });
                    });


                    //绑定详情的模态框
                    var $model = $("#doc-modal-1");
                    $(".checkBtn").on("click", function (e) {
                        var modelMsg = "";
                        var id = $(this).prop("value");


                        modelMsg = "<div class='am-modal-dialog'><div class='am-modal-hd'>车位信息<a href='javascript: void(0)' class='am-close am-close-spin' data-am-modal-close>&times;</a></div><div class='am-modal-bd'><form class='am-form am-form-horizontal'><div class='am-form-group'><label for='user-number' class='am-u-sm-3 am-form-label'>主人姓名</label><div class='am-u-sm-9'><input type='text' disabled value='" + result.list[id].letter.userName + "' id='user-number' class='am-form-field'></div> </div><div class='am-form-group'><label for='user-relname' class='am-u-sm-3 am-form-label'>车位地址</label><div class='am-u-sm-9'><input type='text' disabled value='" + result.list[id].location + "' id='user-relname'></div></div><div class='am-form-group'><label for='user-indentity' class='am-u-sm-3 am-form-label'>车位编号</label><div class='am-u-sm-9'><input type='text' disabled value='" + result.list[id].portNumber + "' id='user-indentity'></div></div> <div class='am-form-group'><label for='user-phone' class='am-u-sm-3 am-form-label'>产权证编号</label><div class='am-u-sm-9'> <input type='tel' disabled value='" + result.list[id].propNumber + "' id='user-phone'></div></div><div class='am-form-group'><label for='user-profess' class='am-u-sm-3 am-form-label'>联系电话</label><div class='am-u-sm-9'><input type='tel' disabled value='" + result.list[id].letter.phone + "' id='user-profess'></div></div></form></div></div>"
                        $("#doc-modal-1").html("");
                        $("#doc-modal-1").append(modelMsg);
                        $model.modal();
                    });


                    //加载page
                    $("#pageUl").html("");
                    var pageMsg = "<li><a href='#' id='currentdel'>«</a></li>";
                    for (var j = 0; j < result.totalPage; j++) {
                        if (currentPage == (j + 1)) {
                            pageMsg += "<li class='am-active'><a href='#' class='pageBtn'>" + (j + 1) + "</a></li>";
                        } else {
                            pageMsg += "<li><a href='#' class='pageBtn'>" + (j + 1) + "</a></li>";
                        }
                    }
                    pageMsg += "<li><a href='#' id='currentadd'>»</a></li>"
                    $("#pageUl").append(pageMsg);

                    $(".pageBtn").on("click", function () {

                        currentPage = $(this).text();

                        showCarPort(currentPage);
                    })
                    //为上一页绑定事件
                    $("#currentdel").on("click", function () {
                        if (currentPage > 1) {
                            currentPage = currentPage - 1;
                            showCarPort(currentPage);
                        }
                    })
                    //为下一页绑定事件
                    $("#currentadd").on("click", function () {
                        if (currentPage < result.totalPage) {
                            currentPage = currentPage + 1;
                            showCarPort(currentPage);
                        }
                    })
                }


            })
        }

    });
</script>

</body>
</html>
