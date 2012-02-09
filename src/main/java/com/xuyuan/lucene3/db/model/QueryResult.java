package com.xuyuan.lucene3.db.model;

import java.util.List;

/**
 * 描述某一页的检索结果集
 * @author Administrator
 *
 */
public class QueryResult {

	private int totalCount; /* 匹配的总记录数 */
	private List<Article> atrticle; /* 检索到的文章对象集合 */

	public QueryResult(int totalCount, List<Article> atrticle) {
		this.totalCount = totalCount;
		this.atrticle = atrticle;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public List<Article> getAtrticle() {
		return atrticle;
	}
	public void setAtrticle(List<Article> atrticle) {
		this.atrticle = atrticle;
	}
}
