<%--
  Created by IntelliJ IDEA.
  User: Dave
  Date: 2017/8/20
  Time: 22:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>添加企业</title>
</head>
<body>
<!--面包导航-->
<div class="tpl-content-page-title">
    CBD 权限管理
</div>
<ol class="am-breadcrumb">
    <li><a href="#" class="am-icon-home">企业管理</a></li>
    <li><a href="#">添加企业</a></li>
    <li class="am-active">内容</li>
</ol>

<div class="tpl-portlet-components">
    <div class="portlet-title">
        <div class="caption font-green bold">
            <span class="am-icon-code"></span> 添加企业
        </div>

    </div>

    <div class="tpl-block ">

        <div class="am-g tpl-amazeui-form">
            <div class="am-u-sm-12 am-u-md-9">
                <form id="dataForm" class="am-form am-form-horizontal" action="../EnterOfManeger/addEnterprise.do">
                    <div class="am-form-group">
                        <label for="etp-name" class="am-u-sm-3 am-form-label">企业登录名</label>
                        <div class="am-u-sm-9">
                            <input type="text" name="userName" id="etp-name" class="am-form-field" placeholder="登录名">
                            <small></small>
                        </div>
                    </div>

                    <div class="am-form-group">
                        <label for="user-newPwd" class="am-u-sm-3 am-form-label">密码</label>
                        <div class="am-u-sm-9">
                            <input type="password" name="password" id="user-newPwd" placeholder="密码">
                            <small></small>
                        </div>
                    </div>

                    <div class="am-form-group">
                        <label for="user-rePwd" class="am-u-sm-3 am-form-label">重复密码</label>
                        <div class="am-u-sm-9">
                            <input type="password" id="user-rePwd" placeholder="重复密码">
                            <small class="tpl-color-danger"></small>
                        </div>
                    </div>

                    <div class="am-form-group">
                        <label for="etp-com" class="am-u-sm-3 am-form-label">企业名称</label>
                        <div class="am-u-sm-9">
                            <input type="text" name="etpName" id="etp-com" placeholder="企业名称">
                            <small></small>
                        </div>
                    </div>

                    <div class="am-form-group">
                        <label for="etp-location" class="am-u-sm-3 am-form-label">企业位置</label>
                        <div class="am-u-sm-9">
                            <input type="tel" name="location" id="etp-location" placeholder="楼层位置">
                            <small></small>
                        </div>
                    </div>
                    <div class="am-form-group">
                        <label for="etp-contact" class="am-u-sm-3 am-form-label">企业联系人</label>
                        <div class="am-u-sm-9">
                            <input type="tel" name="contact" id="etp-contact" placeholder="联系人">
                            <small></small>
                        </div>
                    </div>
                    <div class="am-form-group">
                        <label for="etp-phone" class="am-u-sm-3 am-form-label">电话</label>
                        <div class="am-u-sm-9">
                            <input type="tel" name="phone" id="etp-phone" placeholder="电话">
                            <small></small>
                        </div>
                    </div>


                    <div class="am-form-group">
                        <div class="am-u-sm-9 am-u-sm-push-3">
                            <button id="addEtpBtn" type="button" class="am-btn am-btn-success">添加</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
var etpNameRegex=/^[0-9a-zA-Z\u4e00-\u9fa5]{6,18}$/;

var userNewPwdRegex=/^[0-9a-zA-Z]{6,15}$/;

$("#etp-name").focusout(function () {
	checkEmpName();
});

$("#user-newPwd").focusout(function () {
    checkPwd();
});

$("#user-rePwd").focusout(function () {
    checkRePwd();
});

$("#etp-com").focusout(function () {
	checkEtpCom()    
});

$("#etp-location").focusout(function () {
	checkEtpLocation()
});

$("#etp-contact").focusout(function () {
	checkEtpContact()
});

$("#etp-phone").focusout(function () {
	checkEtpPhone()
});

function checkEmpName() {

    var etpName = $("#etp-name").val();
    if (etpName.length < 1) {
        $("#etp-name").next("small").text("不能为空！");
        return false;
    }
    if (!etpNameRegex.test(etpName)) {
        $("#etp-name").next("small").text("不符合规范！请输入6--18位中文或者英文");
        return false;
    }
    var isExist = true;
    
    $.ajax({
        type: "POST",
        url: "../qiyeguanli/regexEtpName.do",
        data: {etpName: etpName},
        success: function (data) {
            if ("no" == data) {
                $("#etp-name").next("small").text("该登录名被注册！");
                isExist = false;
            }
        }
    });
    $("#etp-name").next("small").text("");
    return isExist;
}

function checkPwd() {
    var userNewPwd = $("#user-newPwd").val();
    if (userNewPwd.length < 1) {
    	$("#user-newPwd").next("small").text("不能为空！");
        return false;
    }
    if (!userNewPwdRegex.test(userNewPwd)) {
    	$("#user-newPwd").next("small").text("不符合规范！请输入6--15位数字或字母");
        return false;
    }
    $("#user-newPwd").next("small").text("");
    return true;
}

function checkRePwd() {
    var userNewPwd = $("#user-newPwd").val();
    var userRePwd = $("#user-rePwd").val();
    if (userRePwd.length < 1) {
    	$("#user-rePwd").next("small").text("不能为空！");
        return false;
    }
    if (userNewPwd !== userRePwd) {
    	$("#user-rePwd").next("small").text("两次密码不一致！");
        return false;
    }
    $("#user-rePwd").next("small").text("");
    return true;
}

function checkEtpCom() {
    var etpCom = $("#etp-com").val();
    if (etpCom.length < 1) {
    	$("#etp-com").next("small").text("不能为空！");
        return false;
    }else {
    	$("#etp-com").next("small").text("");
        return true;
	}
}

function checkEtpLocation() {
    var etpLocation = $("#etp-location").val();
    if (etpLocation.length < 1) {
    	$("#etp-location").next("small").text("不能为空！");
        return false;
    }else {
    	$("#etp-location").next("small").text("");
        return true;
	}
}

function checkEtpContact() {
    var etpContact = $("#etp-contact").val();
    if (etpContact.length < 1) {
    	$("#etp-contact").next("small").text("不能为空！");
        return false;
    }else {
    	$("#etp-contact").next("small").text("");
        return true;
	}
}

function checkEtpPhone() {
	var etpPhoneRegex=/^1[3,4,5,7,8]\d{9}$/;
    var etpPhone = $("#etp-phone").val();
    if (etpPhone.length < 1) {
    	$("#etp-phone").next("small").text("不能为空！");
        return false;
    }else if (!etpPhoneRegex.test(etpPhone)) {
    	$("#etp-phone").next("small").text("请输入正确手机号码！");
	}
    else {
    	$("#etp-phone").next("small").text("");
        return true;
	}
}

$(function(){
	$("#addEtpBtn").on("click",function(){
		if (checkEmpName() && checkPwd() && checkRePwd() && checkEtpCom() && checkEtpLocation() && checkEtpContact() && checkEtpPhone()) {
		getPageByUrl("../qiyeguanli/addEnterprise.do",$("#dataForm").serializeArray());
		}
		});
});



	
</script>
</body>
</html>
