package com.xuyuan.spring3.recipes.webflow.domain;

import java.io.Serializable;
import java.util.Date;

public class Book implements Serializable { 
	 
    /**
	 * @uml.property  name="isbn"
	 */
    private String isbn; 
    /**
	 * @uml.property  name="name"
	 */
    private String name; 
    /**
	 * @uml.property  name="author"
	 */
    private String author; 
    /**
	 * @uml.property  name="publishDate"
	 */
    private Date publishDate;
    
	public Book(String isbn, String name, String author, Date publishDate) {
		this.isbn = isbn;
		this.name = name;
		this.author = author;
		this.publishDate = publishDate;
	}
	/**
	 * @return
	 * @uml.property  name="isbn"
	 */
	public String getIsbn() {
		return isbn;
	}
	/**
	 * @param isbn
	 * @uml.property  name="isbn"
	 */
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	/**
	 * @return
	 * @uml.property  name="name"
	 */
	public String getName() {
		return name;
	}
	/**
	 * @param name
	 * @uml.property  name="name"
	 */
	public void setName(String name) {
		this.name = name;
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
	 * @uml.property  name="publishDate"
	 */
	public Date getPublishDate() {
		return publishDate;
	}
	/**
	 * @param publishDate
	 * @uml.property  name="publishDate"
	 */
	public void setPublishDate(Date publishDate) {
		this.publishDate = publishDate;
	}
}
