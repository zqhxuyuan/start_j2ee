Ext.onReady(function(){
    Ext.QuickTips.init();

    // Menus can be prebuilt and passed by reference 菜单和其他组件一样,可以先被实例化,然后被某个组件引用.
    var dateMenu = new Ext.menu.DateMenu({
        handler: function(dp, date){
            Ext.example.msg('Date Selected', 'You chose {0}.', date.format('M j, Y'));
        }
    });

    var colorMenu = new Ext.menu.ColorMenu({
        handler: function(cm, color){
            Ext.example.msg('Color Selected', 'You chose {0}.', color);
        }
    });

	//下拉框
    var store = new Ext.data.ArrayStore({
        fields: ['abbr', 'state'],
        data : Ext.exampledata.states // from states.js
    });

    var combo = new Ext.form.ComboBox({
        store: store,
        displayField: 'state',
        typeAhead: true,
        mode: 'local',			//本地数据,本地模式
        triggerAction: 'all',
        emptyText: 'Select a state...',
        selectOnFocus: true,
        width: 135,
        getListParent: function() {
            return this.el.up('.x-menu');
        },
        iconCls: 'no-icon'
    });

    var menu = new Ext.menu.Menu({
        id: 'mainMenu',
        style: {
            overflow: 'visible'     	// For the Combo popup
        },
        items: [
            combo,                  	// A Field in a Menu 下拉框作为菜单项中的一个一级菜单
            {
                text: 'I like Ext',
                checked: true,       	// when checked has a boolean value, it is assumed to be a CheckItem
                checkHandler: onItemCheck
            }, '-', {
                text: 'Radio Options',
                menu: {        			// <-- submenu by nested config object 子菜单(二级菜单),config by menu/items property
                    items: [
                        // stick any markup in a menu
                        '<b class="menu-title">Choose a Theme</b>',
                        {
                            text: 'Aero Glass',
                            checked: true,
                            group: 'theme',
                            checkHandler: onItemCheck
                        }, {
                            text: 'Vista Black',
                            checked: false,
                            group: 'theme',
                            checkHandler: onItemCheck
                        }, {
                            text: 'Gray Theme',
                            checked: false,
                            group: 'theme',
                            checkHandler: onItemCheck
                        }, {
                            text: 'Default Theme',
                            checked: false,
                            group: 'theme',
                            checkHandler: onItemCheck
                        }
                    ]
                }
            },{
                text: 'Choose a Date',
                iconCls: 'calendar',
                menu: dateMenu // <-- submenu by reference
            },{
                text: 'Choose a Color',
                menu: colorMenu // <-- submenu by reference
            }
        ]
    });

    menu.addSeparator();
    // Menus have a rich api for adding and removing elements dynamically
    var item = menu.add({
        text: 'Dynamically added Item'
    });
    // items support full Observable API
    item.on('click', onItemClick);

    // items can easily be looked up
    menu.add({
        text: 'Disabled Item',
        id: 'disableMe'  // <-- Items can also have an id for easy lookup
        // disabled: true   <-- allowed but for sake of example we use long way below
    });
    // access items by id or index
    menu.items.get('disableMe').disable();
    
	//工具栏: 将上面创建好的菜单加入工具栏,或者可以在这里直接定义
    var tb = new Ext.Toolbar();
    tb.render('toolbar');

    tb.add({
            text:'Button w/ Menu',
            iconCls: 'bmenu',  	// <-- icon
            menu: menu  		// assign menu by instance
        }, {
            text: 'Users',
            iconCls: 'user',
            menu: {				//工具栏可以放菜单
                xtype: 'menu',	
                plain: true,
                items: {
                    xtype: 'buttongroup',
                    title: 'User options',
                    autoWidth: true,
                    columns: 2,
                    defaults: {
                        xtype: 'button',
                        scale: 'large',
                        width: '100%',
                        iconAlign: 'left'
                    },
                    items: [{
                        text: 'User<br/>manager',
                        iconCls: 'edit'
                    },{
                        iconCls: 'add',
                        width: 'auto',
                        tooltip: 'Add user'
                    },{
                        colspan: 2,
                        text: 'Import',
                        scale: 'small'
                    },{
                        colspan: 2,
                        text: 'Who is online?',
                        scale: 'small'
                    }]
                }
            }
        },
        new Ext.Toolbar.SplitButton({	//也可以放Button
            text: 'Split Button',
            handler: onButtonClick,
            tooltip: {text:'This is a an example QuickTip for a toolbar item', title:'Tip Title'},
            iconCls: 'blist',
            // Menus can be built/referenced by using nested menu config objects
            menu : {					//Button也可以放菜单
                items: [{
                    text: '<b>Bold</b>', handler: onItemClick
                }, {
                    text: '<i>Italic</i>', handler: onItemClick
                }, {
                    text: '<u>Underline</u>', handler: onItemClick
                }, '-', {
                    text: 'Pick a Color',
                    handler: onItemClick,
                    menu: {
                        items: [
                            new Ext.ColorPalette({
                                listeners: {
                                    select: function(cp, color){
                                        Ext.example.msg('Color Selected', 'You chose {0}.', color);
                                    }
                                }
                            }), '-',
                            {
                                text: 'More Colors...',
                                handler: onItemClick
                            }
                        ]
                    }
                }, {
                    text: 'Extellent!',
                    handler: onItemClick
                }]
            }
        }), '-', {
        text: 'Toggle Me',
        enableToggle: true,
        toggleHandler: onItemToggle,
        pressed: true
    });

    // They can also be referenced by id in or components
    tb.add('-', {
        icon: 'list-items.gif', // icons can also be specified inline
        cls: 'x-btn-icon',
        tooltip: '<b>Quick Tips</b><br/>Icon only button with tooltip'
    }, '-');

    var scrollMenu = new Ext.menu.Menu();
    for (var i = 0; i < 50; ++i){
        scrollMenu.add({
            text: 'Item ' + (i + 1)
        });
    }
    // scrollable menu
    tb.add({
        icon: 'preview.png',
        cls: 'x-btn-text-icon',
        text: 'Scrolling Menu',
        menu: scrollMenu
    });

    // add a combobox to the toolbar
    var combo = new Ext.form.ComboBox({
        store: store,
        displayField: 'state',
        typeAhead: true,
        mode: 'local',
        triggerAction: 'all',
        emptyText:'Select a state...',
        selectOnFocus:true,
        width:135
    });
    tb.addField(combo);

    tb.doLayout();

    // functions to display feedback
    function onButtonClick(btn){
        Ext.example.msg('Button Click','You clicked the "{0}" button.', btn.text);
    }

    function onItemClick(item){
        Ext.example.msg('Menu Click', 'You clicked the "{0}" menu item.', item.text);
    }

    function onItemCheck(item, checked){
        Ext.example.msg('Item Check', 'You {1} the "{0}" menu item.', item.text, checked ? 'checked' : 'unchecked');
    }

    function onItemToggle(item, pressed){
        Ext.example.msg('Button Toggled', 'Button "{0}" was toggled to {1}.', item.text, pressed);
    }

});