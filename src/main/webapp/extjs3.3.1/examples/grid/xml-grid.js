Ext.onReady(function(){
    var store = new Ext.data.Store({		// create the Data Store
        url: 'sheldon.xml',					// load using HTTP
        reader: new Ext.data.XmlReader({	// the return will be XML, so lets set up a reader
               record: 'Item',				// records will have an "Item" tag
               id: 'ASIN',
               totalRecords: '@total'
           }, [								// set up the fields mapping into the xml doc .The first needs mapping, the others are very basic
               {name: 'Author', mapping: 'ItemAttributes > Author'},
               'Title', 'Manufacturer', 'ProductGroup'
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
        renderTo:'example-grid',
        width:540,
        height:200
    });

    store.load();
});
