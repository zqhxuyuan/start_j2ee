var TreeTest = function(){
    var Tree = Ext.tree;
    
    return {
        init : function(){
            // yui-ext tree
            var tree = new Tree.TreePanel({
                animate:true, 
                autoScroll:true,
                loader: new Tree.TreeLoader({
                	//dataUrl:'get-nodes.php'
                	dataUrl:'check-nodes.json'
                }),
                enableDD:true,
                containerScroll: true,
                border: false,
                width: 250,
                height: 300,
                dropConfig: {
                	appendOnly:true
                }
            });
            
            // folder & file
            // add a tree sorter in folder mode
            new Tree.TreeSorter(tree, {
            	folderSort: true
            });
            
            // set the root node
            var root = new Tree.AsyncTreeNode({
                text: 'Ext JS', 
                draggable:false, // disable root node dragging
                id:'src'
            });
            tree.setRootNode(root);
            
            // render the tree
            tree.render('tree');
            root.expand(false, false);
            
            //-------------------------------------------------------------
            // ExtJS tree 另一棵树.代码和上面的一样
            var tree2 = new Tree.TreePanel({
                animate:true,
                autoScroll:true,
                loader: new Ext.tree.TreeLoader({
                    dataUrl:'check-nodes.json',
                    baseParams: {
                    	path:'extjs'	// custom http params
                    } 
                }),
                containerScroll: true,
                border: false,
                width: 250,
                height: 300,
                enableDD:true,
                dropConfig: {
                	appendOnly:true
                }
            });
            
            // add a tree sorter in folder mode
            new Tree.TreeSorter(tree2, {folderSort:true});
            
            // add the root node
            var root2 = new Tree.AsyncTreeNode({
                text: 'Extensions', 
                draggable:false, 
                id:'ux'
            });
            tree2.setRootNode(root2);
            tree2.render('tree2');
            
            root2.expand(false,false);
        }
    };
}();

//闭包:调用TreeTest中的init方法.最后一个参数设为false,或者去掉也没影响
Ext.EventManager.onDocumentReady(TreeTest.init, TreeTest, true);