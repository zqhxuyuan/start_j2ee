package com.xuyuan.search.compass.dao;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.xuyuan.search.compass.model.Author;

@Repository
public class AuthorDAO extends HibernateDaoSupport{

	public void save(Author author) {
		this.getHibernateTemplate().save(author);
	}

}
