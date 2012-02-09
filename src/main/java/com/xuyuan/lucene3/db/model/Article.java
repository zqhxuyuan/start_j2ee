package com.xuyuan.lucene3.db.model;

public class Article {

	private Integer id;
	private String tag;
	private String title;
	private String content;

	//private Integer totalHits;

	public Article(){
	}

	public Article(Integer id, String tag, String title, String content) {
		this.id = id;
		this.tag = tag;
		this.title = title;
		this.content = content;
	}

	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
//	public Integer getTotalHits() {
//		return totalHits;
//	}
//	public void setTotalHits(Integer totalHits) {
//		this.totalHits = totalHits;
//	}


}
