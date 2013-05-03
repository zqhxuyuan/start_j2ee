/*
 * @(#)file      SimpleStandardMBean.java
 * @(#)author    Sun Microsystems, Inc.
 * @(#)version   1.1
 * @(#)lastedit  04/01/12
 *
 * Copyright 2004 Sun Microsystems, Inc. All rights reserved.
 * Use is subject to license terms.
 */
package com.xuyuan.j2ee.jmx.tutorial.basic;
/**
 * This is the management interface explicitly defined for the "SimpleStandard" standard MBean. The "SimpleStandard" standard MBean implements this interface in order to be manageable through a JMX agent. The "SimpleStandardMBean" interface shows how to expose for management: - a read/write attribute (named "State") through its getter and setter methods, - a read-only attribute (named "NbChanges") through its getter method, - an operation (named "reset").
 */
public interface SimpleStandardMBean {

    /**
	 * Getter: set the "State" attribute of the "SimpleStandard" standard MBean.
	 * @return  the current value of the "State" attribute.
	 * @uml.property  name="state"
	 */
    public String getState();

    /**
	 * Setter: set the "State" attribute of the "SimpleStandard" standard MBean.
	 * @param  <VAR>s</VAR> the new value of the "State" attribute.
	 * @uml.property  name="state"
	 */
    public void setState(String s);

    /**
     * Getter: get the "NbChanges" attribute of the "SimpleStandard" standard
     * MBean.
     *
     * @return the current value of the "NbChanges" attribute.
     */
    public int getNbChanges();

    /**
     * Operation: reset to their initial values the "State" and "NbChanges"
     * attributes of the "SimpleStandard" standard MBean.
     */
    public void reset();
}
