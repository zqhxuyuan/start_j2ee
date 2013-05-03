package com.xuyuan.spring3.recipes.distributedspring.terracotta.customerconsole.entity;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ReflectionToStringBuilder;

import java.io.Serializable;
import java.util.Date;
import java.util.UUID;


public class Customer implements Serializable {
    private static final long serialVersionUID = 1L;
    /**
	 * @uml.property  name="id"
	 */
    private String id;
    /**
	 * @uml.property  name="firstName"
	 */
    private String firstName;
    /**
	 * @uml.property  name="lastName"
	 */
    private String lastName;
    /**
	 * @uml.property  name="birthday"
	 */
    private Date birthday;

    public Customer(String firstName, String lastName, Date birthdate) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.birthday = birthdate;

        this.id = UUID.randomUUID().toString();
    }

    @Override
    public String toString() {
        return new ReflectionToStringBuilder(this).toString();
    }

    @Override
    public int hashCode() {
        return new HashCodeBuilder().append(id).toHashCode();
    }

    @Override
    public boolean equals(Object obj) {
        if (!(obj instanceof Customer)) {
            return false;
        }

        Customer otherCustomer = (Customer) obj;

        return new EqualsBuilder().append(getId(), otherCustomer.getId()).isEquals();
    }

    /**
	 * @return
	 * @uml.property  name="id"
	 */
    public String getId() {
        return id;
    }

    /**
	 * @param id
	 * @uml.property  name="id"
	 */
    public void setId(String id) {
        this.id = id;
    }

    /**
	 * @return
	 * @uml.property  name="firstName"
	 */
    public String getFirstName() {
        return firstName;
    }

    /**
	 * @param firstName
	 * @uml.property  name="firstName"
	 */
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    /**
	 * @return
	 * @uml.property  name="lastName"
	 */
    public String getLastName() {
        return lastName;
    }

    /**
	 * @param lastName
	 * @uml.property  name="lastName"
	 */
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    /**
	 * @return
	 * @uml.property  name="birthday"
	 */
    public Date getBirthday() {
        return birthday;
    }

    /**
	 * @param birthday
	 * @uml.property  name="birthday"
	 */
    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }
}
