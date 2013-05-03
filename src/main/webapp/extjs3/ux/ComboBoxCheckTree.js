
Ext.ux.ComboBoxCheckTree = function() {
	this.treeId = Ext.id() + '-tree';
	this.maxHeight = arguments[0].maxHeight || arguments[0].height
			|| this.maxHeight;
	this.tpl = new Ext.Template('<tpl for="."><div style="height:'
			+ this.maxHeight + 'px"><div id="' + this.treeId
			+ '"></div></div></tpl>');
	this.store = new Ext.data.SimpleStore({
		fields : [],
		data : [[]]
	});
	this.selectedClass = '';
	this.mode = 'local';
	this.triggerAction = 'all';
	this.onSelect = Ext.emptyFn;
	this.editable = false;
	this.selectValueModel = 'leaf';

	Ext.ux.ComboBoxCheckTree.superclass.constructor.apply(this, arguments);
}

Ext.extend(Ext.ux.ComboBoxCheckTree, Ext.form.ComboBox, {

	checkField : 'checked',
	separator : ',',
	initEvents : function() {
		Ext.ux.ComboBoxCheckTree.superclass.initEvents.apply(this, arguments);
		this.keyNav.tab = false;

	},

	initComponent : function() {
		this.on({
			scope : this
		});

	},
	expand : function() {
		Ext.ux.ComboBoxCheckTree.superclass.expand.call(this);
		if (!this.tree.rendered) {
			this.tree.height = this.maxHeight;
			this.tree.border = false;
			this.tree.autoScroll = true;
			if (this.tree.xtype) {
				this.tree = Ext.ComponentMgr.create(this.tree, this.tree.xtype);
			}
			this.tree.render(this.treeId);
			var combox = this;
			this.tree.on('check', function(node, checked) {
				combox.setValue();
			});
			var root = this.tree.getRootNode();
			if (!root.isLoaded())
				root.reload();
		}
	},

	setValue : function() {

		var values = [];
		var texts = [];
		var root = this.tree.getRootNode();

		var checkedNodes = this.tree.getChecked();
		for (var i = 0; i < checkedNodes.length; i++) {
			var node = checkedNodes[i];
			if (this.selectValueModel == 'all'
					|| (this.selectValueModel == 'leaf' && node.isLeaf())
					|| (this.selectValueModel == 'folder' && !node.isLeaf())) {
				values.push(node.id);
				texts.push(node.text);
			}
		}

		this.value = values.join(this.separator);
		this.setRawValue(texts.join(this.separator));
		if (this.hiddenField) {
			this.hiddenField.value = this.value;
		}

	},

	getValue : function() {
		return this.value || '';
	},
	
	clearValue : function() {
		this.value = '';
		this.setRawValue(this.value);
		if (this.hiddenField) {
			this.hiddenField.value = '';
		}

		this.tree.getSelectionModel().clearSelections();
	}
});

Ext.reg('combochecktree', Ext.ux.ComboBoxCheckTree);