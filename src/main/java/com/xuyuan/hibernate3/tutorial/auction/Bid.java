//$Id: Bid.java 3890 2004-06-03 16:31:32Z steveebersole $
package com.xuyuan.hibernate3.tutorial.auction;

import java.util.Date;

/**
 * @author Gavin King
 */
public class Bid extends Persistent {
	/**
	 * @uml.property  name="item"
	 * @uml.associationEnd  inverse="bids:com.xuyuan.hibernate3.tutorial.auction.AuctionItem"
	 */
	private AuctionItem item;
	/**
	 * @uml.property  name="amount"
	 */
	private float amount;
	/**
	 * @uml.property  name="datetime"
	 */
	private Date datetime;
	/**
	 * @uml.property  name="bidder"
	 * @uml.associationEnd  inverse="bids:com.xuyuan.hibernate3.tutorial.auction.User"
	 */
	private User bidder;
	
	/**
	 * @return
	 * @uml.property  name="item"
	 */
	public AuctionItem getItem() {
		return item;
	}

	/**
	 * @param item
	 * @uml.property  name="item"
	 */
	public void setItem(AuctionItem item) {
		this.item = item;
	}

	/**
	 * @return
	 * @uml.property  name="amount"
	 */
	public float getAmount() {
		return amount;
	}

	/**
	 * @return
	 * @uml.property  name="datetime"
	 */
	public Date getDatetime() {
		return datetime;
	}

	/**
	 * @param f
	 * @uml.property  name="amount"
	 */
	public void setAmount(float f) {
		amount = f;
	}

	/**
	 * @param date
	 * @uml.property  name="datetime"
	 */
	public void setDatetime(Date date) {
		datetime = date;
	}

	/**
	 * @return
	 * @uml.property  name="bidder"
	 */
	public User getBidder() {
		return bidder;
	}

	/**
	 * @param user
	 * @uml.property  name="bidder"
	 */
	public void setBidder(User user) {
		bidder = user;
	}

	public String toString() {
		return bidder.getUserName() + " $" + amount;
	}
	
	public boolean isBuyNow() {
		return false;
	}

}
