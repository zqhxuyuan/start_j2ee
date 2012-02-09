<%@ page language="java" contentType="text/html; charset=UTF8" pageEncoding="UTF8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add Person</title>
</head>
<body>
<h3>Add Person</h3>
     <s:form action="saveEmp" method="post">
     	<s:textfield name="person.first_name" label="First name" />
     	<s:textfield name="person.last_name" label="Last name" />
     	<s:submit />
     </s:form>
</body>
</html>