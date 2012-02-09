package com.xuyuan.ssh.dao.base;

import org.springframework.stereotype.Repository;

import com.xuyuan.ssh.common.hibernate.HibernateDao;
import com.xuyuan.ssh.entity.base.Role;

@Repository
public class RoleDao extends HibernateDao<Role>{

	/**
	 * 父类中已经有该方法了,子类可以不用写代码.在Service层直接调用父类的方法.
	 * 如果父类中封装的比较好,基本的CRUD都有了,那么Dao层代码基本不要写.除非有其他业务逻辑,需要添加代码.
	 */
	/**
	public List<Role> getRoles(){
		return super.getAll();
	}
	*/
}
