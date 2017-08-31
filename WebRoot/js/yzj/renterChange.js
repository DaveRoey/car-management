match();
	$("input").keyup(function(){
		match();
	});
var oldPwdTest=new RegExp("[0-9]{8,15}");
var newPwdTest=new RegExp("[0-9]{8,15}");
var surePwdTest=new RegExp("[0-9]{8,15}");
var addressTest=new RegExp("[0-9a-zA-Z\u4e00-\u9fa5]{10,}");
var phoneTest =new RegExp("1[3|4|5|7|8][0-9]{9}");

/* 验证通过标记*/
var oldPwdLab=0;
var newPwdLab=0;
var surePwdLab=0;
var addressLab=0;
var phoneLab=0;

function match(){
	//原密码验证
	var oldPwd = $("#oldPwd").val();
	if(oldPwdTest.test(oldPwd)){
		//通过验证
		oldPwdLab=1;
		$("#oldPwd").next().next().removeClass("glyphicon-remove-circle");
		$("#oldPwd").next().next().addClass("glyphicon-ok-circle");
	}else{
		//未通过验证
		oldPwdLab=0;
		$("#oldPwd").next().next().addClass("glyphicon-remove-circle");
		$("#oldPwd").next().next().removeClass("glyphicon-ok-circle");
		
	}
	//newPwd验证
	var newPwd = $("#newPwd").val();
	if(newPwdTest.test(newPwd)){
		//通过验证
		newPwdLab=1;
		$("#newPwd").next().next().removeClass("glyphicon-remove-circle");
		$("#newPwd").next().next().addClass("glyphicon-ok-circle");
	}else{
		//未通过验证
		newPwdLab=0;
		$("#newPwd").next().next().addClass("glyphicon-remove-circle");
		$("#newPwd").next().next().removeClass("glyphicon-ok-circle");
		
	}
	//surePwd验证
	var surePwd = $("#surePwd").val();
	if(surePwdTest.test(surePwd)&&newPwd==surePwd){
		//通过验证
		surePwdLab=1;
		$("#surePwd").next().next().removeClass("glyphicon-remove-circle");
		$("#surePwd").next().next().addClass("glyphicon-ok-circle");
	}else{
		//未通过验证
		surePwdLab=0;
		$("#surePwd").next().next().addClass("glyphicon-remove-circle");
		$("#surePwd").next().next().removeClass("glyphicon-ok-circle");
		
	}
	
	//address验证
	var address = $("#address").val();
	
	if(addressTest.test(address)){
		//通过验证
		addressLab=1;
		$("#address").next().removeClass("glyphicon-remove-circle");
		$("#address").next().addClass("glyphicon-ok-circle");
	}else{
		//未通过验证
		addressLab=0;
		$("#address").next().addClass("glyphicon-remove-circle");
		$("#address").next().removeClass("glyphicon-ok-circle");
		
	}
	
	//phone验证
	var phone = $("#phone").val();
	if(phoneTest.test(phone)){
		//通过验证
		phoneLab=1;
		$("#phone").next().removeClass("glyphicon-remove-circle");
		$("#phone").next().addClass("glyphicon-ok-circle");
	}else{
		//未通过验证
		phoneLab=0;
		$("#phone").next().addClass("glyphicon-remove-circle");
		$("#phone").next().removeClass("glyphicon-ok-circle");
		
	}
}