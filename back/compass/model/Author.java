package com.xuyuan.search.compass.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.compass.annotations.Searchable;
import org.compass.annotations.SearchableId;
import org.compass.annotations.SearchableProperty;

@Entity
@Table(name = "author")
@Searchable
public class Author  implements java.io.Serializable {

	@Id
	@GeneratedValue
	@SearchableId
    private Integer id;
    
	@SearchableProperty(name="username")
    private String username;
    
	private String password;
    
	@SearchableProperty(name="age")
    private Short age;

    public Author() {
    }

    /** minimal constructor */
    public Author(String username, String password) {
        this.username = username;
        this.password = password;
    }

    /** full constructor */
    public Author(String username, String password, Short age) {
        this.username = username;
        this.password = password;
        this.age = age;
    }

    // Property accessors

    public Integer getId() {
        return this.id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return this.username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return this.password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Short getAge() {
        return this.age;
    }

    public void setAge(Short age) {
        this.age = age;
    }

}
