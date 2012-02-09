Ext.onReady(function(){
new Ext.Viewport({
    layout: 'border',
    items: [{
        region: 'west',
        collapsible: true,
        title: 'Navigation',
        xtype: 'treepanel',
        width: 200,
        autoScroll: true,
        split: true,
        //load tree
        loader: new Ext.tree.TreeLoader(),
        root: new Ext.tree.AsyncTreeNode({
            expanded: true,
            children: [{
                text: 'Menu Option 1',
                leaf: true
            }, {
                text: 'Menu Option 2',
                leaf: true
            }, {
                text: 'Menu Option 3',
                leaf: true
            }]
        }),
        rootVisible: false,
        listeners: {
            click: function(n) {
                Ext.Msg.alert('Navigation Tree Click', 'You clicked: "' + n.attributes.text + '"');
            }
        }
    }, {
        region: 'center',
        xtype: 'tabpanel',
        // remaining code not shown ...
    }]
});
    
});