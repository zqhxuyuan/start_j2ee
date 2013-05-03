package com.xuyuan.spring3.recipes.advanceioc.t15;

import java.util.Date;

import com.xuyuan.spring3.recipes.advanceioc.t1.Product;

/**
 * 2-15. Registering Property Editors in Spring
 * 
 * suppose you would like your product ra nking to be based on sales for a particular period. 
 * For this change, you add the  fromDate and toDate  properties to your  ProductRanking class.
 * @author Administrator
 *
 */
public class ProductRanking {

    /**
	 * @uml.property  name="bestSeller"
	 * @uml.associationEnd  
	 */
    private Product bestSeller;
    /**
	 * @uml.property  name="fromDate"
	 */
    private Date fromDate;
    /**
	 * @uml.property  name="toDate"
	 */
    private Date toDate;

    /**
	 * @return
	 * @uml.property  name="bestSeller"
	 */
    public Product getBestSeller() {
        return bestSeller;
    }

    /**
	 * @return
	 * @uml.property  name="fromDate"
	 */
    public Date getFromDate() {
        return fromDate;
    }

    /**
	 * @return
	 * @uml.property  name="toDate"
	 */
    public Date getToDate() {
        return toDate;
    }

    /**
	 * @param bestSeller
	 * @uml.property  name="bestSeller"
	 */
    public void setBestSeller(Product bestSeller) {
        this.bestSeller = bestSeller;
    }

    /**
	 * @param fromDate
	 * @uml.property  name="fromDate"
	 */
    public void setFromDate(Date fromDate) {
        this.fromDate = fromDate;
    }

    /**
	 * @param toDate
	 * @uml.property  name="toDate"
	 */
    public void setToDate(Date toDate) {
        this.toDate = toDate;
    }
}
