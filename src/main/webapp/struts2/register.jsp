<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Register</title>
<s:head />
</head>
<body>
<h3>Register for a prize by completing this form.</h3>

	<h3><s:text name="thankyou" /></h3>
	<s:form action="register">
 	  	<s:textfield name="personBean.firstName" label="First name" />
 	  	<s:textfield name="personBean.lastName" label="Last name" />
 	  	<s:textfield name="personBean.email"  label ="Email"/>
 	  	<s:textfield name="personBean.age"  label="Age"  />
   	  	<s:submit/>
	</s:form>

	<!--
	<s:form action="register">
 	  	<s:textfield key="personBean.firstName"/>
 	  	<s:textfield key="personBean.lastName"/>
 	  	<s:textfield key="personBean.email"/>
 	  	<s:textfield key="personBean.age"/>
   	  	<s:submit/>
	</s:form>
	-->
</body>
</html>