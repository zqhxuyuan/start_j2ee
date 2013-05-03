package com.xuyuan.ssh.entity.base;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.TableGenerator;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

@Entity
@Table(name = "ssh_role")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Role implements Serializable{

	/**
	 * @uml.property  name="id"
	 */
	private Integer id; //主键
	/**
	 * @uml.property  name="name"
	 */
	private String name; //角色名称
	
	/**
	 * @return
	 * @uml.property  name="id"
	 */
	@Id
	@TableGenerator(name="tab_stone",table="generator_table",pkColumnName = "g_key",valueColumnName = "g_value",pkColumnValue="ssh_role_pk",allocationSize=1)
	@GeneratedValue(strategy = GenerationType.TABLE,generator="tab_stone")
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
	 * @uml.property  name="name"
	 */
	public String getName() {
		return name;
	}
	/**
	 * @param name
	 * @uml.property  name="name"
	 */
	public void setName(String name) {
		this.name = name;
	}
}
