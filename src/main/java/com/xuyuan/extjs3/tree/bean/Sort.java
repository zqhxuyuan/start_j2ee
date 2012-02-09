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
 * @author Administrator
 */
@Entity
@Table(name = "ssh_ext_sort")
public class Sort {

	private Integer id;
	private Integer nodeid; //primary key
	private Integer pid;
	private Integer nodelevel;
	private Integer bureauid;
	private Integer labid;
	private String categoryname;
	private boolean show;
	private String type;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
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

	public Integer getNodelevel() {
		return nodelevel;
	}

	public void setNodelevel(Integer nodelevel) {
		this.nodelevel = nodelevel;
	}

	public Integer getBureauid() {
		return bureauid;
	}

	public void setBureauid(Integer bureauid) {
		this.bureauid = bureauid;
	}

	public Integer getLabid() {
		return labid;
	}

	public void setLabid(Integer labid) {
		this.labid = labid;
	}

	public String getCategoryname() {
		return categoryname;
	}

	public void setCategoryname(String categoryname) {
		this.categoryname = categoryname;
	}

	public boolean isShow() {
		return show;
	}

	public void setShow(boolean show) {
		this.show = show;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

}
