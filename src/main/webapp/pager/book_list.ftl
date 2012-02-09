<#import "page.ftl" as p>
<html>
	<head>
		<title>User List</title>
		<meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
		<link href="${base}/css/default.css" rel="stylesheet" type="text/css">
	</head>
	<body>
		<table class="default" width="80%" align="center">
			<col width="30%">
			<col width="40%">
			<col width="30%">
			<tr class="title">
				<td colspan="3">用户列表</td>
			</tr>
			<tr class="subtitle">
				<td>序号</td>
				<td>姓名</td>
				<td>操作</td>
			</tr>
			<#assign count=(pageNum-1)*pageSize+1 />
			<#list userList.list as user>
			<tr class="list">
				<td>${count}</td>
				<td>${user.bookName}</td>
				<td><a href="user_delete.action?id=${user.bookId}">删除</a></td>
			</tr>
			<#assign count=count+1 />
			</#list>
			<tr>
				<td colspan="3" style="text-align:right" align="right">
					<@p.paging userList />				
				</td>
			</tr>
		</table>
	</body>
</html>