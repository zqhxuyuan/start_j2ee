<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>搜索的结果如下：</title>
</head>
<body>
  	<div>共搜到 <span><font color='red'> <s:property value="totalHits"/> </font></span> 条结果</div><br/><br/>
    <table width="90%" height="70%" border="1" cellpadding="0" cellspacing="0" align="center">
    	<tr>
    		<td align="center" width="20%">标题</td>
    		<td align="center" width="60%">文章内容</td>
    		<td align="center" width="20%">所属标签</td>
    	</tr>
		<s:iterator value="list">
  		<tr>
  			<td><s:property value="title"/></td>
  			<td><s:property value="content"/></td>
  			<td><s:property value="tag"/></td>
  		</tr>
		</s:iterator>
    </table>
    <br/>
</body>
</html>
