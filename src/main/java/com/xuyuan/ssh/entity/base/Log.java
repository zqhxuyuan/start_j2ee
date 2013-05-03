package com.xuyuan.ssh.entity.base;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.TableGenerator;

@Entity
@Table(name = "ssh_log")
public class Log implements Serializable{

	/**
	 * @uml.property  name="id"
	 */
	private Integer id; //主键
	/**
	 * @uml.property  name="userid"
	 */
	private Integer userid;//登陆用户名
	/**
	 * @uml.property  name="loginname"
	 */
	private String loginname; //登录名
	/**
	 * @uml.property  name="methodname"
	 */
	private String methodname; //操作方法
	/**
	 * @uml.property  name="model"
	 */
	private String model; //模块
	/**
	 * @uml.property  name="logtime"
	 */
	private Timestamp logtime; //时间戳
	/**
	 * @uml.property  name="success"
	 */
	private Boolean success; //登陆成功或失败;执行成功或失败
	
	/**
	 * @return
	 * @uml.property  name="id"
	 */
	@Id
    @TableGenerator(name="tab_stone",table="generator_table",pkColumnName = "g_key",valueColumnName = "g_value",pkColumnValue="ssh_log_pk",allocationSize=1)
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
	 * @uml.property  name="loginname"
	 */
	public String getLoginname() {
		return loginname;
	}
	/**
	 * @param loginname
	 * @uml.property  name="loginname"
	 */
	public void setLoginname(String loginname) {
		this.loginname = loginname;
	}
	/**
	 * @return
	 * @uml.property  name="logtime"
	 */
	public Timestamp getLogtime() {
		return logtime;
	}
	/**
	 * @param logtime
	 * @uml.property  name="logtime"
	 */
	public void setLogtime(Timestamp logtime) {
		this.logtime = logtime;
	}
	/**
	 * @return
	 * @uml.property  name="methodname"
	 */
	public String getMethodname() {
		return methodname;
	}
	/**
	 * @param methodname
	 * @uml.property  name="methodname"
	 */
	public void setMethodname(String methodname) {
		this.methodname = methodname;
	}
	/**
	 * @return
	 * @uml.property  name="userid"
	 */
	public Integer getUserid() {
		return userid;
	}
	/**
	 * @param userid
	 * @uml.property  name="userid"
	 */
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
	/**
	 * @return
	 * @uml.property  name="model"
	 */
	public String getModel() {
		return model;
	}
	/**
	 * @param model
	 * @uml.property  name="model"
	 */
	public void setModel(String model) {
		this.model = model;
	}
	public Boolean getSuccess() {
		return success;
	}
	/**
	 * @param success
	 * @uml.property  name="success"
	 */
	public void setSuccess(Boolean success) {
		this.success = success;
	}
	
}
