Ext.onReady(function(){
	Ext.BLANK_IMAGE_URL = '../resources/images/default/tree/s.gif';
    var myTree = new Ext.tree.TreePanel({
        renderTo:'mytree',
        rootVisible:false,
        width:200,
        height:400,
        autoScroll:true,
        tbar:new Ext.Toolbar(),
        root:new Ext.tree.AsyncTreeNode({
                children: [{
                    id: 'level',
                    text: '用户类型',
                    children: [{
                        id: 'allLevel',
                        text: '全部',
                        leaf: true
                    }, {
                        id: 'noSupport',
                        text: 'Support',
                        leaf: true
                    }, {
                        id: 'month',
                        text: '包月',
                        leaf: true
                    }, {
                        id: 'year',
                        text: '包年',
                        leaf: true
                    }, {
                        id: 'always',
                        text: '终身',
                        leaf: true
                    }]
                }, {
                    id: 'outOfDate',
                    text: '是否过期',
                    children: [{
                        id: 'allOutOfDate',
                        text: '全部',
                        leaf: true
                    }, {
                        id: 'notOutOfDate',
                        text: '未过期',
                        leaf: true
                    }, {
                        id: 'alreadyOutOfDate',
                        text: '已过期',
                        leaf: true
                    }]
                }, {
                    id: 'report',
                    text: '统计图表',
                    children: [{
                        id: 'levelReport',
                        text: '按用户类型',
                        leaf: true
                    }, {
                        id: 'outOfDateReport',
                        text: '按是否过期',
                        leaf: true
                    }]
                }]
            })
    });
    
    var filterFiled = new Ext.form.TextField({
        width:150,
        emptyText:'快速检索',
        enableKeyEvents: true,
	    listeners:{
			render: function(f){
                this.filter = new QM.ux.TreeFilter(myTree,{
					clearAction : 'expand'
				});//初始化TreeFilter 
			},
            keyup: {//添加键盘点击监听
                fn:function(t,e){
                  t.filter.filter(t.getValue());
                },
                buffer: 350
            }
		}
    });
    myTree.expandAll();
    var tbar = myTree.getTopToolbar();
    tbar.add(filterFiled);
    tbar.doLayout();
    Ext.getDom('<input id="test" name="test"/>')
});
