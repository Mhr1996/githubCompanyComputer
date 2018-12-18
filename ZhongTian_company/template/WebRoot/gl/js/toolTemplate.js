/*
 * 设置Cookie
 * */
function setCookie(key, value, expiredays) {
	var date = new Date();
	date.setDate(date.getDate() + expiredays);
	document.cookie = key + "=" + escape(value) + ((expiredays == null) ? "" : ";expires=" + date.toGMTString());
}

/*
 * 获取Cookie
 */
function getCookie(key) {
	key = encodeURI(encodeURI(key));
	if (document.cookie.length > 0) {
		var keyStart = document.cookie.indexOf(key + "=");
		if (keyStart != -1) {
			keyStart = keyStart + key.length + 1;
			keyEnd = document.cookie.indexOf(";", keyStart);
			if (keyEnd == -1) {
				keyEnd = document.cookie.length;
			}
			return decodeURI(document.cookie.substring(keyStart, keyEnd));
		}
	}
	return ""
}

/*
 * 获取XMLHttpRequest
 */
function getXMLHttp() {
	var xmlhttp;
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	return xmlhttp;
}
