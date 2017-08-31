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
    <title>Title</title>
</head>
<body>
<div class="tpl-content-page-title">
    CBD 外部合约
</div>
<ol class="am-breadcrumb">
    <li><a href="#" class="am-icon-home">外部合同</a></li>
    <li><a href="#">添加合约</a></li>
    <li class="am-active">添加</li>
</ol>
<div class="tpl-portlet-components">
    <div class="portlet-title">
        <div class="caption font-green bold">
            <span class="am-icon-code"></span> 合同续约
        </div>


    </div>

    <div class="tpl-block">

        <div class="am-g">
            <div class="tpl-form-body tpl-form-line">
                <form id="uploadForm" class="am-form tpl-form-line-form" method="post">
                    <div class="am-form-group">
                        <label for="treaty-number" class="am-u-sm-3 am-form-label">合同号 </label>
                        <div class="am-u-sm-9">
                            <input type="text" name="treatyNumber" class="tpl-form-input" id="treaty-number"
                                   placeholder="请输入合同号">
                            <small>如：停:20170817</small>
                        </div>
                    </div>

                    <div class="am-form-group">
                        <label for="start-time" class="am-u-sm-3 am-form-label">合同生效时间 </label>
                        <div class="am-u-sm-9">
                            <input type="text" name="startDate" id="start-time" class="am-form-field tpl-form-no-bg"
                                   placeholder="合同生效时间"
                                   data-am-datepicker="" readonly/>
                            <small>生效时间必填</small>

                        </div>
                    </div>

                    <div class="am-form-group">
                        <label for="end-time" class="am-u-sm-3 am-form-label">合同到期时间 </label>
                        <div class="am-u-sm-9">
                            <input type="text" name="endDate" id="end-time" class="am-form-field tpl-form-no-bg"
                                   placeholder="合同到期时间"
                                   data-am-datepicker="" readonly/>
                            <small>到期时间为必填</small>
                        </div>
                    </div>

                    <div class="am-form-group">
                        <label for="treaty-com" class="am-u-sm-3 am-form-label">合同单位 </label>
                        <div class="am-u-sm-9">
                            <input type="text" name="company" id="treaty-com" placeholder="合同单位">
                            <small></small>
                        </div>
                    </div>

                    <div class="am-form-group">
                        <label for="contact" class="am-u-sm-3 am-form-label">联系人 </label>
                        <div class="am-u-sm-9">
                            <input type="text" name="contact" id="contact" placeholder="联系人">
                            <small></small>
                        </div>
                    </div>

                    <div class="am-form-group">
                        <label for="phone" class="am-u-sm-3 am-form-label">联系电话 </label>
                        <div class="am-u-sm-9">
                            <input type="tel" id="phone" name="phone" placeholder="联系电话">
                            <small></small>
                        </div>
                    </div>

                    <div class="am-form-group">
                        <label for="port-number" class="am-u-sm-3 am-form-label">数量 </label>
                        <div class="am-u-sm-9">
                            <input type="number" name="count" id="port-number" placeholder="车位数量">
                            <small></small>
                        </div>
                    </div>


                    <div class="am-form-group">
                        <label class="am-u-sm-3 am-form-label">合同 </label>
                        <div class="am-u-sm-9">
                            <div class="am-form-group am-form-file">
                                <div class="tpl-form-file-img">
                                    <img width="300" height="175" src="../images/backimg/test.png" id="imgSize1ImgSrc"
                                         alt="">
                                </div>
                                <input id="doc-form-file" name="imgSize1File" onchange="submitImgSize1Upload()"
                                       type="file" multiple>
                            </div>
                        </div>
                        <input type="hidden" id="imgSize1" name="treatyImg">
                    </div>
                    <div class="am-form-group">
                        <div class="am-u-sm-9 am-u-sm-push-3">
                            <button type="button" id="saveOutTreaty"
                                    class="am-btn am-btn-primary tpl-btn-bg-color-success ">
                                添加合同
                            </button>
                        </div>
                    </div>
                </form>

            </div>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/js/backjs/comm/amazeui.min.js"></script>
<script src="${pageContext.request.contextPath}/js/backjs/comm/app.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/backjs/comm/jquery.form.js"></script>
<script type="text/javascript">
    $(function () {
        $("#imageFile").on("change", function () {
            submitImgSize1Upload();
        });
        /*得到焦点*/
        $("#treaty-number").focusin(function () {
            $(this).next("small").text("请输入8位和合同编号");
        });
        $("#treaty-com").focusin(function () {
            $(this).next("small").text("输入公司名称");
        });
        $("#contact").focusin(function () {
            $(this).next("small").text("姓名2-7位，可以是中文");
        });
        $("#phone").focusin(function () {
            $(this).next("small").text("11位电话号码，133|135|187|188|159|158");
        });
        $("#port-number").focusin(function () {
            $(this).next("small").text("车位数量");
        });

        /*失去焦点*/
        $("#treaty-number").focusout(function () {
            checkTtreatyId();
        });
        $("#treaty-com").focusout(function () {
            checkComName();
        });
        $("#contact").focusout(function () {
            checkContract();
        });

        $("#phone").focusout(function () {
            checkPhone();
        });
        $("#port-number").focusout(function () {
            checkNumber();
        });
        /*添加合同*/
        $("#saveOutTreaty").on("click", function () {
            if (checkTtreatyId() && checkComName() && checkContract() && checkPhone() && checkNumber()&&checkDate()&&checkImg()) {
                getPageByUrl("${pageContext.request.contextPath}/waibuheyue/add.do", $("#uploadForm").serializeArray());

            }
        });



    });
    /*图片上传*/
    function submitImgSize1Upload() {
        var option = {
            type: 'POST',
            url: '${pageContext.request.contextPath }/waibuheyue/upload.do',
            dataType: 'text',
            data: {
                fileName: 'imgSize1File'
            },
            success: function (data) {
                var result=data.split(":");
                if("ok"==result[0]){
                    $("#imgSize1ImgSrc").attr("src", "${pageContext.request.contextPath}/" + result[1]);
                    //数据库保存相对路径
                    $("#imgSize1").val(result[1]);
                }else {
                    alert("该格式不被允许!");
                }


            }

        };
        //图片上传
        $("#uploadForm").ajaxSubmit(option);

    }


    /*合同号检测*/
    function checkTtreatyId() {

        var $number = $("#treaty-number").val();
        var numberRegex = /^\w{8}$/;
        if ($number.length < 1) {
            $("#treaty-number").next("small").text("不能为空！");
            return false;
        }
        if (!numberRegex.test($number)) {
            $("#treaty-number").next("small").text("合同不符合规范！");
            return false;
        }
        var isExist = true;
        $.ajax({
            type: "post",
            url: "${pageContext.request.contextPath}/waibuheyue/exist.do",
            async: false,
            data: {"treatyNumber": $number},
            success: function (data) {
                if ("no" == data) {
                    $("#user-number").next("small").text("该合同号被注册！");
                    isExist = false;
                }
            }
        });
        if (isExist) {
            $("#treaty-number").next("small").text("");
        }
        return isExist;
    }

    /*公司名称*/
    function checkComName() {
        var $pwd = $("#treaty-com");
        var numberRegex = /^[A-Za-z0-9\u4E00-\u9FA5]{2,15}$/;
        if ($pwd.val().length < 1) {
            $pwd.next("small").text("公司不能为空！");
            return false;
        }
        if (!numberRegex.test($pwd.val())) {
            $pwd.next("small").text("公司不符合规范！");
            return false;
        }
        $pwd.next("small").text("");
        return true;
    }

    /*联系人*/
    function checkContract() {
        var $repwd = $("#contact");
        var checkReg = /^[A-Za-z0-9\u4E00-\u9FA5]{2,7}$/;
        if ($repwd.val().length < 1) {
            $repwd.next("small").text("不能为空！");
            return false;
        }
        if (!checkReg.test($repwd.val())) {
            $repwd.next("small").text("姓名不合法！");
            return false;
        }
        $repwd.next("small").text("");
        return true;
    }

    /*车位数量*/
    function checkNumber() {
        var $name = $("#port-number").val();
        var regex = /^[1-9]\d*$/;

        if ($name.length < 1) {
            $("#port-number").next("small").text("数量不能为空!");
            return false;
        }
        if (!regex.test($name)) {
            $("#port-number").next("small").text("数量格式不正确!");
            return false;
        }
        $("#port-number").next("small").text("");
        return true;
    }

    /*电话检测*/
    function checkPhone() {
        var $phone = $("#phone");
        var regex = /^(133|135|187|188|159|158)\d{8}$/;
        if ($phone.val().length < 1) {
            $phone.next("small").text("电话不能为空!");
            return false;
        }
        if (!regex.test($phone.val())) {
            $phone.next("small").text("电话个格式不正确!");
            return false;
        }
        $phone.next("small").text("");
        return true;
    }
    /*日期检测*/
    function checkDate() {
        var startDate = $("#start-time").val();
        var endDate = $("#end-time").val();
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

    /*图片检测*/
    function checkImg() {
        var img= $("#imgSize1ImgSrc").attr("src");
        if(img=="../images/backimg/test.png"){
            alert("请选择合同图片！");
            return false;
        }
        return true;
    }
</script>
</body>
</html>
