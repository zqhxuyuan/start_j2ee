<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Ext Tree Filter Demo1</title>
		<link href="${ctx}/js/extjs-3.3.1-min/resources/css/ext-all.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${ctx}/js/extjs-3.3.1-min/adapter/ext/ext-base.js"></script>
		<script type="text/javascript" src="${ctx}/js/extjs-3.3.1-min/ext-all.js"></script>
        
		<script type="text/javascript" src="${ctx}/js/ext.ux/PinyinFilter.js"></script>
		<script type="text/javascript" src="${ctx}/js/ext.ux/TreeFilter.js"></script>
		<script type="text/javascript" src="TreeFilterTest1.js">
        </script>
        <style type="text/css">
            body {
                font: normal normal normal 12px / normal Verdana, Arial, Helvetica, sans-serif;
				padding:10px;
            }
        </style>
    </head>
    <body>
		<p>输入拼音<b>首字母</b>或者汉字都可以对树结点进行过滤. 英文则全词匹配,但不区分大小写</p>
		<p>过滤仅对子节点有效 : http://chemzqm.iteye.com/blog/653530</p>
        <div id="mytree">
        </div>
		
    </body>
</html>
