package com.xuyuan.extjs3.tree.bean;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Sort类是我们自己业务需要的树的信息,是存储在数据库中的.
 * Sort其实可以延伸为Department,如果你的部门要求树形结构.
 *
 * 而Tree对象是Ext认识的,Ext是根据Tree对象来构造树的.Tree是不存入数据库的.Tree借用的是Sort的数据来展现真实数据的.
 *
 * 在Dao,Service的编写,我们可以看到用到的类都是Tree对象,即程序真正要实现Ext树,用的是Tree对象,
 * 但是其实后台默默支撑这棵Ext树的数据来源是Sort对象.
 * @author hoojo@csdn
 */
@Entity
@Table(name = "ssh_ext_sort")
public class Sort {

	/**
	 * @uml.property  name="id"
	 */
	private Integer id;
	/**
	 * @uml.property  name="nodeid"
	 */
	private Integer nodeid; //primary key
	/**
	 * @uml.property  name="pid"
	 */
	private Integer pid;
	/**
	 * @uml.property  name="nodelevel"
	 */
	private Integer nodelevel;
	/**
	 * @uml.property  name="bureauid"
	 */
	private Integer bureauid;
	/**
	 * @uml.property  name="labid"
	 */
	private Integer labid;
	/**
	 * @uml.property  name="categoryname"
	 */
	private String categoryname;
	/**
	 * @uml.property  name="show"
	 */
	private boolean show;
	/**
	 * @uml.property  name="type"
	 */
	private String type;

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
	 * @uml.property  name="nodeid"
	 */
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
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
	 * @uml.property  name="bureauid"
	 */
	public Integer getBureauid() {
		return bureauid;
	}

	/**
	 * @param bureauid
	 * @uml.property  name="bureauid"
	 */
	public void setBureauid(Integer bureauid) {
		this.bureauid = bureauid;
	}

	/**
	 * @return
	 * @uml.property  name="labid"
	 */
	public Integer getLabid() {
		return labid;
	}

	/**
	 * @param labid
	 * @uml.property  name="labid"
	 */
	public void setLabid(Integer labid) {
		this.labid = labid;
	}

	/**
	 * @return
	 * @uml.property  name="categoryname"
	 */
	public String getCategoryname() {
		return categoryname;
	}

	/**
	 * @param categoryname
	 * @uml.property  name="categoryname"
	 */
	public void setCategoryname(String categoryname) {
		this.categoryname = categoryname;
	}

	/**
	 * @return
	 * @uml.property  name="show"
	 */
	public boolean isShow() {
		return show;
	}

	/**
	 * @param show
	 * @uml.property  name="show"
	 */
	public void setShow(boolean show) {
		this.show = show;
	}

	/**
	 * @return
	 * @uml.property  name="type"
	 */
	public String getType() {
		return type;
	}

	/**
	 * @param type
	 * @uml.property  name="type"
	 */
	public void setType(String type) {
		this.type = type;
	}

}
