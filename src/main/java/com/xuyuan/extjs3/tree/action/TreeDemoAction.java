package com.xuyuan.extjs3.tree.action;

import net.sf.json.JSONArray;

import com.xuyuan.extjs3.tree.bean.Tree;
import com.xuyuan.extjs3.tree.service.TreeService;

/**
 * Struts2、Spring、Hibernate整合ExtJS
 *
 * *****Ext Tree DEMO:*****
 * http://localhost:8080/start_j2ee/treedemo.action
	[
		{"children":[
			{"children":[],"id":2,"leaf":true,"nodeid":2,"nodelevel":0,"pid":1,"text":"湖里"},
			{"children":[],"id":3,"leaf":true,"nodeid":3,"nodelevel":0,"pid":1,"text":"思明"}
		],"id":1,"leaf":false,"nodeid":1,"nodelevel":0,"pid":0,"text":"厦门"},
		{"children":[
			{"children":[],"id":5,"leaf":true,"nodeid":5,"nodelevel":0,"pid":4,"text":"晋安"}
		],"id":4,"leaf":false,"nodeid":4,"nodelevel":0,"pid":0,"text":"福州"}
	]

* @author http://www.cnblogs.com/hoojo/archive/2011/01/07/1929577.html
 */
public class TreeDemoAction{
	private static final long serialVersionUID = -3795544890686836966L;

	private String jsonString;
	private Tree tree = new Tree();
	private TreeService<Tree> treeService;

	public String execute() throws Exception {
		treeService.getTreeByParentId2Recursion(tree);
		jsonString = JSONArray.fromObject(tree.getChildren()).toString();
		return "success";
	}

	public String getJsonString() {
		return jsonString;
	}
	public void setJsonString(String jsonString) {
		this.jsonString = jsonString;
	}

	public Tree getTree() {
		return tree;
	}
	public void setTree(Tree tree) {
		this.tree = tree;
	}

	public TreeService<Tree> getTreeService() {
		return treeService;
	}

	public void setTreeService(TreeService<Tree> treeService) {
		this.treeService = treeService;
	}
}

