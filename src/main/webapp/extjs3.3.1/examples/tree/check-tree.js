function toggleCheck(node,checked){
 	if(node){
   		var args=[checked];
   		node.cascade(function(){
     		c=args[0];
     		this.ui.toggleCheck(c);
     		this.attributes.checked=c;
   		},null,args);
 	}
}

Ext.onReady(function(){
	var treeLoader = new Ext.tree.TreeLoader({
        dataUrl:'check-nodes.json'
    })

    var tree = new Ext.tree.TreePanel({
    	//el: 'tree-div',		//或者指定el,然后通过tree.render()进行呈现.注意不能和renderTo同时使用
    	//renderTo: Ext.fly("tree-div"),
        renderTo: 'tree-div',	//呈现方式
        title: 'My Task List',
        height: 300,
        width: 400,
        useArrows:true,
        autoScroll:true,		//树节点的数据长度超过height,出现滚动条.默认不出现.
        animate:true,
        enableDD:true,			//是否可拖动节点
        containerScroll: true,
        rootVisible: false,		//根节点不可见
        frame: true,			//True表示为面板的边框外框可自定义的，false表示为边框可1px的点线（默认为false）。

		//异步加载树
        root: {					//指定树的根节点
            nodeType: 'async',	//节点加载类型:异步方式.只有异步方式,才能使用TreeLoader
            text: 'Root',		//根节点如果不可见,这里就不需要指定text了
            id: 0				//指定id,一般用在异步加载树上.
        },
        //dataUrl: 'check-nodes.json',	// auto create TreeLoader
        //loader: treeLoader,			//TreeLoader可以定义在TreePanel中,也可以预先定义.
        loader: new Ext.tree.TreeLoader({
        	dataUrl:'check-nodes.json'
        	//,baseParams: { "id": 0 }
    	}),

		//监听器,或者采用tree.on('click',function(node,param){})事件处理方式
        listeners: {
        	/**
            'checkchange': function(node, checked){
                if(checked){
                    node.getUI().addClass('complete');
                }else{
                    node.getUI().removeClass('complete');
                }
            },
            */
            click: function(node) {
	            alert(node.text+" => nodeId:"+ node.attributes.nodeid);
	       	}
        },

        buttons: [{
            text: 'Get Completed Tasks',
            handler: function(){
                var msg = '', selNodes = tree.getChecked();
                Ext.each(selNodes, function(node){
                    if(msg.length > 0){
                        msg += ', ';
                    }
                    msg += node.text;
                });
                Ext.Msg.show({
                    title: 'Completed Tasks',
                    msg: msg.length > 0 ? msg : 'None',
                    icon: Ext.Msg.INFO,
                    minWidth: 200,
                    buttons: Ext.Msg.OK
                });
            }
        }],

       	//TreePanel上的工具栏以及自定义函数的实现
        tbar: [{
			text: '展开',
			handler: onExpendAllNode,
		}, "-", {
			text: '收缩',
			handler: onCollspseAllNode,
		}, "-", {
			text: '刷新',
			handler: onRefreshHandler,
		}, "-", {
			text: '全选',
			handler: onChooseAllHandler,
		}, "-", {
			text: '反选',
			handler: onUnChooseAllHandler,
		}]
    });

	tree.getRootNode().expand(true);			//自动展开所有节点
    //tree.getRootNode().expand(false,false);	//第一个true是自动展开所有子节点，第二个true是以动画效果展开树
    //tree.root.expand(true);					//获取根节点的方式是:tree.root[属性]或者tree.getRootNode()[方法]
    //tree.root.expand();						//等价于上面
	//获取树tree内的属性或者对象的方式是tree.root.下文中异步加载的另一种实现方式tree.loader也是同样的道理.

	//-----------------------------------------------------------------------------------------------
	//以上是官方的实例.以下是对一颗简单的Ext树的简单扩展.并给出了一些树的其他实现方式.
	//包括事件处理(监听器),运用新控件,工具栏自定义方法实现.
	//以及如何运用创建好的tree对象对树进行操作.以及异步加载树的实现方式.
	//-----------------------------------------------------------------------------------------------
	//等价于TreePanel中定义的root.  注意:不能使用Ext.tree.TreeNode创建根节点.因为它不支持ajax，不能加载外部数据
	//var root = new Ext.tree.AsyncTreeNode({		//创建根节点，使用AsyncTreeNode能够加载外部数据
	//	text:'Root',id:0
	//});
	//tree.setRootNode(root);					//设置root为根节点
	//tree.render();							//将树显示在div标签上.TreePanel指定el时,呈现方式

    //*********************************异步加载
	//异步加载树:根据点击的节点加载该节点下的数据:
	//在树节点展现之前更改tree的TreeLoader的dataUrl,传递当前节点的id.然后从数据库中根据id查询该节点下的子节点.
	tree.on('beforeload',function(node){
    	if(node.id != 0){
    		//alert("tree: parentid:" + node.id);
        	tree.loader.dataUrl = 'check-nodes.json?id='+node.attributes.id;
    	}
	});

	//在TreePanel创建之前预先创建TreeLoader对象.这里就可以引用创建好的TreeLoader对象
	//TreeLoader的beforeload方法:beforeload( Object tree, Object node, Object callback )
	treeLoader.on("beforeload", function(treeLoader, node) {
		alert("tree loader,pid:" + node.id);
        this.baseParams.id = node.attributes.id;
    }, this);

    //*********************************展开,收缩,刷新
    //tree节点事件: 单个节点的展开,折叠,单击. 或者采用监听器的方式写在TreePanel中.
	tree.on("expandnode",function(node){
 		//alert("["+node.text+"]open");
	});
	tree.on("collapsenode",function(node){
 		//alert("["+node.text+"]close");
	});

	//展开所有,收缩使用,刷新.针对的是树的根节点.
	function onExpendAllNode() {
		tree.root.expand(true, true);
		//tree.expandAll();
	}
	function onCollspseAllNode(){
		tree.root.collapse(true);
	}
	function onRefreshHandler() {
		onCollspseAllNode();
		tree.root.reload(function () {
			tree.root.expand(true);
		});
	}

	//*********************************全选,反选[最好保证树自动展开所有节点.否则有些节点无法选中]
	function onChooseAllHandler(){
		toggleCheck(tree.root,true);
	}
	function onUnChooseAllHandler(){
		toggleCheck(tree.root,false);
	}

	//*********************************级联选中子节点[适用于同步加载树即JSON数据含有chidren域]
	tree.on('checkchange', function(node, checked) {
        node.expand();
        node.attributes.checked = checked;
        node.eachChild(function(child) {
            child.ui.toggleCheck(checked);
            child.attributes.checked = checked;
            child.fireEvent('checkchange', child, checked);
        });
    //}, tree);
    });

	//*********************************节点过滤


   	//*********************************可编辑节点
	//对tree运用新的控件 TreeEditor:  设置该树(只有叶子节点)可编辑
	var treeEditor = new Ext.tree.TreeEditor(tree,{
		allowBlank:false
	});

	treeEditor.on("beforestartedit",function(treeEditor){  	//TreeEditor的事件处理
		return treeEditor.editNode.isLeaf();
	});
	treeEditor.on("complete",function(treeEditor,newValue){  //此处将编辑的值输出
		//alert("The name had been modified,the result is:"+newValue);
	});

	//设置叶子节点可追加元素
	tree.on("nodedragover",function(e){
 		var node = e.target;
 		if(node.leaf)
  			node.leaf = false;
 		return true;
	});
});