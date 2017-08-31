/**
 * 
 */

var userNameRegex=/^[0-9a-zA-Z\u4e00-\u9fa5]{6,18}$/;
var userPwdRegex=/^[0-9]{6,15}$/;
var realNameRegex=/^[a-zA-Z\u4e00-\u9fa5]{2,6}$/;
var addressRegex=/^[0-9a-zA-Z\u4e00-\u9fa5]{3,}$/;
var idCard18Regex=/^[1-9]\d{5}(18|19|([23]\d))\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$/;
var userPhoneRegex=/^1[3,4,5,7,8]\d{9}$/;
var userEmailRegex=/^[a-zA-Z0-9_-]+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+$/;

$("#txtUsername").focusout(function () {
	chekUserName();
});

$("#txtPassword").focusout(function () {
	chekUserPwd();
});

$("#txtuserPwdOk").focusout(function () {
	chekUserPwdOk();
});

$("#realName").focusout(function () {
	chekRealName();   
});

$("#Address").focusout(function () {
	chekAddress();
});

$("#idCard").focusout(function () {
	chekIdCard();
});

$("#userPhone").focusout(function () {
	chekUserPhone();
});

$("#userEmail").focusout(function () {
	chekUserEmail();
});

function chekUserName() {
	var userName=$("#txtUsername").val();
	if(!userNameRegex.test(userName)){
		$("#_userName").attr("style","color:red");
        $("#_userName").text("(请输入为数字、字母（大小写）和汉字（常用简体字）以及相互组合，长度限制6~18个字符)");
		return false;
	}else{
	
    var isExist = true;
    var regexUserName=$("input[name='mtype']:checked").val();
    if(regexUserName=="letter"){
        $.ajax({
            type: "POST",
            url: "regexLetterUserName.do",
            data: {userName: userName},
            success: function (data) {
                if ("no" == data) {
                	$("#_userName").attr("style","color:red");
                	$("#_userName").text("用户名已存在");
                    isExist = false;
                }else {
                	$("#_userName").attr("style","color:green");
                	$("#_userName").text("输入正确");
    			}
            }
        });
    }else if(regexUserName=="renter"){
        $.ajax({
            type: "POST",
            url: "regexRenterUserName.do",
            data: {userName: userName},
            success: function (data) {
                if ("no" == data) {
                	$("#_userName").attr("style","color:red");
                	$("#_userName").text("用户名已存在");
                    isExist = false;
                }else {
                	$("#_userName").attr("style","color:green");
                	$("#_userName").text("输入正确");
    			}
            }
        });
    }
	return isExist;
	}
	
};

function chekUserPwd() {
	var userPwd=$("#txtPassword").val();
	if(!userPwdRegex.test(userPwd)){
		$("#_userPwd").attr("style","color:red");
		return false;
	}else{
		$("#_userPwd").attr("style","color:green");
	$("#_userPwd").text("输入正确");
	return true;
	}
};

function chekUserPwdOk() {
	var userPwd=$("#txtPassword").val();
	var userPwdOk=$("#txtuserPwdOk").val();
	if(userPwd!=userPwdOk){
		$("#_userpwdok").attr("style","color:red");
		$("#_userpwdok").text("输入密码不一致");
		return false;
	}else if(userPwdOk==""){
		$("#_userpwdok").attr("style","color:red");
		$("#_userpwdok").text("请输入密码");
	}
	else{
	$("#_userpwdok").attr("style","color:green");
	$("#_userpwdok").text("输入正确");
	return true;
	}
};

function chekRealName() {
	var realName=$("#realName").val();
	if(!realNameRegex.test(realName)){
		$("#_realName").attr("style","color:red");
		return false;
	}else{
		$("#_realName").attr("style","color:green");
	$("#_realName").text("输入正确");
	return true;
	}
};

function chekAddress() {
	var address=$("#Address").val();
	if(!addressRegex.test(address)){
		$("#_Address").attr("style","color:red");
		return false;
	}else{
		$("#_Address").attr("style","color:green");
	$("#_Address").text("输入正确");
	return true;
	}
};

function chekIdCard() {
	var idCard=$("#idCard").val();
	if(!idCard18Regex.test(idCard)){
		$("#_idCard").attr("style","color:red");
		return false;
	}else{
		$("#_idCard").attr("style","color:green");
	    $("#_idCard").text("输入正确");
	return true;
	}
};

function chekUserPhone() {
	var userPhone=$("#userPhone").val();
	if(!userPhoneRegex.test(userPhone)){
		$("#_userPhone").attr("style","color:red");
		return false;
	}else{
		$("#_userPhone").attr("style","color:green");
	    $("#_userPhone").text("输入正确");
	return true;
	}
};

function chekUserEmail() {
	var userEmail=$("#userEmail").val();
	if(!userEmailRegex.test(userEmail)){
		$("#_userEmail").attr("style","color:red");
	}else{
		$("#_userEmail").attr("style","color:green");
	    $("#_userEmail").text("输入正确");
	}
};

$("#regUser").submit(function() {

	if($("#province").val()==0){
        var province="四川省";
    }else{
        province="云南省";
    }

    var address=province+$("#city").val()+$("#Address").val();

    $("#Addressxx").val(address);

	return chekUserName()&&chekUserPwd()&&chekUserPwdOk()&&chekRealName()&&chekAddress()&&chekIdCard()&&chekUserPhone();
});


/* $(function() {
	alert($("input[name='mtype']:checked").val());
}) */


