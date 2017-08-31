<%--
  Created by IntelliJ IDEA.
  User: Dave
  Date: 2017/8/20
  Time: 23:00
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
    CBD 租户合约
</div>
<ol class="am-breadcrumb">
    <li><a href="#" class="am-icon-home">外部合同</a></li>
    <li><a href="#">合同管理</a></li>
    <li class="am-active">续约合同</li>
</ol>

<div class="tpl-portlet-components">
    <div class="portlet-title">
        <div class="caption font-green bold">
            <span class="am-icon-code"></span> 添加合同
        </div>
    </div>
</div>
<div class="am-u-sm-12">
    <form id="addTreatyForm" class="am-form">
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
                    <div class="am-form-group am-form-icon">
                        <i class="am-icon-chain"></i>
                        <input type="text" id="treaty-number" name="treatyNumber" class="am-form-field"
                               placeholder="合同编号">
                    </div>
                </td>
                <td>
                    <div class="am-form-group am-form-icon">
                        <i class="am-icon-calendar"></i>
                        <input type="date" id="start-date" name="startDate" value="startDate" data-am-datepicker=""
                               readonly class="am-form-field"
                               placeholder="生效日期">
                    </div>
                </td>
                <td>
                    <div class="am-form-group am-form-icon">
                        <i class="am-icon-calendar"></i>
                        <input type="date" id="end-date" name="endDate" value="endDate" data-am-datepicker="" readonly
                               class="am-form-field"
                               placeholder="到期日期">
                    </div>
                </td>
                <td class="am-hide-sm-only">
                    <select id="etps" name="enterprise.etpId" data-am-selected="{searchBox: 1,maxHeight: 100}">
                        <option value="蜗牛创想">蜗牛创想</option>
                        <option value="魅族科技">魅族科技</option>
                        <option value="小米科技">小米科技</option>
                        <option value="小米科技">小米科技</option>
                        <option value="小米科技">小米科技</option>
                    </select>
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
                    <th class="table-title">序号</th>
                    <th class="table-type">车位地址</th>
                    <th class="table-author am-hide-sm-only">车位编号</th>
                    <th class="table-date am-hide-sm-only">操作</th>
                </tr>
                </thead>
                <tbody>


                </tbody>
            </table>
            <div class="am-u-sm-12 am-u-md-6">
                <div class="am-btn-toolbar">
                    <div class="am-btn-group am-btn-group-xs">
                        <button type="button"
                                class="am-btn am-btn-default am-btn-success addBtn"><span
                                class="am-icon-plus"></span> 新增
                        </button>

                        <button id="saveTreatyBtn" type="button" class="am-btn am-btn-default am-btn-warning"><span
                                class="am-icon-plus"></span> 保存合同
                        </button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<script src="../../js/backjs/comm/amazeui.min.js"></script>
<script src="../../js/backjs/comm/iscroll.js"></script>
<script type="text/javascript">
    $(function () {
        getEtps();//绑定企业
        addRow();//第一行
        /*添加行*/
        $(".addBtn").on("click", function () {
            addRow();
        });

        /*删除行*/
        $(document).on('click', '.delBtn', function () {
            var number = $(this).parents("tbody").children("tr").length;
            /*只有一个不能删*/
            if (number === 1) {
                return;
            }
            //将后面所有的减1
            var elem = $(this).parents("tr").nextAll();
            elem.each(function () {
                var count = $(this).find("td:eq(0)").text();
                $(this).find("td:eq(0)").text(--count);
            });
            $(this).parents("tr").remove();
        });

        /*绑change事件 级联获取车位*/
        $(document).on("change", ".changeAddress", function () {
            var numSelect = $(this).parents("tr").find("select:eq(1)");
            var address = $(this).val();
            /*根据地址获取车位*/
            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/zuhuheyue/getCar.do",
                data: {"portAddress": address},
                async: false,
                success: function (data) {
                    var option = "";
                    for (var i = 0; i < data.length; i++) {
                        option += "<option value='" + data[i].portId + "'>" + data[i].portNumber + "<option>";
                    }
                    numSelect.html(option);
                }
            });


        });


        /*保存合同*/
        $("#saveTreatyBtn").on("click", function () {

            if (!checkTreatyNumber() && checkDate()) {
                return;
            }
            var carPorts = [];
            //获取所有的车位编号
            $(".changeNumber").each(function () {
                carPorts.push($(this).val());
            });
            //保存合同
            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/zuhuheyue/addTreaty.do",
                data: $("#addTreatyForm").serializeArray(),
                async: false,
                success: function (data) {
                    if ("ok" === data) {//往合同添加车位

                        $.ajax({
                            type: "post",
                            url: "${pageContext.request.contextPath}/zuhuheyue/addCarts.do",
                            data: {"treatyNumber": $("#treaty-number").val(), "carPorts": carPorts},
                            traditional: true,
                            success: function (result) {
                                if ("ok" === result) {
                                    getPageByUrl("zuhuheyue/manageRentTreaty.jsp")
                                } else {
                                    alert("添加失败。。")
                                }
                            }
                        });

                    } else {
                        alert("添加合同失败。。");
                    }
                }
            });
        });


        $("#treaty-number").focusout(function () {
            checkTreatyNumber();
        });


        $("#end-date").on("change", function () {
            checkDate();
        });

    });

    /*添加一行*/
    function addRow() {
        var count = $("#dataTable").find("tbody").find("tr:last").find("td:eq(0)").text();
        if (count == "") {
            count = 0;
        }
        count++;
        //后的车位
        var addressOption = "";
        var carOption = "";
        $.ajax({
            type: "get",
            url: "${pageContext.request.contextPath}/zuhuheyue/getAddress.do",
            async: false,
            success: function (data) {
                for (var i = 0; i < data.length; i++) {
                    addressOption += "<option value='" + data[i] + "'>" + data[i] + "<option>";
                }
                //获取第一个地址的所有编号
                $.ajax({
                    type: "post",
                    async: false,
                    url: "${pageContext.request.contextPath}/zuhuheyue/getCar.do",
                    data: {"portAddress": data[0]},
                    success: function (result) {
                        for (var i = 0; i < result.length; i++) {
                            carOption += "<option value='" + result[i].portId + "'>" + result[i].portNumber + "<option>";
                        }
                    }
                });
            }
        });
        var tr = "<tr>" +
            "<td>" + count + "</td>" +
            "<td class='am-hide-sm-only'>" +
            "<select class='changeAddress' data-am-selected='{searchBox: 1,maxHeight: 100}'>" + addressOption +
            " </select>" +
            " </td>" +
            " <td class='am-hide-sm-only'>" +
            " <select class='changeNumber' data-am-selected='{searchBox: 1,maxHeight: 100}'>" + carOption +
            " </select>" +
            " </td>" +
            " <td>" +
            " <div class='am-btn-toolbar'>" +
            "  <div class='am-btn-group am-btn-group-xs'>" +
            " <button class='am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only delBtn'>" +
            " <span class='am-icon-trash-o'></span> 删除" +
            " </button>" +
            " </div>" +
            " </div>" +
            "</td>" + "</tr>";
        $("#dataTable").find("tbody").append(tr);
        /*重新渲染*/
        $('[data-am-selected]').selected();
    }

    /*得到所有企业*/
    function getEtps() {
        $.get("${pageContext.request.contextPath}/zuhuheyue/getEtps.do", function (data) {
            $("#etps").html("");
            var option = "";
            for (var i = 0; i < data.length; i++) {
                option += "<option value='" + data[i].etpId + "'>" + data[i].etpName + "</option>";
            }
            $("#etps").append(option);
        });
    }

    /*合同号检测*/
    function checkTreatyNumber() {
        var $number = $("#treaty-number").val();
        var regex = /^[a-zA-Z0-9]{8}$/;
        if ($number.length < 1) {
            alert("合同号不能为空!");
            return false;
        }
        if (!regex.test($number)) {
            alert("合同不符合规范请输入8位合同号!");
            return false;
        }
        var isExist = true;
        //判断合同是否被注册
        $.ajax({
            type: "post",
            url: "${pageContext.request.contextPath}/zuhuheyue/treatyExist.do",
            data: {"treatyNumber": $number},
            async: false,
            success: function (data) {
                if ("no" == data) {
                    alert("合同号已存在。。");
                    isExist = false;
                }
            }
        });
        return isExist;
    }

    /*日期检测*/
    function checkDate() {
        var startDate = $("#start-date").val();
        var endDate = $("#end-date").val();
        if (startDate.length < 1) {
            alert("生效时间不能为空!");
            return false;
        }
        if (endDate.length < 1) {
            alert("失效时间不能为空!");
            return false;
        }
        startDate = startDate.replace(/-/g, "");
        endDate = endDate.replace(/-/g, "");
        if (endDate - startDate <= 0) {
            alert("失效时间必须大于生效时间");
            return false;
        }
        return true;
    }


</script>

</body>
</html>
