//$Id: Name.java 3890 2004-06-03 16:31:32Z steveebersole $
package com.xuyuan.hibernate3.tutorial.auction;

/**
 * @author Gavin King
 */
public class Name {
	/**
	 * @uml.property  name="firstName"
	 */
	private String firstName;
	/**
	 * @uml.property  name="lastName"
	 */
	private String lastName;
	/**
	 * @uml.property  name="initial"
	 */
	private Character initial;
	private Name() {}
	public Name(String first, Character middle, String last) {
		firstName = first;
		initial = middle;
		lastName = last;
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
	 * @uml.property  name="initial"
	 */
	public Character getInitial() {
		return initial;
	}

	/**
	 * @param initial
	 * @uml.property  name="initial"
	 */
	public void setInitial(Character initial) {
		this.initial = initial;
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
	
	public String toString() {
		StringBuffer buf = new StringBuffer()
			.append(firstName)
			.append(' ');
		if (initial!=null) buf.append(initial)
			.append(' ');
		return buf.append(lastName)
			.toString();
	}

}
