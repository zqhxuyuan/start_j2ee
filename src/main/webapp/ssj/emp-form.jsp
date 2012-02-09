<%@ page language="java" contentType="text/html; charset=UTF8" pageEncoding="UTF8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Display Person</title>
</head>
<body>
<h3>Display Person</h3>
<s:if test="person != null" >
     <s:form>
     	<s:textfield name="person.first_name" label="First name" />
     	<s:textfield name="person.last_name" label="Last name" />
     </s:form>
</s:if>
<s:else>
	<p>No person was found.</p>
</s:else>
</body>
</html>