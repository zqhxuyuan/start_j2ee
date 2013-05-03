<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="oscache" prefix="cache"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>OSCache Demo</title>
</head>
<body>
	缓存已刷新...  <p>
	<cache:flush key="testcache" scope="application" /> 
	<a href="cache1.jsp">返回</a> 
</body>
</html>
