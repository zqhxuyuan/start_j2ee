package com.xuyuan.search.compass.dao;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.xuyuan.search.compass.model.Article;

@Repository
public class ArticleDAO extends HibernateDaoSupport{

	public void save(Article article) {
		this.getHibernateTemplate().save(article);
	}

}
