package com.xuyuan.spring3.recipes.webflow.domain;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.hibernate.annotations.Entity;

/**
 * 7-4. Persisting Objects in Web Flows  
 * http://localhost:8888/start_j2ee/flows/borrowBook
 */
@Entity 
public class BorrowingRecord implements Serializable { 
 
    /**
	 * @uml.property  name="id"
	 */
    @Id 
    @GeneratedValue(strategy = GenerationType.IDENTITY) 
    private Long id; 
 
    /**
	 * @uml.property  name="isbn"
	 */
    private String isbn; 
    /**
	 * @uml.property  name="borrowDate"
	 */
    private Date borrowDate; 
    /**
	 * @uml.property  name="returnDate"
	 */
    private Date returnDate; 
    /**
	 * @uml.property  name="reader"
	 */
    private String reader;
    
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
	 * @uml.property  name="borrowDate"
	 */
	public Date getBorrowDate() {
		return borrowDate;
	}
	/**
	 * @param borrowDate
	 * @uml.property  name="borrowDate"
	 */
	public void setBorrowDate(Date borrowDate) {
		this.borrowDate = borrowDate;
	}
	/**
	 * @return
	 * @uml.property  name="returnDate"
	 */
	public Date getReturnDate() {
		return returnDate;
	}
	/**
	 * @param returnDate
	 * @uml.property  name="returnDate"
	 */
	public void setReturnDate(Date returnDate) {
		this.returnDate = returnDate;
	}
	/**
	 * @return
	 * @uml.property  name="reader"
	 */
	public String getReader() {
		return reader;
	}
	/**
	 * @param reader
	 * @uml.property  name="reader"
	 */
	public void setReader(String reader) {
		this.reader = reader;
	} 
}
