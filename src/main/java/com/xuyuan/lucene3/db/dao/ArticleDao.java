package com.xuyuan.lucene3.db.dao;

import java.util.ArrayList;
import java.util.List;

import com.xuyuan.lucene3.db.model.Article;

/**
 * Article的CRUD数据库操作
 * @author Administrator
 *
 */
public class ArticleDao {

	public List<Article> getArticles() {
		//get data from database,here demonstrate data by static code
		//and if get data from db,applicationContext's config of articleDao should ref to dataSource.
		List<Article> list = new ArrayList<Article>();
		list.add(new Article(1,"java","Java in action","This is java in action book."));
		list.add(new Article(2,"java","Java tutorial","Tutorial book by java offical team.you should not miss it."));
		list.add(new Article(3,"java","Learning java","Famous book written by zqhxuyuan.it got five star on amazon store."));
		list.add(new Article(4,"ruby","Learning ruby","If you want learn how to wirte beautiful code,you should learn ruby."));
		list.add(new Article(5,"ruby","Ruby on Rails","It's a famous web framework written by ruby.and it's popular on opensource community."));
		return list;
    }
}
