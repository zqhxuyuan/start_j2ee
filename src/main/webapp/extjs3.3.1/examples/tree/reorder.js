Ext.onReady(function(){
    // shorthand
    var Tree = Ext.tree;

    var tree = new Tree.TreePanel({
        useArrows: true,
        autoScroll: true,
        animate: true,
        enableDD: true,				//可拖动,只要把这个字段设置为true即可.默认不可拖动
        containerScroll: true,
        border: false,
        //dataUrl: 'get-nodes.php',
        dataUrl: 'check-nodes.json',
        root: {
            nodeType: 'async',
            text: 'Ext JS',
            draggable: false,		//根节点不可拖动.即使设置为true,也不能拖动.因为只有一个根节点.
            id: 'src'
        }
    });

    // render the tree
    tree.render('tree-div');
    tree.getRootNode().expand();
});