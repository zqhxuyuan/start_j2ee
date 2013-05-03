package com.xuyuan.extjs3.tree.action;

import java.util.List;

import net.sf.json.JSONArray;

import com.xuyuan.extjs3.tree.bean.Tree;
import com.xuyuan.extjs3.tree.service.TreeService;

/**
 * Struts2、Spring、Hibernate整合ExtJS
 * http://www.cnblogs.com/hoojo/archive/2011/01/07/1929577.html
 *
 * http://localhost:8888/start_j2ee/treedemo.action
 * @author Administrator
 *
 */
public class TreeDemoAction{
	private static final long serialVersionUID = -3795544890686836966L;

	/**
	 * @uml.property  name="jsonString"
	 */
	private String jsonString;
	/**
	 * @uml.property  name="tree"
	 * @uml.associationEnd  multiplicity="(1 1)"
	 */
	private Tree tree = new Tree();
	/**
	 * @uml.property  name="treeService"
	 * @uml.associationEnd  
	 */
	private TreeService<Tree> treeService;

	public String execute() throws Exception {
		treeService.getTreeByParentId2Recursion(tree);
		jsonString = JSONArray.fromObject(tree.getChildren()).toString();

		this.test(tree.getChildren());
		return "success";
	}

	public void test(List<Tree> childs){
		if(childs.size() > 0){
			for(Tree c : childs){
				System.out.println(c.getText() + ":" +c.getChildren().size());
				this.test(c.getChildren());
			}
		}
	}

	/**
	 * @return
	 * @uml.property  name="jsonString"
	 */
	public String getJsonString() {
		return jsonString;
	}
	/**
	 * @param jsonString
	 * @uml.property  name="jsonString"
	 */
	public void setJsonString(String jsonString) {
		this.jsonString = jsonString;
	}

	/**
	 * @return
	 * @uml.property  name="tree"
	 */
	public Tree getTree() {
		return tree;
	}
	/**
	 * @param tree
	 * @uml.property  name="tree"
	 */
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

