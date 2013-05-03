//$Id: AuctionItem.java 7369 2005-07-04 03:18:34Z oneovthafew $
package com.xuyuan.hibernate3.tutorial.auction;

import java.util.Date;
import java.util.List;

/**
 * @author Gavin King
 */
public class AuctionItem extends Persistent {
	/**
	 * @uml.property  name="description"
	 */
	private String description;
	/**
	 * @uml.property  name="shortDescription"
	 */
	private String shortDescription;
	/**
	 * @uml.property  name="bids"
	 * @uml.associationEnd  multiplicity="(0 -1)" inverse="item:com.xuyuan.hibernate3.tutorial.auction.Bid"
	 */
	private List bids;
	/**
	 * @uml.property  name="successfulBid"
	 * @uml.associationEnd  
	 */
	private Bid successfulBid;
	/**
	 * @uml.property  name="seller"
	 * @uml.associationEnd  inverse="auctions:com.xuyuan.hibernate3.tutorial.auction.User"
	 */
	private User seller;
	/**
	 * @uml.property  name="ends"
	 */
	private Date ends;
	/**
	 * @uml.property  name="condition"
	 */
	private int condition;
	/**
	 * @return
	 * @uml.property  name="bids"
	 */
	public List getBids() {
		return bids;
	}

	/**
	 * @return
	 * @uml.property  name="description"
	 */
	public String getDescription() {
		return description;
	}

	/**
	 * @return
	 * @uml.property  name="seller"
	 */
	public User getSeller() {
		return seller;
	}

	/**
	 * @return
	 * @uml.property  name="successfulBid"
	 */
	public Bid getSuccessfulBid() {
		return successfulBid;
	}

	/**
	 * @param bids
	 * @uml.property  name="bids"
	 */
	public void setBids(List bids) {
		this.bids = bids;
	}

	/**
	 * @param string
	 * @uml.property  name="description"
	 */
	public void setDescription(String string) {
		description = string;
	}

	/**
	 * @param user
	 * @uml.property  name="seller"
	 */
	public void setSeller(User user) {
		seller = user;
	}

	/**
	 * @param bid
	 * @uml.property  name="successfulBid"
	 */
	public void setSuccessfulBid(Bid bid) {
		successfulBid = bid;
	}

	/**
	 * @return
	 * @uml.property  name="ends"
	 */
	public Date getEnds() {
		return ends;
	}

	/**
	 * @param date
	 * @uml.property  name="ends"
	 */
	public void setEnds(Date date) {
		ends = date;
	}
	
	/**
	 * @return
	 * @uml.property  name="condition"
	 */
	public int getCondition() {
		return condition;
	}

	/**
	 * @param i
	 * @uml.property  name="condition"
	 */
	public void setCondition(int i) {
		condition = i;
	}

	public String toString() {
		return shortDescription + " (" + description + ": " + condition + "/10)";
	}

	/**
	 * @return
	 * @uml.property  name="shortDescription"
	 */
	public String getShortDescription() {
		return shortDescription;
	}

	/**
	 * @param shortDescription
	 * @uml.property  name="shortDescription"
	 */
	public void setShortDescription(String shortDescription) {
		this.shortDescription = shortDescription;
	}

}
