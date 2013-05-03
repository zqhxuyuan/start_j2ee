package com.xuyuan.search.solr;

import java.io.Serializable;

import org.apache.solr.client.solrj.beans.Field;

public class User implements Serializable {
    private static final long serialVersionUID = 8606788203814942679L;
 
    //@Field
    /**
	 * @uml.property  name="id"
	 */
    private int id;
    /**
	 * @uml.property  name="name"
	 */
    @Field
    private String name;
    /**
	 * @uml.property  name="age"
	 */
    @Field
    private int age;
    
    /**
	 * 可以给某个属性重命名，likes就是solr index的属性；在solrIndex中将显示like为likes
	 * @uml.property  name="like" multiplicity="(0 -1)" dimension="1"
	 */
    @Field("likes")
    private String[] like;
    /**
	 * @uml.property  name="address"
	 */
    @Field
    private String address;
    /**
	 * @uml.property  name="sex"
	 */
    @Field
    private String sex;
    /**
	 * @uml.property  name="remark"
	 */
    @Field
    private String remark;
    /**
	 * @return
	 * @uml.property  name="id"
	 */
    public int getId() {
        return id;
    }
    
    /**
	 * @param id
	 * @uml.property  name="id"
	 */
    @Field
    public void setId(int id) {
        this.id = id;
    }
    /**
	 * @return
	 * @uml.property  name="name"
	 */
    public String getName() {
        return name;
    }
    //getter、setter
    
    @Override
    public String toString() {
        return this.id + "#" + this.name + "#" + this.age + "#" + this.like + "#" + this.address + "#" + this.sex + "#" + this.remark;
    }

	/**
	 * @return
	 * @uml.property  name="age"
	 */
	public int getAge() {
		return age;
	}

	/**
	 * @param age
	 * @uml.property  name="age"
	 */
	public void setAge(int age) {
		this.age = age;
	}

	/**
	 * @return
	 * @uml.property  name="like"
	 */
	public String[] getLike() {
		return like;
	}

	/**
	 * @param like
	 * @uml.property  name="like"
	 */
	public void setLike(String[] like) {
		this.like = like;
	}

	/**
	 * @return
	 * @uml.property  name="address"
	 */
	public String getAddress() {
		return address;
	}

	/**
	 * @param address
	 * @uml.property  name="address"
	 */
	public void setAddress(String address) {
		this.address = address;
	}

	/**
	 * @return
	 * @uml.property  name="sex"
	 */
	public String getSex() {
		return sex;
	}

	/**
	 * @param sex
	 * @uml.property  name="sex"
	 */
	public void setSex(String sex) {
		this.sex = sex;
	}

	/**
	 * @return
	 * @uml.property  name="remark"
	 */
	public String getRemark() {
		return remark;
	}

	/**
	 * @param remark
	 * @uml.property  name="remark"
	 */
	public void setRemark(String remark) {
		this.remark = remark;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	/**
	 * @param name
	 * @uml.property  name="name"
	 */
	public void setName(String name) {
		this.name = name;
	}
}
