<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Struts 2 - Welcome</title>
<s:head />
</head>
<body>
<b>[Hello World]</b>
<s:form action="hello">
  	<s:textfield name="userName" label="name" />
  	<s:submit value="Submit" />
</s:form>

<b>[ProcessForms]</b>
<a href="register.jsp">Please register</a>
<s:url action="registerInput" var="registerInputLink" />
<a href="${registerInputLink}">Or Click Here</a>
<br><br>

<b>[FormTags]</b>
<a href='<s:url action="edit" />' >Edit your infor</a>
<br><br>

<b>[WildcardMethod]</b>
	<a href='<s:url action="Person" />' >Person List</a>
<br><br>

<b>[Annotations]</b>
<a href="<s:url action='hello' />" >Get your hello.</a>
<a href="<s:url action='register-input' />" >Register(convention).</a>
<br><br>

<b>[Interceptors]</b>
<a href="<s:url action='logger' />" >Log Interceptor.</a>
<br><br>

<b>[ModelDriven]</b>
<a href="<s:url action='inputUser' />" >add user</a>
<br><br>

<b>[FileUpload]</b>
<s:form action="fileUpload" method="post" enctype="multipart/form-data" >
	<s:file name="userImage" label="User Image" />
	<s:submit value="Upload"/>
</s:form>

<b>[Struts2+Lucene3]</b>
<s:form action="articleSearch">
  	<s:textfield name="title" label="Article Title" />
  	<s:submit value="Search" />
</s:form>
<hr/>

<b>[Spring+JPA+Struts2]</b>
<s:form action="formEmp">
	<s:textfield name="emplid" label="Employee ID" />
	<s:submit value="search"/>
</s:form>
<a href="<s:url action='Emp'/>">Find all employees</a>.
<a href="<s:url action='inputEmp'/>">Create new employee</a>.
</body>
</html>