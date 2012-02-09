var ImageChooser = function(config){
	this.config = config;
}

ImageChooser.prototype = {
    // cache data by image name for easy lookup 缓存图片的名字
    lookup : {},

	show : function(el, callback){
		if(!this.win){
			//初始化模板
			this.initTemplates();

			this.store = new Ext.data.JsonStore({
			    url: this.config.url,
			    root: 'images',			//json格式的数据,格式为:{"images":[{"name":"xxx"}{...}]} images即为这里的root配置
			    fields: [
			        'name', 'url',
			        {name:'size', type: 'float'},
			        {name:'lastmod', type:'date', dateFormat:'timestamp'}
			    ],
			    listeners: {
			    	'load': {
			    		fn:function(){
			    			this.view.select(0); 
			    		}, 
			    		scope:this, 
			    		single:true
			    	}
			    }
			});
			this.store.load();

			var formatSize = function(data){
		        if(data.size < 1024) {
		            return data.size + " bytes";
		        } else {
		            return (Math.round(((data.size*10) / 1024))/10) + " KB";
		        }
		    };

			var formatData = function(data){
		    	data.shortName = data.name.ellipse(15);
		    	data.sizeString = formatSize(data);
		    	data.dateString = new Date(data.lastmod).format("m/d/Y g:i a");
		    	this.lookup[data.name] = data;
		    	return data;
		    };

		    this.view = new Ext.DataView({
				tpl: this.thumbTemplate,
				singleSelect: true,
				overClass:'x-view-over',
				itemSelector: 'div.thumb-wrap',
				emptyText : '<div style="padding:10px;">No images match the specified filter</div>',
				store: this.store,
				listeners: {
					'selectionchange': {fn:this.showDetails, scope:this, buffer:100},	//选择一个图片时,就在右边的Panel里显示该图片的详细信息
					'dblclick'       : {fn:this.doCallback, scope:this},
					'loadexception'  : {fn:this.onLoadException, scope:this},
					'beforeselect'   : {fn:function(view){
				        return view.store.getRange().length > 0;
				    }}
				},
				prepareData: formatData.createDelegate(this)
			});
	
			//window
			var cfg = {
		    	title: 'Choose an Image',
		    	id: 'img-chooser-dlg',
		    	layout: 'border',
				minWidth: 500,
				minHeight: 300,
				modal: true,		//模态窗口
				closeAction: 'hide',
				border: false,
				items:[{
					id: 'img-chooser-view',
					region: 'center',
					autoScroll: true,
					items: this.view,	//1.数据视图dataview的数据来源是上面创建好的Ext.DataView对象
                    tbar:[{				//2.工具栏:过滤排序dataview里的图片
                    	text: 'Filter:'
                    },{
                    	xtype: 'textfield',
                    	id: 'filter',
                    	selectOnFocus: true,
                    	width: 100,
                    	listeners: {
                    		'render': {fn:function(){
						    	Ext.getCmp('filter').getEl().on('keyup', function(){	//keyup时触发过滤功能
						    		this.filter();
						    	}, this, {buffer:500});
                    		}, scope:this}
                    	}
                    }, ' ', '-', {
                    	text: 'Sort By:'
                    }, {
                    	id: 'sortSelect',
                    	xtype: 'combo',		//下拉框根据选择的字段排序
				        typeAhead: true,
				        triggerAction: 'all',
				        width: 100,
				        editable: false,
				        mode: 'local',
				        displayField: 'desc',
				        valueField: 'name',
				        lazyInit: false,
				        value: 'name',
				        store: new Ext.data.ArrayStore({	//排序,需要对数据源进行排序.
					        fields: ['name', 'desc'],
					        data : [['name', 'Name'],['size', 'File Size'],['lastmod', 'Last Modified']]
					    }),
					    listeners: {
							'select': {
								fn:this.sortImages, 
								scope:this
							}
					    }
				    }]
				},{
					id: 'img-detail-panel',		//鼠标选中某个图片后,在右边的Panel里显示该图片的详细信息
					region: 'east',
					split: true,
					width: 150,
					minWidth: 150,
					maxWidth: 250
				}],
				buttons: [{
					id: 'ok-btn',
					text: 'OK',
					handler: this.doCallback,
					scope: this
				},{
					text: 'Cancel',
					handler: function(){ this.win.hide(); },
					scope: this
				}],
				keys: {
					key: 27, // Esc key
					handler: function(){ this.win.hide(); },
					scope: this
				}
			};
			Ext.apply(cfg, this.config);
		    this.win = new Ext.Window(cfg);		//It's a Window,isn't?
		}

		this.reset();
	    this.win.show(el);
		this.callback = callback;
		this.animateTarget = el;
	},

	initTemplates : function(){
		//data view里的模板内容
		this.thumbTemplate = new Ext.XTemplate(
			'<tpl for=".">',
				'<div class="thumb-wrap" id="{name}">',
				'<div class="thumb"><img src="{url}" title="{name}"></div>',
				'<span>{shortName}</span></div>',
			'</tpl>'
		);
		this.thumbTemplate.compile();	//编译模板内容??将模板内容解释执行,并呈现在window窗体内

		//详细信息的模板内容
		this.detailsTemplate = new Ext.XTemplate(
			'<div class="details">',
				'<tpl for=".">',
					'<img src="{url}"><div class="details-info">',
					'<b>Image Name:</b>',
					'<span>{name}</span>',
					'<b>Size:</b>',
					'<span>{sizeString}</span>',
					'<b>Last Modified:</b>',
					'<span>{dateString}</span></div>',
				'</tpl>',
			'</div>'
		);
		this.detailsTemplate.compile();
	},

	showDetails : function(){
	    var selNode = this.view.getSelectedNodes();				//当前选中的图片(节点)
	    var detailEl = Ext.getCmp('img-detail-panel').body;		//对应的详细信息Panel
		if(selNode && selNode.length > 0){
			selNode = selNode[0];
			Ext.getCmp('ok-btn').enable();
		    var data = this.lookup[selNode.id];
            detailEl.hide();
            this.detailsTemplate.overwrite(detailEl, data);
            detailEl.slideIn('l', {stopFx:true,duration:.2});
		}else{
		    Ext.getCmp('ok-btn').disable();
		    detailEl.update('');
		}
	},

	//过滤和排序,都要对数据源进行操作.获取数据源的方法是:this.view.store.Store内置了filter和sort方法.只要传入需要操作的字段和值即可.
	filter : function(){
		var filter = Ext.getCmp('filter');
		this.view.store.filter('name', filter.getValue());	//对view.store数据源的数据根据name字段进行过滤
		this.view.select(0);
	},

	sortImages : function(){
		var v = Ext.getCmp('sortSelect').getValue();
    	this.view.store.sort(v, v == 'name' ? 'asc' : 'desc');
    	this.view.select(0);
    },

	reset : function(){
		if(this.win.rendered){
			Ext.getCmp('filter').reset();
			this.view.getEl().dom.scrollTop = 0;
		}
	    this.view.store.clearFilter();
		this.view.select(0);
	},
	
	//双击图片,或者选中图片后点击确定.隐藏Window,调用回调函数...
	doCallback : function(){
        var selNode = this.view.getSelectedNodes()[0];
		var callback = this.callback;
		var lookup = this.lookup;
		this.win.hide(this.animateTarget, function(){
            if(selNode && callback){
				var data = lookup[selNode.id];
				callback(data);
			}
		});
    },

	onLoadException : function(v,o){
	    this.view.getEl().update('<div style="padding:10px;">Error loading images.</div>');
	}
};

String.prototype.ellipse = function(maxLength){
    if(this.length > maxLength){
        return this.substr(0, maxLength-3) + '...';
    }
    return this;
};
