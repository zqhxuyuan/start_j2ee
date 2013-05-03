package com.xuyuan.spring3.recipes.aopaspectj.t8;

public class CounterImpl implements Counter {

    /**
	 * @uml.property  name="count"
	 */
    private int count;

    public void increase() {
        count++;
    }

    /**
	 * @return
	 * @uml.property  name="count"
	 */
    public int getCount() {
        return count;
    }
}
