package com.xuyuan.extjs3.base;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

public class BaseDaoImpl<T> extends HibernateDaoSupport implements BaseDao<T>{

	public List<T> getList(String hql) throws Exception {
		List<T> list = null;
		try {
			 list = (List<T>) this.getHibernateTemplate().find(hql);		
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		return list;
	}

}
