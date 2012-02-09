package com.xuyuan.ssh.dao.base;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.xuyuan.ssh.common.hibernate.HibernateDao;
import com.xuyuan.ssh.entity.base.User;

/**
 * HibernateDao中封装了基本的CRUD操作.并且使用了泛型.所以在我们自己的业务Dao中如果只是基本的CRUD操作.
 * 那么不需要在这里写任何代码. 
 * 调用方式: 在Service层,直接调用HibernateDao的CRUD方法即可.
 * @author Administrator
 *
 */
@Repository
public class UserDao extends HibernateDao<User>{

	/**
	 * 根据登录名与密码查找对应用户，用于登录验证
	 */
	public List<User> getUser(final String username,final String password){
		return super.createQuery("from User a where a.username = ? and a.password = ?",username,password).list();
	}
}