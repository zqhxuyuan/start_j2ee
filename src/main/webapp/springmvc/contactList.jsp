<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Spring 3 MVC Multipe Row Submit - viralpatel.net</title>
</head>
<body>
<h2>Show Contacts</h2>
<table width="50%">
    <tr>
        <th>Name</th>
        <th>Lastname</th>
        <th>Email</th>
        <th>Phone</th>
    </tr>
    <c:forEach items="${contactForm.contacts}" var="contact" varStatus="status">
        <tr>
            <td>${contact.firstname}</td>
            <td>${contact.lastname}</td>
            <td>${contact.email}</td>
            <td>${contact.phone}</td>
        </tr>
    </c:forEach>
</table>  
<br/>
<input type="button" value="Back" onclick="javascript:history.back()"/>
</body>
</html>