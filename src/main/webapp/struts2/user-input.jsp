<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Input Form</title>
</head>
<body>
<s:form action="User" >
	<s:textfield name="name" label="User Name" />
	<s:textfield name="age" label="Age" />
	<s:radio name="sex" label="Sex" list="{'M','F'}" />
	<s:checkboxlist name="hobby" label="Hobby" list="{'Music','Art','Dance'}" />
	<s:select name="country" label="Country" list="{'Select','India','USA','France', 'Spain'}"  />
	<s:submit />
</s:form>
</body>
</html>