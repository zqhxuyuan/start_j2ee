//$Id: Persistent.java 3890 2004-06-03 16:31:32Z steveebersole $
package com.xuyuan.hibernate3.tutorial.auction;

/**
 * @author Gavin King
 */
public class Persistent {
	/**
	 * @uml.property  name="id"
	 */
	private Long id;
	/**
	 * @return
	 * @uml.property  name="id"
	 */
	public Long getId() {
		return id;
	}

	/**
	 * @param long1
	 * @uml.property  name="id"
	 */
	public void setId(Long long1) {
		id = long1;
	}

}
