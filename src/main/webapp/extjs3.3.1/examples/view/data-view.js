Ext.onReady(function(){
    var xd = Ext.data;

	//JSON数据源
    var store1 = new Ext.data.JsonStore({
        //url: 'get-images.php',
        //fields: ['name', 'url', {name:'size', type: 'float'}, {name:'lastmod', type:'date', dateFormat:'timestamp'}]
        url: 'get-images.jsp',
        root: 'images',
        fields: ['name', 'url', {name:'size', type: 'float'}]
    });
    //store.load();
    
    //数组数据源,采用本地内存数据,仿照animated-dataview
    var store = new Ext.data.ArrayStore({
        proxy   : new Ext.data.MemoryProxy(),
        fields  : ['name'],
        sortInfo: {
            field    : 'name',
            direction: 'ASC'
        }
    });
    store.loadData([
        ["dance fever"],["gangster zack"],["kids hug"],["kids hug2"],
        ["sara pink"],["sara pumpkin"],["sara smile"],["up to something"],
        ["zack dress"],["zack hat"],["zack sink"],["zack"],["zacks grill"]
    ]);

	//shortName并不是数据源中定义的字段,但是可以通过已有的字段来定义.
    var tpl = new Ext.XTemplate(
		'<tpl for=".">',
            '<div class="thumb-wrap" id="{name}">',
		    '<div class="thumb"><img src="images/thumbs/{[values.name.replace(/ /g, "_")]}.jpg" title="{name}"></div>',
		    '<span class="x-editable">{shortName}</span></div>',
        '</tpl>',
        '<div class="x-clear"></div>'
	);

    var panel = new Ext.Panel({
    	title:'Simple DataView (0 items selected)',
        id:'images-view',
        frame:true,
        width:535,
        autoHeight:true,
        collapsible:true,
        layout:'fit',

        items: new Ext.DataView({
            store: store,		//数据源
            tpl: tpl,			//模板
            autoHeight:true,
            multiSelect: true,
            overClass:'x-view-over',
            itemSelector:'div.thumb-wrap',	//div class="thumb-wrap"
            emptyText: 'No images to display',

            plugins: [
                new Ext.DataView.DragSelector(),	//拖动选择??
                new Ext.DataView.LabelEditor({dataIndex: 'name'})  //文件名可以重命名
            ],

			//准备数据.数据准备完毕,即可运用到模板上.这里定义了一个新变量data.shortName,因此可以用到模板上.
            prepareData: function(data){
                data.shortName = Ext.util.Format.ellipsis(data.name, 15);
                //data.sizeString = Ext.util.Format.fileSize(data.size);	//采用本地数据,无法得到文件的大小
                //data.dateString = data.lastmod.format("m/d/Y g:i a");
                return data;
            },
            
            listeners: {
            	selectionchange: {
            		fn: function(dv,nodes){	//nodes:选中的图片,因为可以多选.当选中一个以上时,提示信息itmes.否则item
            			var l = nodes.length;
            			var s = l != 1 ? 's' : '';
            			panel.setTitle('Simple DataView ('+l+' item'+s+' selected)');
            		}
            	}
            }
        })
    });
    panel.render(document.body);

});