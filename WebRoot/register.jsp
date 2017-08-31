<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>车位网-车位招租、车位出租- 会员注册</title>
</head>
<script type="text/javascript" src="js/jquery/jquery-2.0.3.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
	<link rel="stylesheet" href="css/boot/bootstrap.css">
	<link rel="stylesheet" href="css/hscss/hscss.css">
<body onload="initprovince()" style="background-image: url(images/yyq/tm-bg-1.jpeg);background-size: 100%;">

<div class="header">
    <div class="auto960">
        <ul class="userMenufRight">
            <li> <a title="网站主页" href="MainPage.html">网站主页</a> </li>
            <li> <a title="登录" href="login.jsp">登录</a> </li>
            <li class="help"> <a title="DEDECMS 帮助中心" href="">帮助</a> </li>
        </ul>
    <script type="text/javascript">
        var now=(new Date()).getHours();
         if(now>0&&now<=6){
            document.write("午夜好，欢迎进入车位网会员注册界面");
        }else if(now>6&&now<=11){
            document.write("早上好，欢迎进入车位网会员注册界面");
        }else if(now>11&&now<=14){
            document.write("中午好，欢迎进入车位网会员注册界面");
        }else if(now>14&&now<=18){
            document.write("下午好，欢迎进入车位网会员注册界面");
        }else{
            document.write("晚上好，欢迎进入车位网会员注册界面");
        }
    </script>
    <span> 你可以选择到   </span> </div>
</div>

<div id="register">
<p>
    <div class="themefLeft" >
        <form action="register.do" method="post" id="regUser" name="form1">
            <ul class="register_ul" >
                <li class="mL68">(带<i class="red"> * </i>号的表示为必填项目，用户名必须大于6位小于18位，密码必须大于6位)</li>
                <li><span>帐号类型：</span>
                    <input type="radio" name="mtype" class="usermtype" value="letter" checked/>包租婆 &nbsp;<input type="radio" name="mtype" class="usermtype2" value="renter" />抢租客</label> &nbsp;</li>
                <li><span>用户名        &nbsp;&nbsp;：</span>
                    <input type="text" class="intxt w200" id="txtUsername" name="userName"/>
                    <i class="red">*</i> <em id="_userName" >(请输入为数字、字母（大小写）和汉字（常用简体字）以及相互组合，长度限制6~18个字符)</em> </li>
                <li><span>登陆密码：</span>
                    <input type="password" class="intxt w200" id="txtPassword" name="password"/>
                    <i class="red">*</i><em id="_userPwd" style="font-weight: bold;">请输入为6~15位数字</em> </li>
                <li><span>确认密码：</span>
                    <input type="password" class="intxt w200" size="20" value="" id="txtuserPwdOk" name="userPwdok"/>
                    <i class="red">*</i> <em id="_userpwdok" style="font-weight: bold;"><font color="red"><b></b></font></em> </li>
                <li><span>真实名称：</span>
                    <input type="text" class="intxt w200" id="realName" name="realName"/>
                    <i class="red">*</i> <em id="_realName" style="font-weight: bold;">(请输入为2~6个字符，支持英文名)</em> </li>
                <br><li><span>家庭地址：</span>
                <select  id="province"  >

                </select>
                <select  id="city">

                </select>
                <br>
                    <input type="text" class="intxt w200" style="margin-left: 13%" id="Address"/>
                <input type="hidden" id="Addressxx" name="address"/>
                <i class="red">*</i> <em id="_Address" style="font-weight: bold;">(长度必须超过3个字符长度)</em> </li>
              	<li><span>身份证号：</span>
                    <input type="text" class="intxt w200" id="idCard" name="indentNumber"/>
                    <i class="red">*</i> <em id="_idCard" style="font-weight: bold;">(请输入真实身份证号码)</em> </li>
                <li><span>手机号码：</span>
                    <input type="text" class="intxt w200" id="userPhone" name="phone"/>
                    <i class="red">*</i> <em id="_userPhone" style="font-weight: bold;">(请输入正确手机号码)</em> </li>
                <li><span>职业描述：</span>
                  <textarea rows="0" cols="30" id="describe" class="describe" name="profession"></textarea> </li>
                <li><span>邮箱地址：</span>
                    <input type="text" class="intxt w200" id="userEmail" name="email"/><em id="_userEmail" style="font-weight: bold;">(请输入正确邮箱)</em>
                    </li>
            
                <!-- <li><span>验证码：</span>
                    <input type="text" class="intxt w200" style="width: 50px; text-transform: uppercase;" id="vdcode" name="vdcode"/><img id="vdimgck" align="absmiddle" onclick="this.src=this.src+'?'" style="cursor: pointer;" alt="看不清？点击更换" src="../include/vdimgck.php"/>
                    看不清？ <a href="javascript:void(0)" onclick="changeAuthCode();">点击更换</a></li> -->
            </ul>
<!--             <div><span style="height: 110px; width: 15%;" class="fLeft">会员注册协议：</span>
                <div class="contract"> 1、在本站注册的会员，必须遵守《互联网电子公告服务管理规定》，不得在本站发表诽谤他人，侵犯他人隐私，侵犯他人知识产权，传播病毒，政治言论，商业讯息等信息。<br/>
                    2、在所有在本站发表的文章，本站都具有最终编辑权，并且保留用于印刷或向第三方发表的权利，如果你的资料不齐全，我们将有权不作任何通知使用你在本站发布的作品。<br/>
                    3、在登记过程中，您将选择注册名和密码。注册名的选择应遵守法律法规及社会公德。您必须对您的密码保密，您将对您注册名和密码下发生的所有活动承担责任。</div>
            </div> -->
            <br/>
            <button type="submit" id="btnSignCheck" class="btn btn-default btn-lg" style="margin-left: 80%;float: left;">免费注册</button>        </form>
    </div>
<div style="height: 30px"></div>
<div id="carousel-example-generic" class="carousel slide" data-ride="carousel" style="height: 500px;width: 600px;float: right;margin-right: 100px">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner">
   	<div class="item active">
      <img src="images/g1.jpg" alt="...">
  	</div>
    <div class="item">
      <img src="images/g2.jpg" alt="...">
  	</div>
  	<div class="item">
      <img src="images/g3.jpg" alt="...">
  	</div>
  </div>

  <!-- Controls -->
  <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev" style="height: 390px">
    <span class="glyphicon glyphicon-chevron-left"></span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" data-slide="next" style="height: 390px">
    <span class="glyphicon glyphicon-chevron-right"></span>
  </a>
</div>

</div>
</body>
	<script type="text/javascript" src="js/hsjs/hsjs.js"></script>
<script type="text/javascript">

    $("#province").on("change",function(){
        city();
    });

    var provinces=["四川省","云南省"];
    function initprovince(){
        var province=document.getElementById("province");
        province.innerHTML="<option>--选择--</option>";
        for(i=0;i<provinces.length;i++){
            province.innerHTML+="<option value="+i+">"+provinces[i]+"</option>";
        }
    }
    var citys=[["成都市","德阳市"],["昆明市","丽江市"]];
    function city(){
        var city=document.getElementById("city");
        city.innerHTML="<option>--选择--</option>";
        for(i=0;i<citys[province.value].length;i++){
            city.innerHTML+="<option>"+citys[province.value][i]+"</option>"
        }
    }

</script>
</html>