<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="./js/jquery-1.7.1.min.js"></script>
<title>JSON AJAX TEST</title>
<script type="text/javascript">
function getMyUserList() {
	var url = 'json/getMyUserList.action';
	var params = {
	};
	$.post(url, params, function(data) {
		console.log(data);
		alert(data);
		for (var i = 0; i < data.length; i++) {
			console.log(data[i].id + ";" + data[i].password + ";" + data[i].username);
		}
	});
	//}, 'json');
}

function getMyUserMap() {
	var url = 'json/getMyUserMap.action';
	var params = {
	};
	$.post(url, params, function(data) {
		console.log(data);
		alert(data);
		for (var o in data) {
			console.log(data[o].id + ";" + data[o].password + ";" + data[o].username);
		}
	}, 'json');
}
</script>
</head>
<body style="margin: 20px;" mce_style="margin: 20px;">
<h3>json ajax test</h3>
<ul>
	<li><a href="#" onclick="getMyUserList()">JSON#getMyUserList</a></li>
	<li><a href="#" onclick="getMyUserMap()">JSON#getMyUserMap</a></li>
</ul>
</body>
</html>