package com.xuyuan.lucene3.db.model;

public class Article {

	/**
	 * @uml.property  name="id"
	 */
	private Integer id;
	/**
	 * @uml.property  name="tag"
	 */
	private String tag;
	/**
	 * @uml.property  name="title"
	 */
	private String title;
	/**
	 * @uml.property  name="content"
	 */
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

	/**
	 * @return
	 * @uml.property  name="id"
	 */
	public Integer getId() {
		return id;
	}
	/**
	 * @param id
	 * @uml.property  name="id"
	 */
	public void setId(Integer id) {
		this.id = id;
	}
	/**
	 * @return
	 * @uml.property  name="tag"
	 */
	public String getTag() {
		return tag;
	}
	/**
	 * @param tag
	 * @uml.property  name="tag"
	 */
	public void setTag(String tag) {
		this.tag = tag;
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
	/**
	 * @return
	 * @uml.property  name="content"
	 */
	public String getContent() {
		return content;
	}
	/**
	 * @param content
	 * @uml.property  name="content"
	 */
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
