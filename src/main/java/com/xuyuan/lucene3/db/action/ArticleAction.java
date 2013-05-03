package com.xuyuan.lucene3.db.action;

import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork2.ActionSupport;
import com.xuyuan.lucene3.db.model.Article;
import com.xuyuan.lucene3.db.service.ArticleService;

/**
 * 1.模拟索引创建的过程: 当INDEXPATH中不存在文件,则创建索引,否则说明已经有索引文件存在了.
 * 2.模拟搜索索引文件:根据title字段,匹配数据库中的title,content
 *
 * TODO 实际应用中,可能索引是增量创建的,所以不能用是否有文件存在来判断是否创建索引.
 * 而且由于是增量创建的,ArticleService中也不能调用articleDAO.getArticles()每次都是重新创建索引.
 * http://jushi1988.iteye.com/blog/693188
 */
public class ArticleAction extends ActionSupport{
	private static final long serialVersionUID = 1L;

	/**
	 * @uml.property  name="articleService"
	 * @uml.associationEnd  
	 */
	private ArticleService articleService;
	/**
	 * @uml.property  name="title"
	 */
	private String title; //搜索条件
	/**
	 * @uml.property  name="list"
	 */
	private List<Article> list = new ArrayList<Article>(); //搜索结果
	/**
	 * @uml.property  name="totalHits"
	 */
	private Integer totalHits = 0; //搜索结果数量

	public String execute() throws Exception{
		if(articleService.createIndex()){
			list = articleService.getArticles(title,"title");
			//list = articleService.getArticles(title,new String[]{"title","content"});

			if(null != list && list.size() > 0){
				totalHits = list.size();
			}
		}
		return SUCCESS;
	}

	/**
	 * @return
	 * @uml.property  name="articleService"
	 */
	public ArticleService getArticleService() {
		return articleService;
	}
	/**
	 * @param articleService
	 * @uml.property  name="articleService"
	 */
	public void setArticleService(ArticleService articleService) {
		this.articleService = articleService;
	}

	/**
	 * @return
	 * @uml.property  name="title"
	 */
	public String getTitle() {
		return title;
	}
	/**
	 * @param title
	 * @uml.property  name="title"
	 */
	public void setTitle(String title) {
		this.title = title;
	}

	public List<Article> getList() {
		return list;
	}
	public void setList(List<Article> list) {
		this.list = list;
	}

	/**
	 * @return
	 * @uml.property  name="totalHits"
	 */
	public Integer getTotalHits() {
		return totalHits;
	}
	/**
	 * @param totalHits
	 * @uml.property  name="totalHits"
	 */
	public void setTotalHits(Integer totalHits) {
		this.totalHits = totalHits;
	}

}
