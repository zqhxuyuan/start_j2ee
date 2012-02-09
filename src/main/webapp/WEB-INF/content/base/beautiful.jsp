<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>BeautifulAction</title>
		<script type="text/javascript">
		</script>
	</head>
	<body>
		<h1>Beautiful管理</h1>
		<div>
			<a href="${ctx}/base/beautiful!input.action">新增</a><br/>
		</div>
		<div>
			<table width="100%" border="0" align="center" cellpadding="3" cellspacing="1">
				<tr align="center">
					<th>序号</th>
					<th>名字</th>
					<th>描述</th>
				</tr>
				<s:iterator value="list">
					<tr align="center" bgcolor="#FFFFFF">
						<td>${id}</td>
						<td>${name}</td>
						<td>${note}</td>
						<td>
							<a href="beautiful!view.action?id=${id}">详细</a>
							<a href="beautiful!input.action?id=${id}">修改</a>
							<a href="beautiful!delete.action?id=${id}">删除</a>
						</td>
					</tr>
				</s:iterator>
			</table>
		</div>
	</body>
</html>