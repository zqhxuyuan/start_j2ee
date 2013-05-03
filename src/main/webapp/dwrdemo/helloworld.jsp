<%@ page language="java" pageEncoding="UTF-8"%> 
<html> 
<head> 
<title>Hello DWR</title> 
<script type='text/javascript' src='../dwr/util.js'></script> 
<script type='text/javascript' src='../dwr/engine.js'></script>
<script type='text/javascript' src='../dwr/interface/helloworld.js'> 
</script> 
<script type="text/javascript"> 
function test(){ 
	helloworld.hello("Jorwen",callBackHello); 
} 
function callBackHello(data){ 
	alert(data); 
} 
</script> 
</head>
<body> 
	<input type="button" name="button" value="测试" onclick="test()"> 
</body> 
</html>