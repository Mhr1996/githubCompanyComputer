<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String userCode = request.getParameter("userCode");
	String p = request.getParameter("p");
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
<link href="css/H-ui.admin.css" rel="stylesheet" type="text/css" />
<link href="lib/icheck/icheck.css" rel="stylesheet" type="text/css" />
<link href="lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="lib/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="js/H-ui.admin.js"></script> 
<%@include file="common.jspf" %>
<!--[if IE 6]>
<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>编辑</title>
</head>
<body style="overflow: scroll;overflow-x:hidden;">

<div class="pd-20 permissionsQuery">
	<form action="" method="post" class="form form-horizontal" id="form">
		<div class="row cl">
			<label class="form-label col-3">设备号：</label>
			<div class="formControls col-7">
				<input type="text" class="input-text" name="DeviceID" Fv="0" FvInfo="请填写设备号">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-3"><span class="c-red">*</span>仓库号：</label>
			<div class="formControls col-7">
				<select class="select-text" name="DispatchID" style="height:30px;width: 100%;border: solid 1px #ddd;">
			        <option value="tzgps">tzgps</option>
			        <option value="tzgps1">tzgps1</option>
			        <option value="tzgps2">tzgps2</option>
			        <option value="ceshi">ceshi</option>
		        </select>
			</div>
		</div>
		<div class="row cl" style="margin-left:15%;" id="submit">
			<div class="col-9 col-offset-3">
				<input class="btn btn-primary radius" type="button" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
			</div>
		</div>
	</form>
</div>
<script type="text/javascript" src="lib/icheck/jquery.icheck.min.js"></script> 
<script type="text/javascript" src="lib/layer/1.9.3/layer.js"></script> 
<script type="text/javascript" src="js/H-ui.js"></script> 
<script type="text/javascript" src="./js/tool.js"></script>
<script type="text/javascript">
var t={
	url:"../tab_Car_Info/addWareHouses.do",
	code:tool.getUrlStringId("urlCode")
};

(function(){
	$.ajax({
		url:"../carType/query.do",
		type:"post",
		dataType:"json",
		data:{"currentPageNum":1,"pageNum":999},
		async:false,
		success:function(r){
			if(r.status==0){
				var Str="";
				for(var i=0; i<r.data.list.length; i++){
					var dIF=r.data.list[i];
					for(var key in dIF){
						if(!dIF[key]){
							dIF[key]="";
						}
				 	}
				 	Str+="<option value='"+dIF.code+"'>"+dIF.name+"</optioin>";
				 	
			 	}
			 	$("select[name=type]").append(Str);
			}else{
				layer.msg(r.msg);
			}
		},
		error:function(){
			layer.msg("服务器异常!");
		} 
	})
	if (t.code!==null) {
		$.ajax({
			url:"../tab_Car_Info/query.do",
			type:"post",
			dataType:"json",
			async:false,
			data:{"params1":t.code},
			success:function(result){
				if(result.status==0){
					for(var i=0; i<result.data.list.length; i++){
						var d=result.data.list[i];
						for(var key in d){if(!d[key]){d[key]=""; } }
					 	tool.returnBack(d);
					}
				}
			},
			error:function(){
				layer.msg("服务器异常!");
			}
		})
	}
})()

$("#submit").on("click",function(){
	if (tool.formVerification()) {
		if (t.code!==null) {
			t.url="../tab_Car_Info/modifyWareHouses.do?id="+t.code;
		}
		$.ajax({
			url:t.url,
			type:"post",
			dataType:"json",
			data:$("#form").serialize(),
			success:function(result){ 
				if(result.status==0){
					layer.msg("提交成功");
					setTimeout(function(){
						parent.search(<%=p%>);
						parent.layer.closeAll();
					},1000);
				}else{
					layer.msg(result.msg);
				}
			},
			error:function(){
				layer.msg("服务器异常!");
			}
		})
	}
})
</script>
</body>
</html>