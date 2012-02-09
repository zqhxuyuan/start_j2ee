<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Struts Spring JPA Example</title>
<s:head />
</head>
<body>
<b>[Spring+JPA+Struts2]</b>
<s:form action="formEmp">
	<s:textfield name="emplid" label="Employee ID" />
	<s:submit value="search"/>
</s:form>
<a href="<s:url action='Emp'/>">Find all employees</a>.
<a href="<s:url action='inputEmp'/>">Create new employee</a>.

</body>
</html>