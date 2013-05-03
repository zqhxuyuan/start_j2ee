<%@ page language="java" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Struts2+JQuery+JSON</title>
<script type="text/javascript" src="<%=path %>/js/jquery-1.7.1.min.js"></script>
<script type="text/javascript">	
function getMyUserList() {
	var url = 'returnList.action';
	var params = {
	};
	$.post(url, params, function(data) {
		for (var i = 0; i < data.length; i++) {
			console.log(data[i].id + ";" + data[i].password + ";" + data[i].username);
		}
	});
}

function getMyUserMap() {
	var url = 'returnMap.action';
	var params = {
	};
	$.post(url, params, function(data) {
		for (var o in data) {
			console.log(data[o].id + ";" + data[o].password + ";" + data[o].username);
		}
	}, 'json');
}

$(document).ready(function(){
	//获取单个值
	$("#getMessage").click(function(){
		/**
		$.getJSON("jsonPluginTest!returnMessage.action",function(data){
			$("#message").html("<font color='red'>"+data.message+"</font>"); //通过.操作符可以从data.message中获得Action中message的值
		});
		$.post("jsonPluginTest!returnMessage.action", null, function(data) {
			$("#message").html("<font color='red'>"+data.message+"</font>");
		}, 'json');
		$.post("jsonPluginTest!returnMessage.action", null, function(data) {
			$("#message").html("<font color='red'>"+data.message+"</font>");
		});
		*/
		$.ajax({
			url: 'jsonPluginTest!returnMessage.action',
			type: 'post',
			dataType: 'json',
			data:{},
			success: function(data){
				$("#message").html("<font color='red'>"+data.message+"</font>");
			}
		});
	});
 
	//获取UserInfo对象  为显示层添加获取到的数据 获取对象的数据用data.userInfo.属性
	$("#getUserInfo").click(function(){
		$.getJSON("jsonPluginTest!returnUserInfo.action",function(data){
			$("#message").html("");
			$("#message").append("<div><font color='red'>用户ID："+data.userInfo.id+"</font></div>")
			  .append("<div><font color='red'>用户名："+data.userInfo.username+"</font></div>")
			  .append("<div><font color='red'>密码："+data.userInfo.password+"</font></div>")
		});
	});
 
	//获取List对象  使用jQuery中的each(data,function(){});函数 从data.userInfosList获取UserInfo对象放入value之中
	$("#getList").click(function(){
		$.getJSON("jsonPluginTest!returnList.action",function(data){
			$("#message").html("");
			$.each(data.userList,function(i,value){
				$("#message").append("<div>第"+(i+1)+"个用户：</div>")
					.append("<div><font color='red'>用户ID："+value.id+"</font>")
					.append("<font color='red'>用户名："+value.username+"</font>")
					.append("<font color='red'>密码："+value.password+"</font></div>");
			});
		});
	});
 
	//为获取Map对象
	$("#getMap").click(function(){
		$.getJSON("jsonPluginTest!returnMap.action",function(data){
			$("#message").html("");
			$.each(data.userMap,function(key,value){
				$("#message").append("<div>第"+(key+1)+"个用户：</div>")
					.append("<div><font color='red'>用户ID："+value.id+"</font>")
					.append("<font color='red'>用户名："+value.username+"</font>")
					.append("<font color='red'>密码："+value.password+"</font></div>");
			});
		});
	});

	//向服务器发送表单数据: 使用jQuery中的$.ajax({});Ajax方法提交表单，success的回调函数不是必须的
	//提交方式2：直接将链接写在form标签里：<form action="jsonPluginTest!gainUserInfo.action" method="post">
	$("#reg").click(function(){
		var params = $("form").serialize();	//把表单的数据进行序列化.即form中输入域name的值会传递到Action
		$.ajax({
			url:"jsonPluginTest!gainUserInfo.action",
			type:"POST",
			data:params,
			//dataType:"json", 
			success:function(data){
				$("#message").html("");
				$("#message").append("<div><font color='red'>用户名："+data.userInfo.username+"</font></div>")
				  .append("<div><font color='red'>密码："+data.userInfo.password+"</font></div>")
			}
		});
	});

});



function jsonTest1(){
	$.getJSON("jsonTest!jsonTest1.action",function(data){
		console.log(data.id+"  "+data.username);
	});
}
function jsonTest2(){
	$.getJSON("jsonTest!jsonTest2.action",function(data){
		console.log(data.id+"  "+data.username);
	});
}
function jsonTest3(){
	$.getJSON("jsonTest!jsonTest3.action",function(data){
		console.log(data.id+"  "+data.username);
	});
}
function jsonTest4(){
	$.getJSON("jsonTest!jsonTest4.action",function(data){
		console.log(data.id+"  "+data.username);
	});
}
</script>
</head>
<body>
	<ul>
		<li><a href="#" onclick="getMyUserList()">JSON#getMyUserList</a></li>
		<li><a href="#" onclick="getMyUserMap()">JSON#getMyUserMap</a></li>
	</ul>

    <input id="getMessage" type="button" value="获取单个值"/>&nbsp;&nbsp;
    <input id="getUserInfo" type="button" value="获取UserInfo对象"/>&nbsp;&nbsp;
    <input id="getList" type="button" value="获取List对象"/>&nbsp;&nbsp;
    <input id="getMap" type="button" value="获取Map对象"/>&nbsp;&nbsp;
    <br><br>
    
    <div id="message"></div>
    
    <form>
    	名字：<input name="userInfo.username" type="text"/><br/>
    	密码：<input name="userInfo.password" type="password"/><br>
    	<input id="reg" type="button" value="注册"/>
    </form>
    
    <!--
    <form action="jsonPluginTest!gainUserInfo.action" method="post">
    	用户ID：<input name="userInfo.id" type="text"/><br/>
    	名字：<input name="userInfo.username" type="text"/><br/>
    	密码：<input name="userInfo.password" type="text"/><br>
    	<input id="regRe" type="submit" value="注册"/>
    </form>
    -->
    
    <p>
    <input type="button" value="使用JSON转换工具--直接输出" onclick="jsonTest1()">
    <input type="button" value="使用JSON转换工具--跳转输出" onclick="jsonTest2()">
    <p>
    <input type="button" value="使用JSON转换工具--自定义返回类型--生成JSONObject" onclick="jsonTest3()">
    <input type="button" value="使用JSON转换工具--自定义返回类型--直接生成JSON" onclick="jsonTest4()">
</body>
</html>
