package com.xuyuan.spring3.recipes.advanceioc.t4;

import com.xuyuan.spring3.recipes.advanceioc.t1.Product;

public class ProductRanking {

    /**
	 * @uml.property  name="bestSeller"
	 * @uml.associationEnd  
	 */
    private Product bestSeller;

    /**
	 * @return
	 * @uml.property  name="bestSeller"
	 */
    public Product getBestSeller() {
        return bestSeller;
    }

    /**
	 * @param bestSeller
	 * @uml.property  name="bestSeller"
	 */
    public void setBestSeller(Product bestSeller) {
        this.bestSeller = bestSeller;
    }
}
