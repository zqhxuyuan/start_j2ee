// This is the main layout definition.
Ext.onReady(function(){
	Ext.QuickTips.init();
	
	// This is an inner body element within the Details panel created to provide a "slide in" effect
	// on the panel body without affecting the body's box itself.  This element is created on
	// initial use and cached in this var for subsequent access.
	// Details信息:layout-browser.html中id=xxx-details的内容.
	var detailEl;
	
	// This is the main content center region that will contain each example layout panel.
	// It will be implemented as a CardLayout since it will contain multiple panels with
	// only one being visible at any given time.任何时候只显示其中一个Panel的内容,所以采用卡片布局
	// 当点击菜单树的节点时,显示在右边Panel里的内容
	var contentPanel = {
		id: 'content-panel',
		region: 'center', 	// this is what makes this panel into a region within the containing layout
		layout: 'card',		// 卡片布局
		margins: '2 5 5 0',
		activeItem: 0,
		border: false,
		items: [
			// from basic.js:
			start, absolute, accordion, anchor, border, cardTabs, cardWizard, column, fit, form, table, vbox, hbox,
			// from custom.js:
			rowLayout, centerLayout,
			// from combination.js:
			absoluteForm, tabsNestedLayouts
		]
	};
    
	// Go ahead and create the TreePanel now so that we can use it below
	// 左侧可供选择点击的菜单树
    var treePanel = new Ext.tree.TreePanel({
    	id: 'tree-panel',
    	title: 'Sample Layouts',
        region:'north',
        split: true,
        height: 300,
        minSize: 150,
        autoScroll: true,
        
        // tree-specific configs:
        rootVisible: false,
        lines: false,
        singleExpand: true,
        useArrows: true,
        
        loader: new Ext.tree.TreeLoader({
            dataUrl:'tree-data.json'
        }),
        
        root: new Ext.tree.AsyncTreeNode()
    });
    
	// Assign the changeLayout function to be called on tree node click.
    treePanel.on('click', function(n){			// n:node,即树的各个节点,即tree-data.json中的各个节点,n.id即id的值
    	var sn = this.selModel.selNode || {}; 	// selNode is null on initial selection
    	if(n.leaf && n.id != sn.id){  			// ignore clicks on folders and currently selected node 只有是叶子节点
    		Ext.getCmp('content-panel').layout.setActiveItem(n.id + '-panel'); 	//假设n.id=absolute,则对应的Panel的id为:absolute-panel
    		if(!detailEl){
    			var bd = Ext.getCmp('details-panel').body;
    			bd.update('').setStyle('background','#fff');
    			detailEl = bd.createChild(); 	//create default empty div
    		}
    		//Details信息,同样layout-browser.html中div的id为:xxx-details
    		detailEl.hide().update(Ext.getDom(n.id+'-details').innerHTML).slideIn('l', {stopFx:true,duration:.2});
    	}
    });
    
	// This is the Details panel that contains the description for each example layout.
	var detailsPanel = {
		id: 'details-panel',
        title: 'Details',
        region: 'center',
        bodyStyle: 'padding-bottom:15px;background:#eee;',
		autoScroll: true,
		html: '<p class="details-info">When you select a layout from the tree, additional details will display here.</p>'
    };
	
	// Finally, build the main layout once all the pieces are ready.  This is also a good
	// example of putting together a full-screen BorderLayout within a Viewport.
    new Ext.Viewport({
		layout: 'border',
		title: 'Ext Layout Browser',
		items: [{
			xtype: 'box',
			region: 'north',
			applyTo: 'header',		//头部Header栏
			height: 30
		},{
			layout: 'border',
	    	id: 'layout-browser',
	        region:'west',			//西部,放置菜单树和节点的详细信息
	        border: false,
	        split:true,
			margins: '2 0 5 5',
	        width: 275,
	        minSize: 100,
	        maxSize: 500,
			items: [treePanel, detailsPanel]
		},
			contentPanel			//内容面板:center,会自动撑开在East.
		],
        renderTo: Ext.getBody()
    });
});
