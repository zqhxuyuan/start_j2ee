<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
 
<html> 
<head> 
<title>Reservation Query</title> 
</head> 
 
<body> 
<form:form method="post" action="list.html"> 
Court Name 
<input type="text" name="courtName" value="${courtName}" /> 
<input type="submit" value="Query" />   <a href="add.html">Add</a>
</form:form>
<table border="1"> 
  <tr> 
    <th>Court Name</th> 
    <th>Date</th> 
    <th>Hour</th> 
    <th>Player</th> 
    <th>Phone</th> 
    <th>SportType</th> 
  </tr> 
  <c:forEach items="${reservations}" var="reservation"> 
  <tr> 
    <td>${reservation.courtName}</td> 
    <td><fmt:formatDate value="${reservation.date}" pattern="yyyy-MM-dd" /></td> 
    <td>${reservation.hour}</td> 
    <td>${reservation.player.name}</td> 
    <td>${reservation.player.phone}</td> 
    <td>${reservation.sportType.name}</td> 
  </tr> 
  </c:forEach> 
</table> 

<hr /> 
Handling time : ${handlingTime} ms
</body> 
</html>