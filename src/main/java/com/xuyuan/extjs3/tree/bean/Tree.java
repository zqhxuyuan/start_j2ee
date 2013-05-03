package com.xuyuan.extjs3.tree.bean;

import java.util.ArrayList;
import java.util.List;

/**
 * Tree对象的构造,除了Ext认识的三个属性.
 * 因为要和数据库真正存储的对象Sort相互关联.还需要定义一些和Sort对象一样的属性.
 *
 * 当然不是所有的Sort属性都要在Tree对象中用到.但是一些基本的要用到:id,nodeid,nodelevel,pid
 * @author hoojo@csdn
 *
 */
public class Tree {

	//ExtJS的Tree的固定属性.Ext需要这三个属性才能加载树
	/**
	 * @uml.property  name="text"
	 */
	private String text;
	/**
	 * @uml.property  name="leaf"
	 */
	private boolean leaf;
	//private List<Sort> children = new ArrayList<Sort>();
	/**
	 * @uml.property  name="children"
	 */
	private List<Tree> children = new ArrayList<Tree>();

	/**
	 * @uml.property  name="id"
	 */
	private Integer id;
	/**
	 * @uml.property  name="nodelevel"
	 */
	private Integer nodelevel;
	/**
	 * @uml.property  name="nodeid"
	 */
	private Integer nodeid;
	/**
	 * @uml.property  name="pid"
	 */
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

	/**
	 * @return
	 * @uml.property  name="text"
	 */
	public String getText() {
		return text;
	}

	/**
	 * @param text
	 * @uml.property  name="text"
	 */
	public void setText(String text) {
		this.text = text;
	}

	/**
	 * @return
	 * @uml.property  name="leaf"
	 */
	public boolean isLeaf() {
		return leaf;
	}

	/**
	 * @param leaf
	 * @uml.property  name="leaf"
	 */
	public void setLeaf(boolean leaf) {
		this.leaf = leaf;
	}

	public List<Tree> getChildren() {
		return children;
	}

	public void setChildren(List<Tree> children) {
		this.children = children;
	}

	/**
	 * @return
	 * @uml.property  name="id"
	 */
	public Integer getId() {
		return id;
	}

	/**
	 * @param id
	 * @uml.property  name="id"
	 */
	public void setId(Integer id) {
		this.id = id;
	}

	/**
	 * @return
	 * @uml.property  name="nodelevel"
	 */
	public Integer getNodelevel() {
		return nodelevel;
	}

	/**
	 * @param nodelevel
	 * @uml.property  name="nodelevel"
	 */
	public void setNodelevel(Integer nodelevel) {
		this.nodelevel = nodelevel;
	}

	/**
	 * @return
	 * @uml.property  name="nodeid"
	 */
	public Integer getNodeid() {
		return nodeid;
	}

	/**
	 * @param nodeid
	 * @uml.property  name="nodeid"
	 */
	public void setNodeid(Integer nodeid) {
		this.nodeid = nodeid;
	}

	/**
	 * @return
	 * @uml.property  name="pid"
	 */
	public Integer getPid() {
		return pid;
	}

	/**
	 * @param pid
	 * @uml.property  name="pid"
	 */
	public void setPid(Integer pid) {
		this.pid = pid;
	}



}
