package com.xuyuan.j2ee.jmx.standardbeans._1;


public class Controller implements ControllerMBean {
	/**
	 * @uml.property  name="name"
	 */
	private String name;
	/**
	 * @uml.property  name="target"
	 * @uml.associationEnd  multiplicity="(1 1)"
	 */
	private final ServerImpl target; 
	//private long upTime;
	
    public Controller(ServerImpl target){ 
        this.target = target; 
    } 
    
	/**
	 * @param name
	 * @uml.property  name="name"
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * @return
	 * @uml.property  name="name"
	 */
	public String getName() {
		return this.name;
	}
	
	public String status() {
		return "this is a Controller MBean,name is " + this.name;
	}

	public void start() {
		System.out.println("start a bean...");
	}

	public void stop() {
		System.out.println("end a bean...");
	}
	
    public long getUpTime(){ 
        return System.currentTimeMillis() - target.startTime; 
    } 
}
