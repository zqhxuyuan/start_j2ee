//$Id: AuctionInfo.java 3890 2004-06-03 16:31:32Z steveebersole $
package com.xuyuan.hibernate3.tutorial.auction;

import java.util.Date;

/**
 * @author Gavin King
 */
public class AuctionInfo {
	/**
	 * @uml.property  name="id"
	 */
	private long id;
	/**
	 * @uml.property  name="description"
	 */
	private String description;
	/**
	 * @uml.property  name="ends"
	 */
	private Date ends;
	/**
	 * @uml.property  name="maxAmount"
	 */
	private Float maxAmount;
	/**
	 * @return
	 * @uml.property  name="description"
	 */
	public String getDescription() {
		return description;
	}

	/**
	 * @return
	 * @uml.property  name="ends"
	 */
	public Date getEnds() {
		return ends;
	}

	/**
	 * @return
	 * @uml.property  name="id"
	 */
	public long getId() {
		return id;
	}

	/**
	 * @return
	 * @uml.property  name="maxAmount"
	 */
	public Float getMaxAmount() {
		return maxAmount;
	}
	
	public AuctionInfo(long id, String description, Date ends, Float maxAmount) {
		this.id = id;
		this.description = description;
		this.ends = ends;
		this.maxAmount = maxAmount;
	}

}
