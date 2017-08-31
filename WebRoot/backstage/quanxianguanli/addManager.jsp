<%--
  Created by IntelliJ IDEA.
  User: Dave
  Date: 2017/8/20
  Time: 22:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>添加管理员</title>
    <meta name="description" content="这是一个 index 页面">
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
    <li><a href="#">添加用户</a></li>
    <li class="am-active">内容</li>
</ol>

<div class="tpl-portlet-components">
    <div class="portlet-title">
        <div class="caption font-green bold">
            <span class="am-icon-code"></span> 添加
        </div>

    </div>

    <div class="tpl-block ">

        <div class="am-g tpl-amazeui-form">
            <div class="am-u-sm-12 am-u-md-9">
                <form id="dataForm" class="am-form am-form-horizontal">
                    <div class="am-form-group">
                        <label for="user-number" class="am-u-sm-3 am-form-label">工号 / ID</label>
                        <div class="am-u-sm-9">
                            <input type="text" name="empId" id="user-number" class="am-form-field" placeholder="工号">
                            <small></small>
                        </div>
                    </div>

                    <div class="am-form-group">
                        <label for="user-newPwd" class="am-u-sm-3 am-form-label">密码 / Password</label>
                        <div class="am-u-sm-9">
                            <input type="password" name="password" id="user-newPwd" placeholder="密码">
                            <small></small>
                        </div>
                    </div>

                    <div class="am-form-group">
                        <label for="user-rePwd" class="am-u-sm-3 am-form-label">重复密码 / Password</label>
                        <div class="am-u-sm-9">
                            <input type="password" id="user-rePwd" placeholder="重复密码">
                            <small></small>
                        </div>
                    </div>

                    <div class="am-form-group">
                        <label for="user-name" class="am-u-sm-3 am-form-label">姓名 / Name</label>
                        <div class="am-u-sm-9">
                            <input type="text" name="userName" id="user-name" placeholder="真实姓名">
                            <small></small>
                        </div>
                    </div>

                    <div class="am-form-group">
                        <label for="user-phone" class="am-u-sm-3 am-form-label">电话 / Phone</label>
                        <div class="am-u-sm-9">
                            <input type="tel" name="phone" id="user-phone" placeholder="输入你的电话">
                            <small></small>
                        </div>
                    </div>

                    <div class="am-form-group">
                        <label for="user-phone" class="am-u-sm-3 am-form-label">权限 / role</label>
                        <div class="am-u-sm-9">
                            <label class="am-checkbox-inline">
                                <input type="checkbox" name="" value="1"> 用户管理
                            </label>
                            <label class="am-checkbox-inline">
                                <input type="checkbox" value="2"> 合同管理
                            </label>
                            <label class="am-checkbox-inline">
                                <input type="checkbox" value="3"> 投诉管理
                            </label>
                            <label class="am-checkbox-inline">
                                <input type="checkbox" value="4"> 车位管理
                            </label>
                        </div>
                        <input type="hidden" name="role" id="role">
                    </div>

                    <div class="am-form-group">
                        <div class="am-u-sm-9 am-u-sm-push-3">
                            <button id="addManager" type="button" class="am-btn am-btn-success">添加</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(function () {

        /*得到焦点*/
        $("#user-number").focusin(function () {
            $(this).next("small").text("工号为4为数字");
        });
        $("#user-newPwd").focusin(function () {
            $(this).next("small").text("密码5-11位");
        });
        $("#user-name").focusin(function () {
            $(this).next("small").text("姓名2-7位，可以是中文");
        });
        $("#user-phone").focusin(function () {
            $(this).next("small").text("11位电话号码 133|135|187|188|159|158");
        });

        /*失去焦点*/
        $("#user-number").focusout(function () {
            checkEmpId();
        });
        $("#user-newPwd").focusout(function () {
            checkPwd();
        });
        $("#user-rePwd").focusout(function () {
            checkRePwd();
        });
        $("#user-name").focusout(function () {
            checkName();
        });
        $("#user-phone").focusout(function () {
            checkPhone();
        });

        /*添加按钮*/
        $("#addManager").on("click", function () {
            if (checkEmpId() && checkPwd() && checkRePwd() && checkName() && checkPhone()) {
                /*权限字符串*/
                var roleStr = "";
                $(":checked").each(function () {

                    roleStr += $(this).val() + ":";
                });
                $("#role").val(roleStr.substr(0, roleStr.length - 1));
                getPageByUrl("${pageContext.request.contextPath}/quanxianguanli/add.do", $("#dataForm").serializeArray());
            }
        });


    });

    /*工号检测*/
    function checkEmpId() {

        var $number = $("#user-number").val();
        var numberRegex = /^\d{4}$/;
        if ($number.length < 1) {
            $("#user-number").next("small").text("不能为空！");
            return false;
        }
        if (!numberRegex.test($number)) {
            $("#user-number").next("small").text("不符合规范！");
            return false;
        }
        var isExist = true;
        $.ajax({
            type: "post",
            url: "${pageContext.request.contextPath}/quanxianguanli/exist.do",
            async: false,
            data: {"empId": $number},
            success: function (data) {
                if ("no" == data) {
                    $("#user-number").next("small").text("该工号被注册！");
                    isExist = false;
                }
            }
        });
        if (isExist) {
            $("#user-number").next("small").text("");
        }
        return isExist;
    }

    /*密码检测*/
    function checkPwd() {
        var $pwd = $("#user-newPwd");
        var numberRegex = /^\w{5,11}$/;
        if ($pwd.val().length < 1) {
            $pwd.next("small").text("不能为空！");
            return false;
        }
        if (!numberRegex.test($pwd.val())) {
            $pwd.next("small").text("不符合规范！");
            return false;
        }
        $pwd.next("small").text("");
        return true;
    }

    /*二次输入密码*/
    function checkRePwd() {
        var $pwd = $("#user-newPwd");
        var $repwd = $("#user-rePwd");
        if ($repwd.val().length < 1) {
            $repwd.next("small").text("不能为空！");
            return false;
        }
        if ($pwd.val() !== $repwd.val()) {
            $repwd.next("small").text("两次密码不一致！");
            return false;
        }
        $repwd.next("small").text("");
        return true;
    }

    /*用户名检测*/
    function checkName() {
        var $name = $("#user-name").val();
        var regex = /^[A-Za-z0-9\u4E00-\u9FA5]{2,7}$/;

        if ($name.length < 1) {
            $("#user-name").next("small").text("姓名不能为空!");
            return false;
        }
        if (!regex.test($name)) {
            $("#user-name").next("small").text("格式不正确!");
            return false;
        }
        $("#user-name").next("small").text("");
        return true;
    }

    /*电话检测*/
    function checkPhone() {
        var $phone = $("#user-phone");
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


</script>
</body>
</html>
