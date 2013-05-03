<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<html>
<head>
<title>DHX TREE DEMO + Struts2(XML)</title>
<link rel="STYLESHEET" type="text/css" href="<%=basePath%>/js/dhtmlx/tree/dhtmlxtree.css">
<script src="<%=basePath%>/js/dhtmlx/tree/dhtmlxcommon.js"></script>
<script src="<%=basePath%>/js/dhtmlx/tree/dhtmlxtree.js"></script>
</head>
<body onload="loadTree(); " style="padding: 0; margin: 0; overflow: hidden; height: 100%;">
<script>
String.prototype._dhx_trim = function(){
    return this.replace(/&nbsp;/g," ").replace(/(^[ \t\n\r]*)|([ \t\n\r]*$)/g,"");
}
 
/* init tree */
var tree; 
function loadTree(){
    tree=new dhtmlXTreeObject("doctree_box","100%","100%",0);
    tree.setImagePath("<%=basePath%>/js/dhtmlx/tree/images/");    <!-- 注意此处的路径需要根据各自具体情况修改 -->
    tree.setOnClickHandler(
        function(id){ openPathDocs(id); }
    );
    tree.enableCheckBoxes(1);//有checkbo
    tree.loadXML("<%=basePath%>/treemenu.action");
    //tree.loadXML("../xml/treemenu_noid.xml"); //没有指定id,错误
    //tree.loadXML("../xml/treemenu_id.xml"); //OK
}

/* open path funtion */
function openPathDocs(id){
    if (tree.getUserData(id, "thisurl") != null ){
        window.frames.sampleframe.location.href = "<%=path%>/" + tree.getUserData(id, "thisurl") + ".action";
        return;
    }
}
function autoselectNode(){
    tree.selectItem(node,true);
    tree.openItem(node);
}
</script>
<table width="100%" height="100%" cellpadding="0" cellspacing="0" border="0">
    <tr>
        <td valign="top" width="276">
            <div id="doctree_box" style="width: 274px; height: 100%;"></div>
        </td>
        <td width="10" >
            &nbsp;
        </td>
        <td align="right">
            <iframe id="sampleframe" name="sampleframe" width="100%" height="99%" frameborder="0" style="border: 0px solid #cecece;"></iframe>
        </td>
    </tr>
    <a href="javascript:void(0);" onClick="alert(tree.getAllChecked());">Get list of checked</a><br><br>
</table>
</body>
</html>