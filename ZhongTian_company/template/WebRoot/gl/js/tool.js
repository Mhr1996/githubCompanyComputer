var tool={
	p:1,
	pn:0,
	getUrlStringId: function (name) {//用法 tool.getUrlStringId("地址栏参数名");
		var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
		var r = window.location.search.substr(1).match(reg);
		if(r!=null)return  decodeURI(r[2],'utf-8'); return null;
	},
	Verification:function($parameter){//需要layer.js
		var statusver=true;
		var	code=$parameter.val().trim();
		switch ($parameter.attr("Fv")) {
	        case ("1")://身份证
	        	var city={11:"北京",12:"天津",13:"河北",14:"山西",15:"内蒙古",21:"辽宁",22:"吉林",23:"黑龙江 ",31:"上海",32:"江苏",33:"浙江",34:"安徽",35:"福建",36:"江西",37:"山东",41:"河南",42:"湖北 ",43:"湖南",44:"广东",45:"广西",46:"海南",50:"重庆",51:"四川",52:"贵州",53:"云南",54:"西藏 ",61:"陕西",62:"甘肃",63:"青海",64:"宁夏",65:"新疆",71:"台湾",81:"香港",82:"澳门",91:"国外 "};
			    var tip = "";
			    var pass= true;
			    if(!code || !/^\d{6}(18|19|20)?\d{2}(0[1-9]|1[12])(0[1-9]|[12]\d|3[01])\d{3}(\d|X)$/i.test(code)){
			        tip = "身份证号格式错误";
			        pass = false;
			    }
			    else if(!city[code.substr(0,2)]){
			        tip = "地址编码错误";
			        pass = false;
			    }
			    else{
			        //18位身份证需要验证最后一位校验位
			        if(code.length == 18){
			            code = code.split('');
			            //加权因子
			            var factor = [ 7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2 ];
			            //校验位
			            var parity = [ 1, 0, 'X', 9, 8, 7, 6, 5, 4, 3, 2 ];
			            var sum = 0;
			            var ai = 0;
			            var wi = 0;
			            for (var i = 0; i < 17; i++)
			            {
			                ai = code[i];
			                wi = factor[i];
			                sum += ai * wi;
			            }
			            var last = parity[sum % 11];
			            if(parity[sum % 11] != code[17]){
			                tip = "身份证号错误";
			                pass =false;
			            }
			        }
			    }
			    if(!pass) {layer.msg(tip);statusver=false;}
			    
	            break;
	        case ("2")://手机号
	        	var re=/^1[0-9]{10}$/;
	        	if (!re.test(code)) {layer.msg("手机号格式不正确");statusver=false;}
	            break;
	        case ("3")://车牌
	        	var re=/^[\u4e00-\u9fa5]{1}[A-Z]{1}[A-Z_0-9]{5}$/;
	        	if (!re.test(code)) {layer.msg("车牌号格式不正确");statusver=false;}
	            break;
	        case ("4")://数字
	        	if (isNaN(code)) {layer.msg("格式为数字格式");statusver=false;}
	            break;
	        case ("5")://姓名
	        	var re=/^[\u4e00-\u9fa5]{2,4}$/;
	        	if (!re.test(code)) {layer.msg("姓名格式不正确");statusver=false;}
	            break;
	        case ("6")://邮箱
	        	var re=/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
	        	if (!re.test(code)) {layer.msg("邮箱格式不正确");statusver=false;}
	            break;
	        case("7"):
	        	var rePhone = /^(0[0-9]{2,3}[-]{0,1})?[0-9]{7,8}$/;
	        	var reTel=/^1[0-9]{10}$/;
	        	if (!reTel.test(code)&&!rePhone.test(code)) {layer.msg("电话号码格式不正确");statusver=false;}
	            break;
	        case("8"):
	        	var chinese = /[^\u4e00-\u9fa5]/;
	        	if (!chinese.test(code)) {layer.msg("请输入非中文字符");statusver=false;}
	            break;
	        case("9"):
	        	var character = /[\\/'"]/;
	        	if (character.test(code)||code=="") {layer.msg("不能为空，不能添加特殊字符");statusver=false;}
	            break;
	        case ("101")://文本框可以为空，不为空时验证手机号
	        	var re=/^1[0-9]{10}$/;
	        	if (code!="") {
	        		if (!re.test(code)) {layer.msg("手机号格式不正确");statusver=false;}
	        	}
	            break;
	        case ("102")://文本框可以为空，不为空时验证电话号码
	        	var rePhone = /^(0[0-9]{2,3}[-]{0,1})?[0-9]{7,8}$/;
	        	var reTel=/^1[0-9]{10}$/;
	        	if (code!="") {
	        		if (!reTel.test(code)&&!rePhone.test(code)) {layer.msg("电话号码格式不正确");statusver=false;}
	        	}
	            break;
	        default://为空
	        	if(!code){layer.msg($parameter.attr("FvInfo"));statusver=false;};
	    }
	    !statusver ? $parameter.focus() : "";
	    return statusver;
	},
	formVerification:function(){
		var zhen=false;
		var Fv=$("input[Fv]");
		for (var i = 0; i < Fv.length; i++) {
			if (!tool.Verification(Fv.eq(i))) {
				break;
			}
			i==Fv.length-1 ? zhen=true : zhen=false;
		}
		return zhen;
	},
	formatDate:function(date,ymd) {
		if(date==""||date==null){return ""; }
		date=new Date(date);
		var year = date.getFullYear();
		var month = date.getMonth() + 1;
		var day = date.getDate();
		var hour = date.getHours();             
		var minute = date.getMinutes();
		var second = date.getSeconds();
		if (10 > month) {
			month = "0" + month;
		}
		if (10 > day) {
			day = "0" + day;
		}
		if (10 > hour) {
			hour = "0" + hour;
		}
		if (10 > minute) {
			minute = "0" + minute;
		}
		if (10 > second) {
			second = "0" + second;
		}
		if(ymd=="ss"){
			return year + "-" + month + "-" + day+ " " + hour+ ":" + minute + ":" + second;
		}else if(ymd) {
			return year + "-" + month + "-" + day;
		}else{
			return year + "-" + month + "-" + day+ " " + hour+ ":" + minute;
		}
		//return year + "-" + month + "-" + day+ " " + hour+ ":" + minute+ ":" + second;
	},
	generateCompareTRs:function(iCol, sDataType) {
         return  function  compareTRs(oTR1, oTR2) {
            vValue1 = tool.convert(oTR1.cells[iCol].firstChild.nodeValue, sDataType);
            vValue2 = tool.convert(oTR2.cells[iCol].firstChild.nodeValue, sDataType);
             if  (vValue1 < vValue2) {
                 return  -1;
            }  else   if  (vValue1 > vValue2) {
                 return  1;
            }  else  {
                 return  0;
            }
        };
    },
	convert:function(sValue, sDataType) {
         switch  (sDataType) {
         case   "int" :
             return  parseInt(sValue);
         case   "float" :
         	 if (sValue.trim()=="") {sValue=0}
             return  parseFloat(sValue);
         case   "date" :
             return   new  Date(Date.parse(sValue));
         default :
             return  sValue.toString();
        }
    },
	orderByName:function(objs,sTableID, iCol, sDataType){
		var objstatus=$(objs).children();
		if (objstatus.hasClass("active")) {
			objstatus.removeClass("active");
		}else{
			objstatus.addClass("active");
		}
		/*if(objstatus.children().eq(0).hasClass("fa2")){
			objstatus.children().eq(0).addClass("fa1")
			objstatus.children().eq(0).removeClass("fa2")
			objstatus.children().eq(1).addClass("fa2")
			objstatus.children().eq(1).removeClass("fa1")
		}else{
			objstatus.children().eq(0).addClass("fa2")
			objstatus.children().eq(0).removeClass("fa1")
			objstatus.children().eq(1).addClass("fa1")
			objstatus.children().eq(1).removeClass("fa2")
		}*/

		var  oTable = document.getElementById(sTableID);
		var  oTBody = oTable.tBodies[0];
		var  colDataRows = oTBody.rows;
		var  aTRs =  new  Array;
		for  (  var  i = 0; i < colDataRows.length; i++) {
			aTRs[i] = colDataRows[i];
		}
		if  (oTable.sortCol == iCol) {
			aTRs.reverse();
		}  else  {
			aTRs.sort(tool.generateCompareTRs(iCol, sDataType));
		}
		var  oFragment = document.createDocumentFragment();
		for  (  var  j = 0; j < aTRs.length; j++) {
			oFragment.appendChild(aTRs[j]);
		}
		oTBody.appendChild(oFragment);
		oTable.sortCol = iCol;
	},
	officeClerk:function(title,url,w,h){
		layer_show(title,url,w,h);
	},tableDrag:function(tableId){
		var tTD; //用来存储当前更改宽度的Table Cell,避免快速移动鼠标的问题   
		var table = document.getElementById(tableId);   
		console.log(document.getElementById(tableId));
		for (j = 0; j < table.rows[0].cells.length; j++) {   
			table.rows[0].cells[j].onmousedown = function () {  //记录单元格 
				tTD = this;   
				if (event.offsetX > tTD.offsetWidth - 10) {   
					tTD.mouseDown = true;   
					tTD.oldX = event.x;   
					tTD.oldWidth = tTD.offsetWidth;   
				}       
			};   
			table.rows[0].cells[j].onmouseup = function () {   //结束宽度调整   
				if (tTD == undefined) tTD = this;   
				tTD.mouseDown = false;   
				tTD.style.cursor = 'default';   
			};   
			table.rows[0].cells[j].onmousemove = function () {   //更改鼠标样式
				if (event.offsetX > this.offsetWidth - 10)   
					this.style.cursor = 'col-resize';   
				else   
					this.style.cursor = 'default';   
				//取出暂存的Table Cell   
				if (tTD == undefined) tTD = this;   
				//调整宽度   
				if (tTD.mouseDown != null && tTD.mouseDown == true) {   
					tTD.style.cursor = 'default';   
					if (tTD.oldWidth + (event.x - tTD.oldX)>0)   
					tTD.width = tTD.oldWidth + (event.x - tTD.oldX);   
					//调整列宽   
					tTD.style.width = tTD.width;   
					tTD.style.cursor = 'col-resize';   
					//调整该列中的每个Cell   
					table = tTD; while (table.tagName != 'TABLE') table = table.parentElement;   
					for (j = 0; j < table.rows.length; j++) {   
						table.rows[j].cells[tTD.cellIndex].width = tTD.width;   
					}     
				}   
			}
		}   
	},
	retainDecimal:function(num){//保留3位小数，没有小数则返回原本数值
		if (num==""||num==null) {num=0}
		var ex = /^\d+$/;
		return !ex.test(Number(num)) ?Number(num).toFixed(2)*1000/1000:num;
	}
}

//调用tool.js  用法为：tool.方法名();