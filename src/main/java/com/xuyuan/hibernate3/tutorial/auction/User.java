//$Id: User.java 3890 2004-06-03 16:31:32Z steveebersole $
package com.xuyuan.hibernate3.tutorial.auction;

import java.util.List;

/**
 * @author Gavin King
 */
public class User extends Persistent {
	/**
	 * @uml.property  name="userName"
	 */
	private String userName;
	/**
	 * @uml.property  name="password"
	 */
	private String password;
	/**
	 * @uml.property  name="email"
	 */
	private String email;
	/**
	 * @uml.property  name="name"
	 * @uml.associationEnd  
	 */
	private Name name;
	/**
	 * @uml.property  name="bids"
	 * @uml.associationEnd  multiplicity="(0 -1)" inverse="bidder:com.xuyuan.hibernate3.tutorial.auction.Bid"
	 */
	private List bids;
	/**
	 * @uml.property  name="auctions"
	 * @uml.associationEnd  multiplicity="(0 -1)" inverse="seller:com.xuyuan.hibernate3.tutorial.auction.AuctionItem"
	 */
	private List auctions;
	
	/**
	 * @return
	 * @uml.property  name="email"
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * @return
	 * @uml.property  name="password"
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * @return
	 * @uml.property  name="userName"
	 */
	public String getUserName() {
		return userName;
	}

	/**
	 * @param string
	 * @uml.property  name="email"
	 */
	public void setEmail(String string) {
		email = string;
	}

	/**
	 * @param string
	 * @uml.property  name="password"
	 */
	public void setPassword(String string) {
		password = string;
	}

	/**
	 * @param string
	 * @uml.property  name="userName"
	 */
	public void setUserName(String string) {
		userName = string;
	}

	/**
	 * @return
	 * @uml.property  name="auctions"
	 */
	public List getAuctions() {
		return auctions;
	}

	/**
	 * @return
	 * @uml.property  name="bids"
	 */
	public List getBids() {
		return bids;
	}

	/**
	 * @param list
	 * @uml.property  name="auctions"
	 */
	public void setAuctions(List list) {
		auctions = list;
	}

	/**
	 * @param list
	 * @uml.property  name="bids"
	 */
	public void setBids(List list) {
		bids = list;
	}
	
	public String toString() {
		return userName;
	}

	/**
	 * @return
	 * @uml.property  name="name"
	 */
	public Name getName() {
		return name;
	}

	/**
	 * @param name
	 * @uml.property  name="name"
	 */
	public void setName(Name name) {
		this.name = name;
	}

}
