<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Insert title here</title>
    <link href="css/login/style.css" rel='stylesheet' type='text/css'/>
    <link href='css/login/zhuye.css' rel='stylesheet' type='text/css'>
    <link href='css/login/ciye.css' rel='stylesheet' type='text/css'>
</head>
<body>
<div class="login-form">
    <div class="close"></div>
    <div class="head-info">
        <label style="margin-left:0px;font-size: 30px;color:green">CBD登录管理</label>
        <span style="margin-left: 30%;font-size: 14px"><a href="register.jsp" style="color: red">注册</a></span>

    </div>
    <div class="clear"></div>
    <div class="avtar">
        <img src="images/loginimage/qichetouxiang.jpg"/>
    </div>
    <form id="loginForm">
        <input type="text" class="userName" name="userName"
               placeholder="UserName">
        <div class="key">
            <input type="password" class="userPwd" placeholder="Password"
                   name="userPwd">
        </div>
        <span class="error_msg" style="color: red;">&nbsp;</span>
    </form>
    <div style="color: white;">
        <input type="radio" name="mType" class="btn btn-default"
               value="Letter" checked="checked"/><span>包租婆</span> <input
            type="radio" name="mType" class="btn btn-default" value="renter"/><span>抢租客</span>
        <input type="radio" name="mType" class="btn btn-default"
               value="enterprise"/><span>企业</span>


    </div>
    <div class="signin">
        <input type="submit" class="btn_login" value="Login">

    </div>
</div>
</body>
<script type="text/javascript" src="js/jquery/jquery-2.0.3.js"></script>

<script type="text/javascript">
    $(function () {

        $.ajax({
            type: "POST", url: "checkExist.do",
            success: function (data) {
                var types = data;
                if (types.toString() == "existLetter") {

                    window.location.href = "forestage/baozupo/letterMain.html";
                }
                else if (types.toString() == "existRenter") {

                    window.location.href = "forestage/qiangzuke/renterMain.html";
                }
            }
        });

        /* $.ajax({
         type : "POST",
         url : "gg.do",
         success : function(data) {
         if(data=="yes"){
         location.href="forestage/common/parkingLotsInfo.jsp";
         }
         }
         });*/
        /* 获得焦点 */

        /* 失去焦点 */
        $(".userName").blur(function () {
            checkName();
        });

        $(".userPwd").blur(function () {
            checkPwd();
        });

        /* 登录 */
        $('.btn_login').click(function () {
            if (!checkName()) {
                return;
            }
            if (!checkPwd()) {
                return;
            }
            var username = $(".userName").val();
            var userpwd = $(".userPwd").val();

            // 异步提交
            $.ajax({
                type: "POST",
                url: "login.do",
                data: {
                    "username": username,
                    "userpwd": userpwd,
                    "mType": $(":radio:checked").val()
                },
                success: function (data) {
                    var types = data;
                    if (types.toString() == "letter") {
                        window.location.href = "forestage/baozupo/letterMain.html";

                    } else if (types.toString() == "renter") {
                        window.location.href = "forestage/qiangzuke/renterMain.html";
                    } else if (types.toString() == "enterprise") {
                        window.location.href = "forestage/qiyeyonghu/main.jsp";
                    }
                    else {
                        $(".error_msg").html('用户名不存在/密码错误');
                        $(".error_msg").show().fadeOut(2000);
                    }
                }
            });
        });

    });

    /* 用户名检测 */
    function checkName() {
        var username = $(".userName").val();
        var userReg = /^[0-9a-zA-Z\u4e00-\u9fa5]{6,18}$/;
        if (username.length < 1) {
            $(".error_msg").html('用户名不能为空');
            $(".error_msg").show().fadeOut(2000);
            $(".userName").focus();
            return false;
        }
        if (!userReg.test(username)) {
            $(".error_msg").html('请填写有效的用户名');
            $(".error_msg").show().fadeOut(2000);

            return false;
        }
        return true;
    }

    /* 用户名检测 */
    function checkPwd() {
        var userpwd = $(".userPwd").val();
        var pwdReg = /^[a-zA-Z0-9]{6,15}$/;
        if (userpwd.length < 1) {
            $(".error_msg").html('密码不能为空');
            $(".error_msg").show().fadeOut(2000);

            return false;
        }
        if (!pwdReg.test(userpwd)) {
            $(".error_msg").html('请填写有效的密码');
            $(".error_msg").show().fadeOut(2000);

            return false;
        }
        return true;
    }
</script>
</html>