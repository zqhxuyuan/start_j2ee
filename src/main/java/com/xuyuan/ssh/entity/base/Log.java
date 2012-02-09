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

	private Integer id; //主键
	private Integer userid;//登陆用户名
	private String loginname; //登录名
	private String methodname; //操作方法
	private String model; //模块
	private Timestamp logtime; //时间戳
	private Boolean success; //登陆成功或失败;执行成功或失败
	
	@Id
    @TableGenerator(name="tab_stone",table="generator_table",pkColumnName = "g_key",valueColumnName = "g_value",pkColumnValue="ssh_log_pk",allocationSize=1)
	@GeneratedValue(strategy = GenerationType.TABLE,generator="tab_stone")
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getLoginname() {
		return loginname;
	}
	public void setLoginname(String loginname) {
		this.loginname = loginname;
	}
	public Timestamp getLogtime() {
		return logtime;
	}
	public void setLogtime(Timestamp logtime) {
		this.logtime = logtime;
	}
	public String getMethodname() {
		return methodname;
	}
	public void setMethodname(String methodname) {
		this.methodname = methodname;
	}
	public Integer getUserid() {
		return userid;
	}
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public Boolean getSuccess() {
		return success;
	}
	public void setSuccess(Boolean success) {
		this.success = success;
	}
	
}
