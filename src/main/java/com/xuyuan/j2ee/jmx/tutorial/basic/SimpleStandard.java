/*
 * @(#)file      SimpleStandard.java
 * @(#)author    Sun Microsystems, Inc.
 * @(#)version   1.1
 * @(#)lastedit  04/01/12
 *
 * Copyright 2004 Sun Microsystems, Inc. All rights reserved.
 * Use is subject to license terms.
 */

/**
 * Simple definition of a standard MBean, named "SimpleStandard".
 *
 * The "SimpleStandard" standard MBean shows how to expose attributes
 * and operations for management by implementing its corresponding
 * "SimpleStandardMBean" management interface.
 *
 * This MBean has two attributes and one operation exposed
 * for management by a JMX agent:
 *      - the read/write "State" attribute,
 *      - the read only "NbChanges" attribute,
 *	- the "reset()" operation.
 *
 * This object also has one property and one method not exposed
 * for management by a JMX agent:
 *	- the "NbResets" property,
 *	- the "getNbResets()" method.
 */
package com.xuyuan.j2ee.jmx.tutorial.basic;
import javax.management.AttributeChangeNotification;
import javax.management.MBeanNotificationInfo;
import javax.management.NotificationBroadcasterSupport;

public class SimpleStandard
    extends NotificationBroadcasterSupport
    implements SimpleStandardMBean {

    /*
     * -----------------------------------------------------
     * CONSTRUCTORS
     * -----------------------------------------------------
     */

    /* "SimpleStandard" does not provide any specific constructors.
     * However, "SimpleStandard" is JMX compliant with regards to
     * contructors because the default contructor SimpleStandard()
     * provided by the Java compiler is public.
     */

    /*
     * -----------------------------------------------------
     * IMPLEMENTATION OF THE SimpleStandardMBean INTERFACE
     * -----------------------------------------------------
     */

    /**
	 * Getter: get the "State" attribute of the "SimpleStandard" standard MBean.
	 * @return  the current value of the "State" attribute.
	 * @uml.property  name="state"
	 */
    public String getState() {
        return state;
    }

    /**
	 * Setter: set the "State" attribute of the "SimpleStandard" standard MBean.
	 * @param  <VAR>s</VAR> the new value of the "State" attribute.
	 * @uml.property  name="state"
	 */
    public void setState(String s) {
        state = s;
        nbChanges++;
    }

    /**
	 * Getter: get the "NbChanges" attribute of the "SimpleStandard" standard MBean.
	 * @return  the current value of the "NbChanges" attribute.
	 * @uml.property  name="nbChanges"
	 */
    public int getNbChanges() {
        return nbChanges;
    }

    /**
     * Operation: reset to their initial values the "State" and "NbChanges"
     * attributes of the "SimpleStandard" standard MBean.
     */
    public void reset() {
	AttributeChangeNotification acn =
	    new AttributeChangeNotification(this,
					    0,
					    0,
					    "NbChanges reset",
					    "NbChanges",
					    "Integer",
					    new Integer(nbChanges),
					    new Integer(0));
	state = "initial state";
        nbChanges = 0;
	nbResets++;
	sendNotification(acn);
    }

    /*
     * -----------------------------------------------------
     * METHOD NOT EXPOSED FOR MANAGEMENT BY A JMX AGENT
     * -----------------------------------------------------
     */

    /**
	 * Return the "NbResets" property. This method is not a Getter in the JMX sense because it is not exposed in the "SimpleStandardMBean" interface.
	 * @return  the current value of the "NbResets" property.
	 * @uml.property  name="nbResets"
	 */
    public int getNbResets() {
	return nbResets;
    }

    /**
     * Returns an array indicating, for each notification this MBean
     * may send, the name of the Java class of the notification and
     * the notification type.</p>
     *
     * @return the array of possible notifications.
     */
    public MBeanNotificationInfo[] getNotificationInfo() {
        return new MBeanNotificationInfo[] {
	    new MBeanNotificationInfo(
	    new String[] { AttributeChangeNotification.ATTRIBUTE_CHANGE },
	    AttributeChangeNotification.class.getName(),
	    "This notification is emitted when the reset() method is called.")
	};
    }

    /*
     * -----------------------------------------------------
     * ATTRIBUTES ACCESSIBLE FOR MANAGEMENT BY A JMX AGENT
     * -----------------------------------------------------
     */

    /**
	 * @uml.property  name="state"
	 */
    private String state = "initial state";
    /**
	 * @uml.property  name="nbChanges"
	 */
    private int nbChanges = 0;

    /*
     * -----------------------------------------------------
     * PROPERTY NOT ACCESSIBLE FOR MANAGEMENT BY A JMX AGENT
     * -----------------------------------------------------
     */

    /**
	 * @uml.property  name="nbResets"
	 */
    private int nbResets = 0;
}
