///////////////////////////////////////////////////////////
var idTmr;
var pageNum = 10;
function  getExplorer() {
//alert("888");
	var explorer = window.navigator.userAgent ;
	//ie 
	if (explorer.indexOf("MSIE") >= 0) {
		return 'ie';
	}
	//firefox 
	else if (explorer.indexOf("Firefox") >= 0) {
		return 'Firefox';
	}
	//Chrome
	else if(explorer.indexOf("Chrome") >= 0){
		return 'Chrome';
	}
	//Opera
	else if(explorer.indexOf("Opera") >= 0){
		return 'Opera';
	}
	//Safari
	else if(explorer.indexOf("Safari") >= 0){
		return 'Safari';
	}
}
function exportExcel(tableid){
	//var obj = document.getElementsByTagName("excel");
	var obj = document.getElementsByTagName("tr");
	//for(var n=0; n<obj.length; n++){    	if($("#tableExcel").find("#allChecked")){$("#tableExcel").find("[name=checkedItem]").eq(n).parent().hide();$("#tableExcel").find("#allChecked").parent().hide()}}
    for(var i=0; i<obj.length; i++){
    	$("tr").each(function(k){
    		if($("tr").eq(k+1).css("background-color") == "rgb(230, 242, 254)"){
    			$("tr").eq(k+1).css("background-color","");
    		}
    	});
        if(!obj[i].checked){
            //alert(obj[i].value);
        	if(obj[i].value!="one"){
        		//alert("one");
        		if(getExplorer()=='ie')
    			{
    				var curTbl = document.getElementById(tableid);
    				var oXL = new ActiveXObject("Excel.Application");
    				
    				//创建AX对象excel 
    				var oWB = oXL.Workbooks.Add();
    				//获取workbook对象 
    				var xlsheet = oWB.Worksheets(1);
    				//激活当前sheet 
    				var sel = document.body.createTextRange();
    				sel.moveToElementText(curTbl);
    				//把表格中的内容移到TextRange中 
    				sel.select();
    				//全选TextRange中内容 
    				sel.execCommand("Copy");
    				//复制TextRange中内容  
    				xlsheet.Paste();
    				//粘贴到活动的EXCEL中       
    				oXL.Visible = true;
    				//设置excel可见属性

    				try {
    					var fname = oXL.Application.GetSaveAsFilename("Excel.xls", "Excel Spreadsheets (*.xls), *.xls");
    				} catch (e) {
    					print("Nested catch caught " + e);
    				} finally {
    					oWB.SaveAs(fname);

    					oWB.Close(savechanges = false);
    					//xls.visible = false;
    					oXL.Quit();
    					oXL = null;
    					//结束excel进程，退出完成
    					//window.setInterval("Cleanup();",1);
    					idTmr = window.setInterval("Cleanup();", 1);

    				}
    				
    			}
    			else
    			{
//alert("9999");
    				tableToExcel(tableid,"download.xls");
    			}
        	}else{
        		
        		//alert("123");
        		//alert("all");
        		loadordersAll();
        		if(getExplorer()=='ie')
    			{
    				var curTbl = document.getElementById(tableid);
    				var oXL = new ActiveXObject("Excel.Application");
    				
    				//创建AX对象excel 
    				var oWB = oXL.Workbooks.Add();
    				//获取workbook对象 
    				var xlsheet = oWB.Worksheets(1);
    				//激活当前sheet 
    				var sel = document.body.createTextRange();
    				sel.moveToElementText(curTbl);
    				//把表格中的内容移到TextRange中 
    				sel.select();
    				//全选TextRange中内容 
    				sel.execCommand("Copy");
    				//复制TextRange中内容  
    				xlsheet.Paste();
    				//粘贴到活动的EXCEL中       
    				oXL.Visible = true;
    				//设置excel可见属性

    				try {
    					var fname = oXL.Application.GetSaveAsFilename("Excel.xls", "Excel Spreadsheets (*.xls), *.xls");
    				} catch (e) {
    					print("Nested catch caught " + e);
    				} finally {
    					oWB.SaveAs(fname);

    					oWB.Close(savechanges = false);
    					//xls.visible = false;
    					oXL.Quit();
    					oXL = null;
    					//结束excel进程，退出完成
    					//window.setInterval("Cleanup();",1);
    					idTmr = window.setInterval("Cleanup();", 1);

    				}
    				reloadorders();
    				
    			}
    			else
    			{
    				loadordersAll();
    				tableToExcel(tableid,"download.xls");
    				reloadorders();
    			}
        	}
        }
    }

	
	
	//alert("123");
	
	
	//整个表格拷贝到EXCEL中
	
	
}
function Cleanup() {
    window.clearInterval(idTmr);
    CollectGarbage();
}
var tableToExcel = (function() {
	  var uri = 'data:application/vnd.ms-excel;base64,',
	  template = '<html Content-Disposition="attachment" filename="downlaod.xls" xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml></head><body><table>{table}</table></body></html>',
		base64 = function(s) { return window.btoa(unescape(encodeURIComponent(s))) },
		format = function(s, c) {
			return s.replace(/{(\w+)}/g,
			function(m, p) { return c[p]; }) }
		return function(table, name ) {
		if (!table.nodeType) table = document.getElementById(table)
		var ctx = {worksheet: name || 'Worksheet', table: table.innerHTML}
		window.location.href = uri + base64(format(template, ctx))
	  }
	})()