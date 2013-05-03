package com.xuyuan.search.compass.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.compass.annotations.Searchable;
import org.compass.annotations.SearchableId;
import org.compass.annotations.SearchableProperty;

@Entity
@Table(name = "article")
@Searchable
public class Article  implements java.io.Serializable {

	@Id
	@GeneratedValue
    @SearchableId
    private Integer id;
    
    @SearchableProperty(name="title")
    private String title;
    
    @SearchableProperty(name="author")
    private Integer author;
    
    @SearchableProperty(name="publishDate")
    private Date publishDate;

    /** default constructor */
    public Article() {
    }

    /** minimal constructor */
    public Article(String title, Date publishDate) {
        this.title = title;
        this.publishDate = publishDate;
    }

    /** full constructor */
    public Article(String title, Integer author, Date publishDate) {
        this.title = title;
        this.author = author;
        this.publishDate = publishDate;
    }

    public Integer getId() {
        return this.id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return this.title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Integer getAuthor() {
        return this.author;
    }

    public void setAuthor(Integer author) {
        this.author = author;
    }

    public Date getPublishDate() {
        return this.publishDate;
    }

    public void setPublishDate(Date publishDate) {
        this.publishDate = publishDate;
    }

}
