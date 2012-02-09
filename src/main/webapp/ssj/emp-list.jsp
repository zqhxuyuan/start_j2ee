<%@ page language="java" contentType="text/html; charset=UTF8" pageEncoding="UTF8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SSJ Example</title>
</head>
<body>
<h3>List Persons</h3>
<s:iterator value="persons">
	<s:url action="editEmp" id="editUrl">
		<s:param name="emplid" value="emplid"/>
	</s:url>
	<s:url action="deleteEmp" id="deleteUrl">
		<s:param name="emplid" value="emplid"/>
	</s:url>
	<p>
		<s:property />  
		<a href="<s:property value="#editUrl"/>">Edit</a> &nbsp;&nbsp; 
		<a href="<s:property value="#deleteUrl"/>">Delete</a>
	</p>
</s:iterator>
</body>
</html>