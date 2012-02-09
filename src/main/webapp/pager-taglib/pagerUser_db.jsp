<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>用户列表(pager-taglib数据库分页方案2)</title>
<script type="text/javascript">
</script>
</head>
<body>
<h1>User Manager(数据库分页方案2:封装成PageModel)</h1>
<table width="778" border="0" cellPadding="0" cellSpacing="1" bgcolor="#6386d6">
    <tr bgcolor="#EFF3F7">
    	<TD align="center">ID</TD>
    	<TD align="center">名称</TD>
    	<TD align="center">密码</TD>
    	<TD align="center">相关操作</TD>
    </tr>
    <c:if test="${!empty pm.data}">
    	<c:forEach items="${pm.data}" var="user">
    		<tr bgcolor="#EFF3F7">
    			<td align="center">${user.id }</td>
    			<td align="center">${user.username }</td>
    			<td align="center">${user.password}</td>
    			<td align="center">修改 &nbsp; 删除</td>
    		</tr>
    	</c:forEach>
    	</c:if>
    	<c:if test="${empty pm.data}">
	    <tr>
	    	<td colspan="5" align="center" bgcolor="#EFF3F7">没有找到相应的记录</td>
	    </tr>
	    </c:if>
</table>

<pg:pager url="pagerUser.action" items="${pm.total}" export="currentPageNumber=pageNumber">
	<pg:first>
		<a href="${pageUrl}">首页</a>
	</pg:first>
	<pg:prev>
		<a href="${pageUrl }">上一页</a>
	</pg:prev>
	<pg:pages>
		<c:choose>
			<c:when test="${currentPageNumber eq pageNumber}">
				<font color="red">${pageNumber }</font>
			</c:when>
			<c:otherwise>
				<a href="${pageUrl }">${pageNumber }</a>
			</c:otherwise>
		</c:choose>
	</pg:pages>
	<pg:next>
		<a href="${pageUrl }">下一页</a>
	</pg:next>
	<pg:last>
		<a href="${pageUrl }">尾页</a>
	</pg:last>
</pg:pager>
</body>
</html>