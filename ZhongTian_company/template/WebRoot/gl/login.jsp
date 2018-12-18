<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>
<!DOCTYPE HTML>
<html>
<head>
  <meta charset="utf-8">
  <meta name="renderer" content="webkit|ie-comp|ie-stand">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
  <meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<script type="text/javascript" src="lib/PIE_IE678.js"></script>
<![endif]-->
<link href="css/H-ui.min.css" rel="stylesheet" type="text/css" />
<link href="css/H-ui.login.css" rel="stylesheet" type="text/css" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css" />
<!--[if IE 6]>
<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>雅图仕管理系统</title>
<style type="text/css">
  .code {
    font-family: Arial;
    font-style: italic;
    color: Red;
    border: 0;
    padding: 2px 3px;
    letter-spacing: 3px;
    font-weight: bolder;
}
.unchanged {
    border: 0;
}
</style>
<link type="text/css" rel="stylesheet" href="css/H-ui.css"/>
<link type="text/css" rel="stylesheet" href="css/H-ui.admin.css"/>
<link type="text/css" rel="stylesheet" href="font/font-awesome.min.css"/>
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="lib/layer/1.9.3/layer.js"></script> 
<script type="text/javascript" src="js/pagenav.cn.js"></script>
<script type="text/javascript" src="lib/My97DatePicker/WdatePicker.js"></script> 
<script type="text/javascript" src="js/H-ui.admin.js"></script>

</head>
<body>
  <input type="hidden" id="TenantId" name="TenantId" value="" />
  <div class="loginWraper" style="overflow:hidden;">
    <div id="loginform" class="loginBox" style="-webkit-box-shadow:0px 0px 15px rgba(0,0,0,0.5);border-radius:10px;overflow:hidden;padding:10px;">
      <div style="width:100%;height:auto;overflow:hidden;border-radius:8px;display:block;background:#fff;-webkit-box-shadow: inset 0px 1px 8px rgba(0,102,204,0.3);">
        <div style="font-size:24px;text-align:center;padding-top:15px;overflow:hidden;">雅图仕管理系统</div>
        <form class="form form-horizontal" action="#" method="post" style="overflow:hidden;">
            <div class="row cl" style="overflow:hidden;">

                <div class="formControls col-8 col-offset-3" style="position:relative;width:360px;padding:0;margin:0 auto;float:none;">
                    <label class="form-label col-3" style="position:absolute;top:1px;left:1px;margin:0;width:39px;height:39px;z-index:10001;background-color:#ccc;background-position:center;display:block;padding-right:8px;"><i class="Hui-iconfont">&#xe60d;</i></label>
                    <input id="user" name="" type="text" placeholder="账户" value="admin" class="input-text size-L" style="text-indent:40px;">
                </div>
            </div>
            <div class="row cl" style="overflow:hidden;">
                <div class="formControls col-8 col-offset-3" style="position:relative;width:360px;padding:0;margin:0 auto;float:none;">
                    <label class="form-label col-3" style="position:absolute;top:1px;left:1px;margin:0;width:39px;height:39px;z-index:10001;background-color:#ccc;background-position:center;display:block;padding-right:8px;"><i class="Hui-iconfont">&#xe60e;</i></label>
                    <input id="password" name="" type="password" placeholder="密码" class="input-text size-L" style="text-indent:40px;">
                 </div>
            </div>
  <div class="row cl" style="overflow:hidden;">
    <div class="formControls col-8 col-offset-3">
      <input id="code" class="input-text size-L" type="text" placeholder="验证码" onclick="if(this.value=='验证码:'){this.value='';}"  onkeydown="if(event.keyCode == 13){checkLogin();};" style="width:150px;height:30px">
      <!--<input type="text" onclick="createCode()" readonly="readonly" id="checkCode" class="unchanged"/>  <a id="kanbuq" href="javascript:;">看不清，换一张</a> </div> -->
      <div onclick="createCode()"   readonly="readonly" id="checkCode" class="unchanged"  style="width: 80px;display:inline;" onpaste="return false" oncontextmenu="return false" oncopy="return false" oncut="return false"></div>
  </div><br>
  <div class="row" style="overflow:hidden;">
      <div class="formControls col-8 col-offset-3" style="overflow:hidden;margin:50 auto;width:330px;padding:0;float:none;">
        <input name="" id="login" type="button" class="btn btn-success radius size-L" onclick="checkLogin();" value="&nbsp;登&nbsp;&nbsp;&nbsp;&nbsp;录&nbsp;" style="float:left;display:block;margin:0 10px;">
        <input name="" type="reset" class="btn btn-default radius size-L" value="&nbsp;取&nbsp;&nbsp;&nbsp;&nbsp;消&nbsp;" style="float:left;display:block;margin:0 10px;">
    </div>
</div>
<div class="forgetp" style="overflow:hidden;float:right;padding:5px 30px;line-height:20px;cursor:pointer;"></div>
</form>
</div>
</div>
</div>
<div class="footer">Copyright 中天物联 by 雅图仕管理系统</div>
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="js/H-ui.js"></script> 
<script>
  var _hmt = _hmt || [];
  (function() {
    var hm = document.createElement("script");
    hm.src = "//hm.baidu.com/hm.js?080836300300be57b7f34f4b3e97d911";
    var s = document.getElementsByTagName("script")[0]; 
    s.parentNode.insertBefore(hm, s);
})();
var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3F080836300300be57b7f34f4b3e97d911' type='text/javascript'%3E%3C/script%3E"));
$(function(){
 createCode() ;
})
function checkLogin(){
    var inputCode = document.getElementById("code").value;
    if (inputCode.length <= 0) {
      layer.msg("请输入验证码！");
      return $("#code").focus();
  } else if (inputCode.toLowerCase() != code.toLowerCase()) {
      layer.msg("验证码输入错误！");
  createCode();//刷新验证码  
  return $("#code").focus();
}

var userCode = $("#user").val().trim();
var pwd = $("#password").val().trim();

if(!userCode){
  layer.msg("请输入帐号！");
  return $("#user").focus();
}else if(!pwd){
  layer.msg("请输入密码！");
  return $("#password").focus();
} 
$.ajax({
  url:"../adminInfo/checkLogin.do",
  type:"POST",
  data:{"adminCode":userCode,"pwd":pwd},
  dataType:"json",
  success:function(result){
     if(result.status == 0) {
       window.location.href="index.jsp";

   }else{
       layer.msg(result.msg);
   }
},
error:function(){
  layer.msg("登陆失败！");
}

});     
};
var code; //在全局 定义验证码  
function createCode() {
  code = "";
  var codeLength = 5;//验证码的长度  
  var checkCode = document.getElementById("checkCode");
  var selectChar = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9,'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z');//所有候选组成验证码的字符，当然也可以用中文的  

  for (var i = 0; i < codeLength; i++) {
    var charIndex = Math.floor(Math.random() * 36);
    code += selectChar[charIndex];
}
  //layer.msg(code);
  if (checkCode) {
    checkCode.className = "code";
    $("#checkCode").html("");
    $("#checkCode").append(code);
    //checkCode.value = code;
}
}



var phone_pattern = /^0?1[3|4|5|7|8][0-9]\d{8}$/;/* 验证以13、14、15、18开头的手机号*/

function clear(){
  $("#user").val("");
  $("#password").val("");
}
</script>
</body>
</html>