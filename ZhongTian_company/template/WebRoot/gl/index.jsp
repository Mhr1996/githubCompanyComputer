<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

<link type="text/css" rel="stylesheet" href="css/shop.css" />
<link type="text/css" rel="stylesheet" href="skin/blue/skin.css"
	id="skin" />
<link type="text/css" rel="stylesheet" href="css/Sellerber.css" />
<link type="text/css" rel="stylesheet" href="css/bkg_ui.css" />
<link type="text/css" rel="stylesheet"
	href="font/css/font-awesome.min.css" />
<link type="text/css" rel="stylesheet" href="css/index.css" />
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="lib/layer/1.9.3/layer.js"></script>
<script type="text/javascript" src="js/jquery.cookie.js"></script>
<script type="text/javascript" src="js/toolTemplate.js"></script>
<script type="text/javascript" src="js/Sellerber.js"></script>
<script type="text/javascript" src="js/jquery.nicescroll.js"></script>
<script type="text/javascript" src="js/shopFrame.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<title>雅图仕系统</title>
</head>
<!--[if lt IE 9]>
<script src="js/html5shiv.js"></script>
<script src="js/respond.min.js"></script>
<script type="text/javascript" src="js/PIE/PIE_IE678.js"></script>
<![endif]-->
<!-- <%@include file="common.jspf" %> -->
<body>
	<div class="Sellerber" id="Sellerber">
		<div class="Sellerber_header apex clearfix" id="Sellerber_header">
			<!--顶部-->
			<div class="l_f logo header">
				<img src="images/ztlogo.png" />
			</div>
			<div class="r_f Columns_top clearfix header">

				<div class="news l_f ">
					<a href="#" class="fa  fa-bell "></a><em>5</em>
				</div>
				<div class="administrator l_f">
					<img src="images/avatar.png" width="36px" /><span class="user-info">欢迎你,超级管理员</span><i
						class="glyph-icon fa  fa-caret-down"></i>
					<ul class="dropdown-menu">
						<li><a href="#"><i class="fa fa-user"></i>个人信息</a>
						</li>
						<li><a href="#"><i class="fa fa-cog"></i>系统设置</a>
						</li>
						<li><a href="javascript:void(0)" id="Exit_system"><i
								class="fa fa-user-times"></i>退出</a>
						</li>
					</ul>
				</div>

			</div>
		</div>
		<!--左侧-->
		<div class="Sellerber_left menu" id="menuBar">
			<div class="show_btn" id="rightArrow">
				<span></span>
			</div>
			<div class="side_title">
				<a title="隐藏" class="close_btn"><span></span>
				</a>
			</div>
			<div class="menu_style" id="menu_style">
				<div class="list_content">
					<div class="skin_select">
						<ul class="dropdown-menu dropdown-caret">
							<li><a class="colorpick-btn selected"
								href="javascript:void(0)" data-val="blue"
								style="background-color:#438EB9;"></a>
							</li>
							<li><a class="colorpick-btn" href="javascript:void(0)"
								data-val="default" id="default" style="background-color:#222A2D"></a>
							</li>
							<li><a class="colorpick-btn" href="javascript:void(0)"
								data-val="green" style="background-color:#72B63F;"></a>
							</li>
							<li><a class="colorpick-btn" href="javascript:void(0)"
								data-val="gray" style="background-color:#D0D0D0;"></a>
							</li>
							<li><a class="colorpick-btn" href="javascript:void(0)"
								data-val="red" style="background-color:#FF6868;"></a>
							</li>
							<li><a class="colorpick-btn" href="javascript:void(0)"
								data-val="purple" style="background-color:#6F036B;"></a>
							</li>
						</ul>
					</div>
					<!--左侧菜单栏目-->
					<div class="column_list" id="column_list">
						<dl class="nav nav-list" id="menu_list">
							<dt class="nav_link" data-file-id="201807230001" style="">
								<a href="javascript:void(0)" class="dropdown-toggle title_nav"><i
									class="fa "></i><span class="menu-text">用户管理 </span><b
									class="arrow fa fa-angle-down"></b>
								</a>
							</dt>
							<dd class="submenu Border_line" style="">
								<ul>
									<li class="home"><a href="javascript:void(0)"
										name="user_list.jsp" title="用户列表"
										class="iframeurl"><i class="fa fa-angle-double-right"></i>用户列表</a>
									</li>
								</ul>
							</dd>
						</dl>
					</div>
				</div>
			</div>
		</div>
		<!--内容-->
		<div class="Sellerber_content" id="contents">
			<div class="pop-box">
				<div class="log-box">
					<p class="welcome">修改密码</p>
					<dl class="log-dl">
						<dd class="pw">
							<input value="" type="password" id="old_password"
								placeholder="旧密码">
						</dd>
						<dd class="pw">
							<input value="" type="password" id="new_password"
								placeholder="新密码">
						</dd>
						<dd class="pw">
							<input value="" type="password" id="new_password_repeat"
								placeholder="再次输入">
						</dd>
						<dd class="btnbox bg-red" id="operation_1"
							onclick="submitResetPassword()">确认修改</dd>
						<dd class="btnbox bg-red" id="operation_2" style="display: none;">正在处理....</dd>
					</dl>
					<div class="r-close">
						<i class="fa fa-close"></i>
					</div>
				</div>
			</div>
			<div class="breadcrumbs" id="breadcrumbs">
				<a id="js-tabNav-prev" class="radius btn-default left_roll"
					href="javascript:;"><i class="fa fa-backward"></i>
				</a>
				<div class="breadcrumb_style clearfix">
					<ul class="breadcrumb clearfix" id="min_title_list">
						<li class="active home"><span title="我的桌面"
							data-href="bindCompany.jsp?Mid=201807300001"><i
								class="fa fa-home home-icon"></i>绑定审核</span>
						</li>
					</ul>
				</div>
				<a id="js-tabNav-next" class="radius btn-default right_roll"
					href="javascript:;"><i class="fa fa-forward"></i>
				</a>
				<div class="btn-group radius roll-right">
					<a class="dropdown tabClose" data-toggle="dropdown"
						aria-expanded="false">页签操作<i class="fa fa-caret-down"
						style="padding-left: 3px;"></i>
					</a>
					<ul class="dropdown-menu dropdown-menu-right" id="dropdown_menu">
						<li><a class="tabReload" href="javascript:void(0);">刷新当前</a>
						</li>
						<!-- <li><a class="tabCloseCurrent" href="javascript:void(0);">关闭当前</a></li> -->
						<li><a class="tabCloseAll" href="javascript:void(0);">全部关闭(首页)</a>
						</li>
						<li><a class="tabCloseOther" href="javascript:void(0);">除此之外全部关闭</a>
						</li>
					</ul>
				</div>
				<a href="javascript:void()" class="radius roll-right fullscreen"><i
					class="fa fa-arrows-alt"></i>
				</a>
			</div>
			<!--具体内容-->
			<div id="iframe_box" class="iframe_content">
				<div class="show_iframe index_home" id="show_iframe">
					<iframe scrolling="yes" class="simei_iframe" frameborder="0"
						src="bindCompany.jsp?Mid=201807300001" name="iframepage"
						data-href="bindCompany.jsp?Mid=201807300001"></iframe>
				</div>
			</div>
		</div>
		<!--底部-->
		<div class="Sellerber_bottom info" id="bottom">
			<span class="l_f">版权所有：广东中科天中工业物联网有限公司</span> <span id="time"
				class="r_f"></span>
		</div>
	</div>
</body>
<script>
/*if (adminCode == "" || adminCode == "null" || adminCode == null) {
	//window.location.href = "login.jsp";
	window.location.href = "login-or.jsp";
}*/
//设置框架
$(function() {
	var data = {files: [] };
   /* var arrDel=[];
    var sto2=JSON.stringify(role); 
    var roleNew=JSON.parse(sto2);
    for (var i = 0;i<roleNew.ztmodulInfo.length;i++) {
        var dataInfo=roleNew.ztmodulInfo[i],str="";
        for(var key in dataInfo){
            if(!dataInfo[key]){
                dataInfo[key]="";
            }
        }
        if ($.inArray(dataInfo.parentCode, arrDel)<0) {
            data.files.push({id:dataInfo.parentCode, pid:'0', icon:'', url:'#', title:dataInfo.parentName});
            arrDel.push(dataInfo.parentCode);
        }
        data.files.push({id:(i+100), pid:dataInfo.parentCode, icon:'', url:dataInfo.module_url+'?Mid='+dataInfo.moduleId, title:dataInfo.moduleName});
    }*/
    data={"files":[{"id":"7","pid":"0","icon":"","url":"#","title":"权限管理"},{"id":100,"pid":"7","icon":"","url":"equipmentType.jsp?Mid=201810190001","title":"类别信息"},{"id":"6","pid":"0","icon":"","url":"#","title":"用户管理"},{"id":101,"pid":"6","icon":"","url":"bindCompany.jsp?Mid=201807300001","title":"用户绑定"},{"id":102,"pid":"6","icon":"","url":"companyList.jsp?Mid=201807260001","title":"公司列表"},{"id":103,"pid":"7","icon":"","url":"warehouse.jsp?Mid=201809300001","title":"仓库管理"},{"id":104,"pid":"6","icon":"","url":"vehicleFiles_list.jsp?Mid=201809030001","title":"车辆档案"},{"id":105,"pid":"7","icon":"","url":"admin_list.jsp?Mid=201807300002","title":"员工列表"},{"id":106,"pid":"7","icon":"","url":"modular.jsp?Mid=201807240002","title":"模块列表"},{"id":107,"pid":"7","icon":"","url":"ability.jsp?Mid=201807240003","title":"功能列表"},{"id":108,"pid":"7","icon":"","url":"operateLog.jsp?Mid=201810090001","title":"操作记录"},{"id":109,"pid":"6","icon":"","url":"role_cus.jsp?Mid=201808230001","title":"客户角色管理"}]};
	$("#Sellerber").frame({
		float : 'left',
		color_btn:'.skin_select',//伸缩按钮
		logo_img:'images/ztlogo.png',//logo地址链接
		header:0,//顶部高度
		bottom:30,//底部高度
		menu:200,//菜单栏宽度
		Sellerber_menu:'.list_content', //左侧栏目
		Sellerber_header:'.Sellerber_header',//顶部栏目	
	},data); 
	
	$(".nav_link:eq(0),.nav-list li:eq(0)").click();
	$("#Exit_system").on("click", function(){
	    layer.confirm('是否确定退出系统？', {
	     	btn: ['是','否'] ,//按钮
		 	icon:2,
	    }, 
		function(){
		  	location.href="login-or.jsp";
	    });
	});
});
function interactive(obj){//车辆档案树形图切换jq
	if($(obj).parents("li").children(".eggs:first").length>0&&$(obj).data("biu")==undefined||$(obj).data("biu")==2){//展开
		$(obj).data("biu",1).removeClass("fa-angle-down").addClass("fa-angle-up");
		$(obj).parents("li:first").addClass("active open").children(".eggs:first").fadeToggle();
	}else{//关闭
		$(obj).data("biu",2).removeClass("fa-angle-up").addClass("fa-angle-down");
		$(obj).parents("li:first").removeClass("active open").children(".eggs:first").fadeToggle();
	}
}
//个人信息
function userBtn(){
	if($(".mmul").css("display")=="none"){
		$(".mmul").css("display","block");
	}else{
		$(".mmul").css("display","none");
	}
	$("#userName").text(adminName); 
	/* layer.confirm('是否确定切换账户？', {
     	btn: ['是','否'] ,//按钮
	 	icon:2,
    }, 
	function(){
	  	location.href="login_to.jsp";
    });
	$("#userName").text(username); */ 
}

function pasModify(){
	$(".pop-box").css("display","block");
}

//修改密码
function submitResetPassword() {
	var oldPassword = document.getElementById("old_password").value;
	var newPassword = document.getElementById("new_password").value;
	var newPasswordRepeat = document.getElementById("new_password_repeat").value;
	if ("" == oldPassword) {
		//提示
		layer.msg("【原始密码】不能为空");
		document.getElementById("old_password").focus();
		return;
	} else if ("" == newPassword) {
		//提示
		layer.msg("【新密码】不能为空");
		document.getElementById("new_password").focus();
		return;
	} else if ("" == newPasswordRepeat) {
		//提示
		layer.msg("【确认密码】不能为空");
		document.getElementById("new_password_repeat").focus();
		return;
	}
	if (newPassword != newPasswordRepeat) {
		//提示
		layer.msg("【新密码】与【确认密码】不一致");
		return;
	}
	/* var url = "../service?cmd=resetPassword&username=" + encodeURIComponent(encodeURIComponent(username)) + "&oldPassword=" + encodeURIComponent(encodeURIComponent(oldPassword)) + "&newPassword=" + encodeURIComponent(encodeURIComponent(newPassword)); */
	var url = "../adminInfo1/modifyPwd.do?adminCode=" + encodeURIComponent(encodeURIComponent(adminCode)) + "&oldPwd=" + encodeURIComponent(encodeURIComponent(oldPassword)) + "&pwd=" + encodeURIComponent(encodeURIComponent(newPassword));
	console.log(url);
	var xmlHttp = getXMLHttp();
	xmlHttp.open("POST", url, true);
	xmlHttp.send();
	xmlHttp.onreadystatechange = function() {
		if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
			//				alert(xmlHttp.responseText);
			var result = eval("(" + xmlHttp.responseText + ")");
			//console.log(result);
			if (0 == result.status) {
				//提示
				layer.msg("修改密码成功！");
				setTimeout(function(){
					window.location.href = "login-or.jsp";
				},1000);//2秒后执行该方法
			} else {
				layer.msg(result.msg);
			}
		} else {

		}
		document.getElementById("operation_1").style.display = "block";
		document.getElementById("operation_2").style.display = "none"
	}
	document.getElementById("operation_1").style.display = "none";
	document.getElementById("operation_2").style.display = "block"
}

$(".fa-close").on("click", function(){
	$(".pop-box").css("display","none");
});

//清除所有cookie函数  
function clearAllCookie() {  
    var keys = document.cookie.match(/[^ =;]+(?=\=)/g);  
    if(keys) {  
        for(var i = keys.length; i--;)  
            document.cookie = keys[i] + '=0;expires=' + new Date(0).toUTCString()  
    }  
}  

//时间设置
  function currentTime(){ 
   var weekday=new Array(7)
	weekday[0]="星期一"
	weekday[1]="星期二"
	weekday[2]="星期三"
	weekday[3]="星期四"
	weekday[4]="星期五"
	weekday[5]="星期六"
	weekday[6]="星期日"	
    var d=new Date(),str='';
    var day = d.getDay();
    if(day==0){
    	day = 6;
    }else{
    	day-=1;
    }
    str+=d.getFullYear()+'年'; 
    str+=d.getMonth() + 1+'月'; 
    str+=d.getDate()+'日'; 
    str+=d.getHours()+'时'; 
    str+=d.getMinutes()+'分'; 
    str+=d.getSeconds()+'秒'+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
	str+=weekday[day]; 
    return str;
} 
setInterval(function(){$('#time').html(currentTime)},1000); 

$("#menu_style").niceScroll({  
	cursorcolor:"#888888",  
	cursoropacitymax:1,  
	touchbehavior:false,  
	cursorwidth:"5px",  
	cursorborder:"0",  
	cursorborderradius:"5px"  
});
</script>
<script type="text/javascript" src="js/echarts.js"></script>
</html>
