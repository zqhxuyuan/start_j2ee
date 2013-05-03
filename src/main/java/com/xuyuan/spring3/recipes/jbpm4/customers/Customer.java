package com.xuyuan.spring3.recipes.jbpm4.customers;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "customer")
public class Customer implements java.io.Serializable {
    private static final long serialVersionUID = 1L;
    /**
	 * @uml.property  name="id"
	 */
    private long id;
    /**
	 * @uml.property  name="firstName"
	 */
    private String firstName;
    /**
	 * @uml.property  name="lastName"
	 */
    private String lastName;
    /**
	 * @uml.property  name="email"
	 */
    private String email;
    /**
	 * @uml.property  name="passphrase"
	 */
    private String passphrase;
    /**
	 * @uml.property  name="authorized"
	 */
    private boolean authorized;

    public Customer() {
        this.authorized = false;
    }

    public Customer(long id) {
        this.id = id;
        this.authorized = false;
    }

    /**
	 * @return
	 * @uml.property  name="id"
	 */
    @Id
    @javax.persistence.GeneratedValue(strategy = javax.persistence.GenerationType.AUTO)
    @Column(name = "id", unique = true, nullable = false, precision = 10, scale = 0)
    public long getId() {
        return this.id;
    }

    /**
	 * @param id
	 * @uml.property  name="id"
	 */
    public void setId(long id) {
        this.id = id;
    }

    /**
	 * @return
	 * @uml.property  name="firstName"
	 */
    @Column(name = "first_name", nullable = false)
    public String getFirstName() {
        return this.firstName;
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
    @Column(name = "last_name", nullable = false)
    public String getLastName() {
        return this.lastName;
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
	 * @uml.property  name="email"
	 */
    @Column(name = "email", nullable = false)
    public String getEmail() {
        return this.email;
    }

    /**
	 * @param email
	 * @uml.property  name="email"
	 */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
	 * @return
	 * @uml.property  name="passphrase"
	 */
    @Column(name = "passphrase", nullable = false)
    public String getPassphrase() {
        return this.passphrase;
    }

    /**
	 * @param passphrase
	 * @uml.property  name="passphrase"
	 */
    public void setPassphrase(String passphrase) {
        this.passphrase = passphrase;
    }

    /**
	 * @param authorized
	 * @uml.property  name="authorized"
	 */
    @Column(name = "authorized", nullable = false)
    public void setAuthorized(boolean authorized) {
        this.authorized = authorized;
    }

    /**
	 * @return
	 * @uml.property  name="authorized"
	 */
    public boolean isAuthorized() {
        return authorized;
    }
}
