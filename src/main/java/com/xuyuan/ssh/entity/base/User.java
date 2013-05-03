package com.xuyuan.ssh.entity.base;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OrderBy;
import javax.persistence.Table;
import javax.persistence.TableGenerator;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

@Entity
@Table(name = "ssh_user")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class User implements Serializable{
	private static final long serialVersionUID = 1L;

	/**
	 * @uml.property  name="id"
	 */
	private Integer id; //主键
	/**
	 * @uml.property  name="username"
	 */
	private String username; //登录用户名
	/**
	 * @uml.property  name="password"
	 */
	private String password; //登陆密码

	/**
	 * @uml.property  name="role"
	 * @uml.associationEnd  
	 */
	private Role role; //角色ID.从用户看:一个用户对应一个角色;从角色看:一个角色对应多个用户.即多个用户对应一个角色.关联关系放在多的一端使用ManyToOne

	//private List<Role> roles = new ArrayList<Role>();//角色列表.一个角色对应多个用户,同时一个用户对应多个角色.

	/**
	 * @TableGenerator  表生成器，将当前主键的值单独保存到一个数据库表中，主键的值每次都是从指定的表中查询来获得  这种方法生成主键的策略可以适用于任何数据库，不必担心不同数据库不兼容造成的问题,更换数据库不会造成很大的问题.  name:该表主键生成策略的名称,被@GeneratedValue的generator引用  table: 表生成策略所持久化的表名,一个管理其它表主键的表  pkColumnName：表生成器中的列名，用来存放其它表的主键键名，这个列名是与表中的字段对应的  valueColumnName：表生成器中的列名，实体表主键的下一个值，假设USER表中的ID最大为2，那么此时，生成器表中与实体表主键对应的键名值则为3  pkColumnValue：实体表所对应到生成器表中的主键名，可以自定义  allocationSize：表示每次主键值增加的大小
	 * @GeneratedValue  ：定义主键生成策略，这里因为使用的是TableGenerator,所以主键的生成策略为GenerationType.TABLE  创建数据库表--主键生成策略表:  CREATE TABLE GENERATOR_TABLE(  G_KEY varchar(20) null,  G_VALUE int null,  CONSTRAINT PK_GENERATOR_TABLE PRIMARY KEY (G_KEY)  )  INSERT INTO GENERATOR_TABLE VALUES(SSH_USER_PK,1)  ORACLE主键生成策略:Oracle不支持identity自动增长，要想使用它，还得在数据库中创建一个序列  strategy = GenerationType.AUTO或strategy = GenerationType.SEQUENCE  使用AUTO或是IDENTITY生成策略:MS SQLS，主键要加上identity标识，如identity(1,1)  AUTO策略:根据不同的数据库选择最合适的自增主键生成策略。  MySQL，主键要定义AUTO_INCREMENT  Oracle，要创建Sequence来实现自增
	 * @uml.property  name="id"
	 */
	@Id
	@TableGenerator(name="tab_stone",table="generator_table",pkColumnName = "g_key",valueColumnName = "g_value",pkColumnValue="ssh_user_pk",allocationSize=1)
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
	 * @uml.property  name="username"
	 */
	public String getUsername() {
		return username;
	}
	/**
	 * @param username
	 * @uml.property  name="username"
	 */
	public void setUsername(String username) {
		this.username = username;
	}
	/**
	 * @return
	 * @uml.property  name="password"
	 */
	public String getPassword() {
		return password;
	}
	/**
	 * @param password
	 * @uml.property  name="password"
	 */
	public void setPassword(String password) {
		this.password = password;
	}
	/**
	 * 一个角色可以对应多个人员,role_id是user表的字段,存的就是role表id的值. 延迟加载策略:当取得User对象，但又不想取Role中的信息，这时User对象中的role属性是代理状态。Role对象中的值都是空的。 只有当你使用role.id或role.name进行取值的时候，hibernate才会去数据库中查找对应的记录，因此在一定程度上降低了资源消耗.前提:配置了OpenSessionInViewFilter过滤器.
	 * @uml.property  name="role"
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "role_id")
	public Role getRole() {
		return role;
	}
	/**
	 * @param role
	 * @uml.property  name="role"
	 */
	public void setRole(Role role) {
		this.role = role;
	}

	/**
	 * 一个人员也有多个角色的情况,就变成了多对多的关系.这时候可以使用生成中间表.(是否可以使用角色id逗号分隔存储在user表中?)
	 * 实体属性改为:List<Role> roles. 建立中间表,则User表不需要role_id字段.用户对应的角色是存储在中间表中.
	 * 这种方式查用户的角色时,需要关联用户id到中间表去获取角色id列表.
	 */
//	@ManyToMany
//	@JoinTable(name = "ssh_user_role", joinColumns = { @JoinColumn(name = "userid") }, inverseJoinColumns = { @JoinColumn(name = "roleid") })
//	@Fetch(FetchMode.SUBSELECT)
//	@OrderBy("id")
//	public List<Role> getRoles() {
//		return roles;
//	}
//	public void setRoles(List<Role> roles) {
//		this.roles = roles;
//	}


}
