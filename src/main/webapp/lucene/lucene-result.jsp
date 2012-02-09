<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>搜索的结果如下：</title>
<style type="text/css">
.Fee{width: 650px; height:28px; float: right; padding:1px; overflow:hidden; border-bottom:1px solid #bde2ff;
	line-height:28px; font-family: '宋体'; font-size: 15px; font-weight: bold;}
.Fee span{ color: red; font-size:14px;}
</style>
</head>
<body>
  	<div class="Fee">共搜到 <span> <s:property value="totalHits"/> </span> 条结果.</div><br/><br/>
    <table width="80%" height="70%" border="1" cellpadding="0" cellspacing="0" align="center">
    	<tr height="20" bgcolor="#CCCCCC">
    		<td align="center" width="20%">标题</td>
    		<td align="center" width="60%">文章内容</td>
    		<td align="center" width="20%">所属标签</td>
    	</tr>
		<s:iterator value="list">
  		<tr>
  			<td><s:property value="tag"/></td>
  			<td><s:property value="title"/></td>
  			<td><s:property value="content"/></td>
  		</tr>
		</s:iterator>
    </table>
    <br/>
</body>
</html>
