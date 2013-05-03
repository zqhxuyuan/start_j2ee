<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!-- <uri="http://www.opensymphony.com/oscache" prefix="oscache" %> -->
<%@ taglib uri="oscache" prefix="cache"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>OSCache Demo</title>
</head>
<body>

自动刷新，没有缓存的日期: <%=new Date()%><p> 

<cache:cache time="30">  
	每30秒刷新缓存一次的日期: <%=new Date()%>  
</cache:cache>
<p> 

<cache:cache key="testcache">  
	手动刷新缓存的日期: <%=new Date()%><p>  
</cache:cache><a href="cache2.jsp">手动刷新</a><p>

<oscache:cache key="name">
 	name=${param.name}
</oscache:cache>

</body>
</html>