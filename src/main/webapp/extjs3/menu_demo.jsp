<%@ page language="java" contentType="text/html; charset=UTF8" pageEncoding="UTF8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF8">
<title>Ext Tree Demo</title>
<link rel="stylesheet" type="text/css" href="../js/extjs-3.3.1-min/resources/css/ext-all.css"/>
<script type="text/javascript" src="../js/extjs-3.3.1-min/adapter/ext/ext-base.js"></script>
<script type="text/javascript" src="../js/extjs-3.3.1-min/ext-all.js"></script>
<script>
Ext.onReady(function(){
    var Tree = Ext.tree;
   
	// tree loader
    var tree = new Tree.TreePanel({
        el:'tree-div',
        autoScroll:true,
        animate:true,
        enableDD:true,
        containerScroll: true,
        loader: new Tree.TreeLoader({
            dataUrl:'menudemo.action'
        })
    });

    // set the root node
    var root = new Tree.AsyncTreeNode({
        text: 'roto',
        //id:'source'
        id: 0
    });
    tree.setRootNode(root);

    // render the tree
    tree.render();
    root.expand();
});
</script>
</head>
<body>
<div id="tree-div" style="overflow:auto; height:300px;width:250px;border:1px solid #c3daf9;"></div>
</body>
</html>