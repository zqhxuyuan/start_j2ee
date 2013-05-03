<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Spring MVC Autocomplete with JQuery &amp; JSON example</title>
    <!-- 
	<link rel="stylesheet" type="text/css" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.18/jquery-ui.min.js"></script>
 	-->
 	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/js/jquery-ui-1.8.16/css/ui-lightness/jquery-ui-1.8.16.custom.css" />
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-ui-1.8.16/js/jquery-1.6.2.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-ui-1.8.16/js/jquery-ui-1.8.16.custom.min.js"></script>
</head>
<body>

<h2>Spring MVC Autocomplete with JQuery &amp; JSON example</h2>
<form:form method="post" action="saveUser.html" modelAttribute="userForm">
<table>
    <tr>
        <th>Name</th>
        <td><form:input path="name" /></td>
    </tr>
    <tr>
        <th>Country</th>
        <td><form:input path="country" id="country" /></td>
    </tr>
    <tr>
        <th>Technologies</th>
        <td><form:input path="technologies" id="technologies" /></td>
    </tr>
    <tr>
        <td colspan="2">
            <input type="submit" value="Save" />
            <input type="reset" value="Reset" />
        </td>
    </tr>
</table>  
<br />
</form:form>
 
<script type="text/javascript">
function split(val) {
    return val.split(/,\s*/);
}
function extractLast(term) {
    return split(term).pop();
}
 
$(document).ready(function() {
    $( "#country" ).autocomplete({
        //source: '${pageContext.request.contextPath}/get_country_list.html'
        source: 'get_country_list.html'
    });
     
    $( "#technologies").autocomplete({
        source: function (request, response) {
            //$.getJSON("${pageContext.request.contextPath}/get_tech_list.html", {
            $.getJSON("get_tech_list.html", {
                term: extractLast(request.term)
            }, response);
        },
        search: function () {
            // custom minLength
            var term = extractLast(this.value);
            if (term.length < 1) {
                return false;
            }
        },
        focus: function () {
            // prevent value inserted on focus
            return false;
        },
        select: function (event, ui) {
            var terms = split(this.value);
            // remove the current input
            terms.pop();
            // add the selected item
            terms.push(ui.item.value);
            // add placeholder to get the comma-and-space at the end
            terms.push("");
            this.value = terms.join(", ");
            return false;
        }
    });
     
});
</script>
 
</body>
</html>