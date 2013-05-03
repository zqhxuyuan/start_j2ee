package com.xuyuan.lucene3.db.service;

import java.io.File;
import java.util.List;

import com.xuyuan.lucene3.db.dao.ArticleDao;
import com.xuyuan.lucene3.db.dao.ArticleIndexDao;
import com.xuyuan.lucene3.db.model.Article;
import com.xuyuan.util.Config;

public class ArticleService {

	/**
	 * @uml.property  name="articleDao"
	 * @uml.associationEnd  
	 */
	private ArticleDao articleDao;
	/**
	 * @uml.property  name="articleIndexDao"
	 * @uml.associationEnd  
	 */
	private ArticleIndexDao articleIndexDao;

	/**
	 * @uml.property  name="iNDEXPATH"
	 */
	String INDEXPATH = Config.INDEXPATH;

	/**
	 * 创建索引: 从数据库中获取所有的Article,对这些数据转换为Lucene认识的Document对象,然后调用Lucene的API创建索引.
	 */
	public boolean createIndex(){
		if(this.isIndexExisted()) return this.isIndexExisted();
		List<Article> list = articleDao.getArticles();
		try {
			articleIndexDao.batchSave(list);
			return true;
		} catch (Exception e1) {
			e1.printStackTrace();
			return false;
		}
	}

	/**
	 * 根据查询字符串对索引进行搜索.
	 * @param querystr 查询结果文章列表
	 * @return
	 */
	public List<Article> getArticles(String queryStr,String... queryField) throws Exception{
		return articleIndexDao.searchAll(queryStr, queryField);
	}

	/**
	 * 检查索引文件是否存在
	 */
	private boolean isIndexExisted() {
		try {
			File dir = new File(INDEXPATH);
			if(dir.listFiles().length>0)
				return true;
			else
				return false;
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}

	/**
	 * @return
	 * @uml.property  name="articleDao"
	 */
	public ArticleDao getArticleDao() {
		return articleDao;
	}
	/**
	 * @param articleDao
	 * @uml.property  name="articleDao"
	 */
	public void setArticleDao(ArticleDao articleDao) {
		this.articleDao = articleDao;
	}

	/**
	 * @return
	 * @uml.property  name="articleIndexDao"
	 */
	public ArticleIndexDao getArticleIndexDao() {
		return articleIndexDao;
	}
	/**
	 * @param articleIndexDao
	 * @uml.property  name="articleIndexDao"
	 */
	public void setArticleIndexDao(ArticleIndexDao articleIndexDao) {
		this.articleIndexDao = articleIndexDao;
	}
}
