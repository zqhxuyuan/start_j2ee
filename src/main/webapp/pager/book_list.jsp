<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>封装分页测试</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<script type="text/javascript" src="base.js"></script>
	</head>
	<body>
		<s:form action="book-base" method="post">
			<s:hidden name="page"></s:hidden>
			
			<s:if test="pageView.totalRecord">
				<s:if test="pageView.totalPage > 1">
					<%@ include file="page.jsp"%>
				</s:if>
				<table border="1">
					<tr> <td> ID </td> <td> NAME </td> </tr>
					<s:iterator value="pageView.records" id="entity">
						<tr>
							<td>
								<s:property value="#entity.bookId" />
							</td>
							<td>
								<s:property value="#entity.bookName" />
							</td>
						</tr>
					</s:iterator>
				</table>
			</s:if>
			<s:else>
				没有记录
			</s:else>
		</s:form>
	</body>
</html>
