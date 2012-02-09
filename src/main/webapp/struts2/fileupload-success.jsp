<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>File Upload</title>
</head>
<body>
You have uploaded the following file.
<hr>
File Name : <s:property value ="userImageFileName" /> <br>
Content Type : <s:property value ="userImageContentType" /> <br/>

	<div style="padding:3px; border:solid 1px #cccccc; text-align:center">
        <img src='./UploadImages/<s:property value="userImageFileName"/>'/>
        <br/>
    </div>
</body>
</html>