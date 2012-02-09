Ext.onReady(function(){
	
    var store = new Ext.data.Store({		// create the Data Store
        url: 'sheldon.xml',					// load using HTTP
        reader: new Ext.data.XmlReader({	// the return will be XML, so lets set up a reader
               record: 'Item',				// records will have an "Item" tag
               id: 'ASIN',
               totalRecords: '@total'
           }, [								// set up the fields mapping into the xml doc The first needs mapping, the others are very basic
               {name: 'Author', mapping: 'ItemAttributes > Author'},
               'Title',
			   'Manufacturer',
			   'ProductGroup',
			   'DetailPageURL'				// Detail URL is not part of the column model of the grid
           ])
    });

    var grid = new Ext.grid.GridPanel({		// create the grid
        store: store,
        columns: [
            {header: "Author", width: 120, dataIndex: 'Author', sortable: true},
            {header: "Title", width: 180, dataIndex: 'Title', sortable: true},
            {header: "Manufacturer", width: 115, dataIndex: 'Manufacturer', sortable: true},
            {header: "Product Group", width: 100, dataIndex: 'ProductGroup', sortable: true}
        ],
		sm: new Ext.grid.RowSelectionModel({
			singleSelect: true
		}),
		viewConfig: {
			forceFit: true
		},
        height:210,
		split: true,
		region: 'north'
    });
	
	// define a template to use for the detail view
	var bookTplMarkup = [
		'Title: <a href="{DetailPageURL}" target="_blank">{Title}</a><br/>',
		'Author: {Author}<br/>',
		'Manufacturer: {Manufacturer}<br/>',
		'Product Group: {ProductGroup}<br/>'
	];
	var bookTpl = new Ext.Template(bookTplMarkup);

	//Panel放入Grid表格和Panel面板:用来呈现模板内容
	var ct = new Ext.Panel({
		renderTo: 'binding-example',
		frame: true,
		title: 'Book List',
		width: 540,
		height: 400,
		layout: 'border',
		items: [
			grid,
			{
				id: 'detailPanel',
				region: 'center',
				bodyStyle: {
					background: '#ffffff',
					padding: '7px'
				},
				html: 'Please select a book to see additional details.'
			}
		]
	})
	
	grid.getSelectionModel().on('rowselect', function(sm, rowIdx, r) {
		var detailPanel = Ext.getCmp('detailPanel');
		bookTpl.overwrite(detailPanel.body, r.data);	//Grid当前行的数据写入detailPanel所在的bookTpl模板里
	});
	
    store.load();		//载入数据
});