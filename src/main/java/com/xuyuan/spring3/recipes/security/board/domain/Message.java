package com.xuyuan.spring3.recipes.security.board.domain;

public class Message {

	/**
	 * @uml.property  name="id"
	 */
	private Long id; 
    /**
	 * @uml.property  name="author"
	 */
    private String author; 
    /**
	 * @uml.property  name="title"
	 */
    private String title; 
    /**
	 * @uml.property  name="body"
	 */
    private String body;
	/**
	 * @return
	 * @uml.property  name="id"
	 */
	public Long getId() {
		return id;
	}
	/**
	 * @param id
	 * @uml.property  name="id"
	 */
	public void setId(Long id) {
		this.id = id;
	}
	/**
	 * @return
	 * @uml.property  name="author"
	 */
	public String getAuthor() {
		return author;
	}
	/**
	 * @param author
	 * @uml.property  name="author"
	 */
	public void setAuthor(String author) {
		this.author = author;
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
	 * @uml.property  name="body"
	 */
	public String getBody() {
		return body;
	}
	/**
	 * @param body
	 * @uml.property  name="body"
	 */
	public void setBody(String body) {
		this.body = body;
	} 
    
}
