package com.xuyuan.spring3.recipes.advanceioc.t1;

public class Battery extends Product {

    /**
	 * @uml.property  name="rechargeable"
	 */
    private boolean rechargeable;

    public Battery() {
        super();
    }

    public Battery(String name, double price) {
        super(name, price);
    }

    /**
	 * @return
	 * @uml.property  name="rechargeable"
	 */
    public boolean isRechargeable() {
        return rechargeable;
    }

    /**
	 * @param rechargeable
	 * @uml.property  name="rechargeable"
	 */
    public void setRechargeable(boolean rechargeable) {
        this.rechargeable = rechargeable;
    }
}
