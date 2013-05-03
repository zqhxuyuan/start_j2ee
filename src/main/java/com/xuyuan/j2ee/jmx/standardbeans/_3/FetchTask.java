package com.xuyuan.j2ee.jmx.standardbeans._3;

public class FetchTask implements Runnable {
    /**
	 * @uml.property  name="name"
	 */
    private final String name;

    public FetchTask(String name) {
        this.name = name;
    }

    public String toString() {
        return "FetchTask: " + name;
    }

    public void run() {  
    	/* Fetch remote resource */
    	
    }
}
