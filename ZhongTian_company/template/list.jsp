<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String flag = request.getParameter("flag");
%>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<LINK rel="Bookmark" href="/favicon.ico" >
<LINK rel="Shortcut Icon" href="/favicon.ico" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<script type="text/javascript" src="lib/PIE_IE678.js"></script>
<![endif]-->
<link href="css/H-ui.min.css" rel="stylesheet" type="text/css" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="js/pagenav.cn.js"></script>
<%@include file="common.jspf" %>
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>标题</title>
</head>
<body>
<div class="pd-20 permissionsQuery">
		<div class="text-c" style="overflow: hidden;width:660px;margin:0 auto">
		<div class="text-c" style="overflow:hidden;float:left;margin-left: 10px;">
			日期范围：
			<input type="text" onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}'})" id="datemin" class="input-text Wdate" style="width:120px;">
			-
			<input type="text" onfocus="WdatePicker({minDate:'#F{$dp.$D(\'datemin\')}',maxDate:'%y-%M-%d'})" id="datemax" class="input-text Wdate" style="width:120px;">
		</div>
		<div class="text-c" style="overflow:hidden;float:left;margin-left:10px;">
            	<input type="text" class="input-text" style="width:200px" placeholder="车牌号" id="params" name="">
           </div>
		<button type="submit" class="btn btn-success" id="" name="" onclick="search()"><i class="Hui-iconfont">&#xe665;</i> 搜索</button>
	</div>
	
	<div class="cl pd-5 bg-1 bk-gray mt-20"> 
		<a href="javascript:;" onclick="openWeb('添加','taskRelease_edit.jsp','700','500')" class="btn btn-primary radius permissionsAdd">
			<i class="Hui-iconfont">&#xe600;</i> 添加
		</a>
		<a href="javascript:;" onclick="_edit('编辑','taskRelease_edit.jsp','900','500')" class="btn btn-primary radius permissionsEdit"> 
			<i class="Hui-iconfont">&#xe6df;</i> 编辑 
		</a>
		<a href="javascript:;" onclick="_del()" class="btn btn-danger radius permissionsDel">
			<i class="Hui-iconfont">&#xe6e2;</i> 删除
		</a>
		<a href="javascript:;" class="btn btn-success radius export" onclick="exportExcelAfter()">导出</a>
		<span class="r">共有数据：<strong id="sum">0</strong> 条</span>
	</div>
	<table class="table table-border table-bordered table-bg">
		<thead>
			<tr class="text-c">
				<th>序号</th>
				<th>任务单号</th>
				<th>车牌</th>
				<th>司机姓名</th>
				<th>司机手机</th>
				<th>任务内容</th>
				<th>制单时间</th>
				<th>任务单状态</th>
			</tr>
		</thead>
		<tbody></tbody>
	</table>
	<div id="pageNav" class="pageNav"></div>
</div>
<script type="text/javascript" src="lib/layer/1.9.3/layer.js"></script> 
<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script> 
<script type="text/javascript" src="lib/My97DatePicker/WdatePicker.js"></script> 
<script type="text/javascript" src="js/H-ui.js"></script> 
<script type="text/javascript" src="js/tool.js"></script> 
<script type="text/javascript" src="js/H-ui.admin.js"></script> 
<script>
pageNav.go = function(p, pn) {
	document.getElementById("pageNav").innerHTML = this.nav(p, pn);
    if (this.fn != null) {
        this.fn(this.p, this.pn);
    };
	var params = $("#params").val();
    pageNav.pre="&lt;上一页";
    pageNav.next="下一页&gt;";
    pageNav.fn = function(p,pn){$("#pageinfo").text("当前页:"+p+" 总页: "+pn);};
    query(params,p);
}


pageNav.go2 = function(p, pn){
	document.getElementById("pageNav").innerHTML = this.nav(p, pn);
	if (this.fn != null) {
		this.fn(this.p, this.pn);
	};
	pageNav.pre="&lt;上一页";
	pageNav.next="下一页&gt;";
	pageNav.fn = function(p,pn){$("#pageinfo").text("当前页:"+p+" 总页: "+pn);};
}

var t={
	gloFlag:'<%=flag%>',
	pN:0
};

(function(){
	query("",1);
}());

function openWeb(title,url,w,h){
	url+=url.indexOf("?") > 0 ? "&p="+$("#pageNav b").text() : "?p="+$("#pageNav b").text();
	layer_show(title,url,w,h);
}


function _edit(title,url,wh,gh){
	$("tbody tr").each(function(i){
		if($("tbody tr").eq(i).css("background-color")=="rgb(230, 242, 254)"){
			var tr_=$("tbody tr").eq(i);
			layer_show(title,url+'?urlCode='+tr_.attr("Code")+'&p='+$("#pageNav b").text(),wh,gh);
			return false;
		}
	})
}

function _del(){
	$("tbody tr").each(function(i){
		if($("tbody tr").eq(i).css("background-color")=="rgb(230, 242, 254)"){
			var tr_=$("tbody tr").eq(i);
			layer.confirm('确认要删除吗？',function(){
				$.ajax({
					url:"../xxxxxxdo",
					type:"post",
					dataType:"json",
					data:{"taskCode":$("tbody tr").eq(i).attr("Code")},
					success:function(result){
						if(result.status==0){
							tr_.remove();
							layer.msg('已删除!');
							search();
						}
					},
					error:function(){
						layer.msg("服务器异常!");
					}
				})
			});
			return false;
		}
	})
}

function query(params,p){
	var datemin = $("#datemin").val();
	var datemax = $("#datemax").val();
	$.ajax({
		url:"../xxxxxxdo",
		type:"post",
		dataType:"json",
		data:{"params":params,"currentPageNum":p,"datemin":datemin,"datemax":datemax},
		success:function(result){
			$('tbody').html("");
			var num = result.data.totalNum;
			if(p==1){
				if(!num){
					num=0;
				}
				gloNum = num;
				document.getElementById("sum").innerText = eval(parseInt(num));
				t.pN=Math.round(num / 10 + 0.4);
				pageNav.go2(p,t.pN);
			}
			if(result.status==0){
				var  trStr="";
				for(var i=0; i<result.data.list.length; i++){
					var jishu=p>1?parseInt(10*(p-1))+i:i;
					var dIF=result.data.list[i];
					for(var key in dIF){
						if(!dIF[key]){
							dIF[key]="";
						}
				 	}

				 	var e6f2fe = i==0 ? "#e6f2fe" : "";
				 	var No =[parseInt(jishu)+1];
				 	trStr += '<tr id="tr'+i+'" class="text-c" style="background-color:'+e6f2fe+'" Code="'+dIF.id+'">'+
					'<td>'+No+'</td>'+
					'<td>'+dIF.id+'</td>'+
					'<td>'+dIF.name+'</td>'+
					'</tr>';
			 	}
			 	$("tbody").append(trStr);
			}
		},
		error:function(){
			layer.msg("服务器异常!");
		} 
	})
}

function search(p){
	var params = $("#params").val();
	if(!p){p=1};
	query(params,p);
}
</script>
</body>
</html>