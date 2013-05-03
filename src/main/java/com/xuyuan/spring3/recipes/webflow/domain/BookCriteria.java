package com.xuyuan.spring3.recipes.webflow.domain;

import java.io.Serializable;

public class BookCriteria implements Serializable { 
	 
    /**
	 * @uml.property  name="keyword"
	 */
    private String keyword; 
    /**
	 * @uml.property  name="author"
	 */
    private String author;
    
	/**
	 * @return
	 * @uml.property  name="keyword"
	 */
	public String getKeyword() {
		return keyword;
	}
	/**
	 * @param keyword
	 * @uml.property  name="keyword"
	 */
	public void setKeyword(String keyword) {
		this.keyword = keyword;
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

}
