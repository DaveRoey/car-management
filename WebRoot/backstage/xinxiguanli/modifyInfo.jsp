<%--
  Created by IntelliJ IDEA.
  User: Dave
  Date: 2017/8/20
  Time: 22:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>修改个人信息</title>
    <meta name="description" content="这是一个 index 页面">
    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp"/>

</head>
<body>
<!--面包导航-->
<div class="tpl-content-page-title">CBD 信息管理</div>
<ol class="am-breadcrumb">
    <li><a href="#" class="am-icon-home">个人信息</a></li>
    <li><a href="#">修改信息</a></li>
    <li class="am-active">内容</li>
</ol>

<div class="tpl-portlet-components">
    <div class="portlet-title">
        <div class="caption font-green bold">
            <span class="am-icon-code"></span> 个人信息
        </div>

    </div>

    <div class="tpl-block ">

        <div class="am-g tpl-amazeui-form">


            <div class="am-u-sm-12 am-u-md-9">
                <form class="am-form am-form-horizontal">
                    <div class="am-form-group">
                        <label for="user-pwd" class="am-u-sm-3 am-form-label">原密码
                            / Password</label>
                        <div class="am-u-sm-9">
                            <input type="password" id="user-pwd" placeholder="原密码">
                            <small></small>
                        </div>
                    </div>

                    <div class="am-form-group">
                        <label for="user-newPwd" class="am-u-sm-3 am-form-label">新密码
                            / Password</label>
                        <div class="am-u-sm-9">
                            <input type="password" onfocus="pwdTishi()" onblur="checkPwd()" id="user-newPwd"
                                   placeholder="输入新的密码">
                            <small id="pwdinfo"></small>
                        </div>
                    </div>

                    <div class="am-form-group">
                        <label for="user-rePwd" class="am-u-sm-3 am-form-label">重复密码
                            / Password</label>
                        <div class="am-u-sm-9">
                            <input type="password" onblur="checkPassword()" id="user-rePwd"
                                   placeholder="重复密码">
                            <small></small>
                        </div>
                    </div>

                    <div class="am-form-group">
                        <label for="user-phone" class="am-u-sm-3 am-form-label">电话
                            / Phone</label>
                        <div class="am-u-sm-9">
                            <input type="tel" onfocus="changePhone()" value="${manage.phone}" onblur="checkPhone()"
                                   id="user-phone" placeholder="输入你的电话">
                            <small></small>
                        </div>
                    </div>
                    <div class="am-form-group">
                        <div class="am-u-sm-9 am-u-sm-push-3">
                            <button type="button" class="am-btn am-btn-primary">保存修改</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(function () {
        $(".am-btn").on("click", function () {
            empId = ${sessionScope.manage.empId};
            var userPwd = $("#user-pwd").val();
            var usernewPwd = $("#user-newPwd").val();
            var userrePwd = $("#user-rePwd").val();
            var userphone = $("#user-phone").val();
            if (userPwd == "" || usernewPwd == "") {
                alert("请输入密码")
            } else {
                if (userPwd == usernewPwd) {
                    alert("新密码与原密码不能一致");
                } else if (usernewPwd != userrePwd) {
                    alert("两次输入的密码不一致")
                } else {
                    $.ajax({
                        type: "POST",
                        url: "../xinxiguanli/updateInfo.do",
                        data: {
                            userPwd: userPwd,
                            empId: empId,
                            usernewPwd: usernewPwd,
                            userphone: userphone
                        },
                        success: function (result) {
                            /* getPageByUrl("home.html"); */
                            if (result == 1) {
                                alert("修改成功");
                                getPageByUrl("home.html")
                            } else if (result == 0) {
                                alert("修改失败,请检查原密码是否输入正确");
                                $("#user-pwd").val("");
                                $("#user-newPwd").val("");
                                $("#user-rePwd").val("");
                                getPageByUrl("modifyInfo.jsp");
                            }
                        }
                    });
                }
            }
        });
    });
    function checkPwd() {
        var pwdReg = /^[a-zA-Z0-9]{5,11}$/;
        if (!pwdReg.test($("#user-newPwd").val())) {
            $("#user-newPwd").val("");
            $("#user-newPwd").next("small").text("密码不符合规范...");
            return false;
        } else {
            $("#user-newPwd").next("small").text("");
            return true;
        }
    }
    function checkPassword() {
        if ($("#user-rePwd").val() != $("#user-newPwd").val()) {
            $("#user-rePwd").next("small").text("两次输入的密码不一致...");
            $("#user-rePwd").val("");
            return false;
        } else {
            $("#user-rePwd").next("small").text("");
            return true;
        }
    };
    function checkPhone() {
        var phoneReg = /^(133|135|187|188|159|158)\d{8}$/;
        if (!phoneReg.test($("#user-phone").val())) {
            $("#user-phone").val("");
            $("#user-phone").next("small").text("电话格式错误");
            return false;
        } else {
            $("#user-phone").next("small").text("");
            return true;
        }
    }
    function pwdTishi() {
        $("#user-newPwd").next("small").text("密码5-11位");
    }
    function changePhone() {
        $("#user-phone").next("small").text("11位电话133|135|187|188|159|158");
    }

</script>

</body>
</html>
