package com.xuyuan.extjs3.tree.bean;

import java.util.ArrayList;
import java.util.List;

/**
 * Tree对象的构造,除了Ext认识的三个属性.
 * 因为要和数据库真正存储的对象Sort相互关联.还需要定义一些和Sort对象一样的属性.
 * 
 * 当然不是所有的Sort属性都要在Tree对象中用到.但是一些基本的要用到:id,nodeid,nodelevel,pid
 * @author Administrator
 *
 */
public class Tree {

	//ExtJS的Tree的固定属性.Ext需要这三个属性才能加载树
	private String text;
	private boolean leaf;
	//private List<Sort> children = new ArrayList<Sort>();
	private List<Tree> children = new ArrayList<Tree>();
	
	private Integer id;
	private Integer nodelevel;
	private Integer nodeid;
	private Integer pid;
	
	//private String uiProvider = "col";
	
	public Tree(){
	}

	public Tree(String text, Integer id, Integer nodeid, Integer pid,Integer nodelevel) {
		this.text = text;
		this.id = id;
		this.nodelevel = nodelevel;
		this.nodeid = nodeid;
		this.pid = pid;
		//层的限制??
		//org.springframework.orm.hibernate3.HibernateQueryException: could not instantiate class [com.xuyuan.ssh_ext.bean.Tree] from tuple; nested exception is org.hibernate.QueryException: could not instantiate class [com.xuyuan.ssh_ext.bean.Tree] from tuple
//		if (nodelevel < 3) {
//			this.leaf = false;
//		} else {
//			this.leaf = true;
//		}
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public boolean isLeaf() {
		return leaf;
	}

	public void setLeaf(boolean leaf) {
		this.leaf = leaf;
	}

	public List<Tree> getChildren() {
		return children;
	}

	public void setChildren(List<Tree> children) {
		this.children = children;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getNodelevel() {
		return nodelevel;
	}

	public void setNodelevel(Integer nodelevel) {
		this.nodelevel = nodelevel;
	}

	public Integer getNodeid() {
		return nodeid;
	}

	public void setNodeid(Integer nodeid) {
		this.nodeid = nodeid;
	}

	public Integer getPid() {
		return pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}
	


}
