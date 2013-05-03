/*
 * @(#)file      SimpleDynamic.java
 * @(#)author    Sun Microsystems, Inc.
 * @(#)version   1.1
 * @(#)lastedit  04/01/12
 *
 * Copyright 2004 Sun Microsystems, Inc. All rights reserved.
 * Use is subject to license terms.
 */

/**
 * Simple definition of a dynamic MBean, named "SimpleDynamic".
 *
 * The "SimpleDynamic" dynamic MBean shows how to expose for management
 * attributes and operations, at runtime,  by implementing the  
 * "javax.management.DynamicMBean" interface.
 *
 * This MBean exposes for management two attributes and one operation:
 *      - the read/write "State" attribute,
 *      - the read only "NbChanges" attribute,
 *      - the "reset()" operation.
 * It does so by putting this information in an MBeanInfo object that
 * is returned by the getMBeanInfo() method of the DynamicMBean interface.
 *
 * It implements the access to its attributes through the getAttribute(),
 * getAttributes(), setAttribute(), and setAttributes() methods of the
 * DynamicMBean interface.
 *
 * It implements the invocation of its reset() operation through the
 * invoke() method of the DynamicMBean interface.
 * 
 * Note that as "SimpleDynamic" explicitly defines one constructor,
 * this constructor must be public and exposed for management through
 * the MBeanInfo object.
 */
package com.xuyuan.j2ee.jmx.tutorial.basic;
import java.lang.reflect.Constructor;
import java.util.Iterator;
import javax.management.*;

public class SimpleDynamic
    extends NotificationBroadcasterSupport
    implements DynamicMBean {

    /*
     * -----------------------------------------------------
     * CONSTRUCTORS
     * -----------------------------------------------------
     */

    public SimpleDynamic() {
        // Build the management information to be exposed by the dynamic MBean
        //
        buildDynamicMBeanInfo();
    }

    /*
     * -----------------------------------------------------
     * IMPLEMENTATION OF THE DynamicMBean INTERFACE
     * -----------------------------------------------------
     */

    /**
     * Allows the value of the specified attribute of the Dynamic MBean to be
     * obtained.
     */
    public Object getAttribute(String attribute_name) 
        throws AttributeNotFoundException,
               MBeanException,
               ReflectionException {

        // Check attribute_name is not null to avoid NullPointerException
        // later on
        //
        if (attribute_name == null) {
            throw new RuntimeOperationsException(
                  new IllegalArgumentException("Attribute name cannot be null"),
                  "Cannot invoke a getter of " + dClassName +
                  " with null attribute name");
        }
        // Check for a recognized attribute_name and call the corresponding
        // getter
        //
        if (attribute_name.equals("State")) {
            return getState();
        } 
        if (attribute_name.equals("NbChanges")) {
            return getNbChanges();
        }
        // If attribute_name has not been recognized throw an
        // AttributeNotFoundException
        //
        throw new AttributeNotFoundException("Cannot find " +
                                             attribute_name +
                                             " attribute in " +
                                             dClassName);
    }

    /**
     * Sets the value of the specified attribute of the Dynamic MBean.
     */
    public void setAttribute(Attribute attribute) 
        throws AttributeNotFoundException,
               InvalidAttributeValueException,
               MBeanException, 
               ReflectionException {

        // Check attribute is not null to avoid NullPointerException later on
        //
        if (attribute == null) {
            throw new RuntimeOperationsException(
                  new IllegalArgumentException("Attribute cannot be null"), 
                  "Cannot invoke a setter of " + dClassName +
                  " with null attribute");
        }
        String name = attribute.getName();
        Object value = attribute.getValue();
        if (name == null) {
            throw new RuntimeOperationsException(
                  new IllegalArgumentException("Attribute name cannot be null"),
                  "Cannot invoke the setter of " + dClassName +
                  " with null attribute name");
        }
        // Check for a recognized attribute name and call the corresponding
        // setter
        //
        if (name.equals("State")) {
            // if null value, try and see if the setter returns any exception
            if (value == null) {
                try {
                    setState( null );
                } catch (Exception e) {
                    throw new InvalidAttributeValueException(
                              "Cannot set attribute " + name + " to null");
                }
            }
            // if non null value, make sure it is assignable to the attribute
            else {
                try {
                    if (Class.forName("java.lang.String").isAssignableFrom(
                                                          value.getClass())) {
                        setState((String) value);
                    } else {
                        throw new InvalidAttributeValueException(
                                  "Cannot set attribute " + name + " to a " + 
                                  value.getClass().getName() +
                                  " object, String expected");
                    }
                } catch (ClassNotFoundException e) {
                    e.printStackTrace();
                }
            }
        }
        // recognize an attempt to set "NbChanges" attribute (read-only):
        else if (name.equals("NbChanges")) {
            throw new AttributeNotFoundException(
                  "Cannot set attribute " + name + " because it is read-only");
        }
        // unrecognized attribute name:
        else {
            throw new AttributeNotFoundException("Attribute " + name +
                                                 " not found in " +
                                                 this.getClass().getName());
        }
    }

    /**
     * Enables the to get the values of several attributes of the Dynamic MBean.
     */
    public AttributeList getAttributes(String[] attributeNames) {

        // Check attributeNames is not null to avoid NullPointerException
        // later on
        //
        if (attributeNames == null) {
            throw new RuntimeOperationsException(
                new IllegalArgumentException("attributeNames[] cannot be null"),
                "Cannot invoke a getter of " + dClassName);
        }
        AttributeList resultList = new AttributeList();

        // If attributeNames is empty, return an empty result list
        //
        if (attributeNames.length == 0)
            return resultList;
        
        // Build the result attribute list
        //
        for (int i = 0 ; i < attributeNames.length ; i++) {
            try {        
                Object value = getAttribute((String) attributeNames[i]);     
                resultList.add(new Attribute(attributeNames[i],value));
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return resultList;
    }

    /**
     * Sets the values of several attributes of the Dynamic MBean, and returns
     * the list of attributes that have been set.
     */
    public AttributeList setAttributes(AttributeList attributes) {

        // Check attributes is not null to avoid NullPointerException later on
        //
        if (attributes == null) {
            throw new RuntimeOperationsException(
                      new IllegalArgumentException(
                                 "AttributeList attributes cannot be null"),
                      "Cannot invoke a setter of " + dClassName);
        }
        AttributeList resultList = new AttributeList();

        // If attributeNames is empty, nothing more to do
        //
        if (attributes.isEmpty())
            return resultList;

        // For each attribute, try to set it and add to the result list if
        // successfull
        //
        for (Iterator i = attributes.iterator(); i.hasNext();) {
            Attribute attr = (Attribute) i.next();
            try {
                setAttribute(attr);
                String name = attr.getName();
                Object value = getAttribute(name); 
                resultList.add(new Attribute(name,value));
            } catch(Exception e) {
                e.printStackTrace();
            }
        }
        return resultList;
    }

    /**
     * Allows an operation to be invoked on the Dynamic MBean.
     */
    public Object invoke(String operationName,
                         Object params[],
                         String signature[])
        throws MBeanException, ReflectionException {

        // Check operationName is not null to avoid NullPointerException
        // later on
        //
        if (operationName == null) {
            throw new RuntimeOperationsException(
                 new IllegalArgumentException("Operation name cannot be null"), 
                 "Cannot invoke a null operation in " + dClassName);
        }
        // Check for a recognized operation name and call the corresponding
        // operation
        //
        if (operationName.equals("reset")) {
            reset();
            return null;
        } else { 
            // Unrecognized operation name
            //
            throw new ReflectionException(
                                new NoSuchMethodException(operationName), 
                                "Cannot find the operation " + operationName +
                                " in " + dClassName);
        }
    }

    /**
     * This method provides the exposed attributes and operations of the
     * Dynamic MBean. It provides this information using an MBeanInfo object.
     */
    public MBeanInfo getMBeanInfo() {

        // Return the information we want to expose for management:
        // the dMBeanInfo private field has been built at instanciation time
        //
        return dMBeanInfo;
    }

    /*
     * -----------------------------------------------------
     * OTHER PUBLIC METHODS
     * -----------------------------------------------------
     */

    /**
	 * Getter: get the "State" attribute of the "SimpleDynamic" dynamic MBean.
	 * @uml.property  name="state"
	 */
    public String getState() {
        return state;
    }

    /**
	 * Setter: set the "State" attribute of the "SimpleDynamic" dynamic MBean.
	 * @uml.property  name="state"
	 */
    public void setState(String s) {
        state = s;
        nbChanges++;
    }

    /**
     * Getter: get the "NbChanges" attribute of the "SimpleDynamic" dynamic
     * MBean.
     */
    public Integer getNbChanges() {
        return new Integer(nbChanges);
    }

    /**
     * Operation: reset to their initial values the "State" and "NbChanges" 
     * attributes of the "SimpleDynamic" dynamic MBean. 
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

    /**
     * Return the "NbResets" property. 
     * This method is not a Getter in the JMX sense because 
     * it is not returned by the getMBeanInfo() method.
     */
    public Integer getNbResets() {
        return new Integer(nbResets);
    }

    /*
     * -----------------------------------------------------
     * PRIVATE METHODS
     * -----------------------------------------------------
     */
  
    /**
     * Build the private dMBeanInfo field,
     * which represents the management interface exposed by the MBean,
     * that is, the set of attributes, constructors, operations and
     * notifications which are available for management. 
     *
     * A reference to the dMBeanInfo object is returned by the getMBeanInfo()
     * method of the DynamicMBean interface. Note that, once constructed, an
     * MBeanInfo object is immutable.
     */
    private void buildDynamicMBeanInfo() {

        dAttributes[0] =
            new MBeanAttributeInfo("State",
                                   "java.lang.String",
                                   "State string.",
                                   true,
                                   true,
                                   false);
        dAttributes[1] =
            new MBeanAttributeInfo("NbChanges",
                                   "java.lang.Integer",
                                   "Number of times the " +
                                   "State string has been changed.",
                                   true,
                                   false,
                                   false);

        Constructor[] constructors = this.getClass().getConstructors();
        dConstructors[0] =
            new MBeanConstructorInfo("Constructs a " +
                                     "SimpleDynamic object",
                                     constructors[0]);

        MBeanParameterInfo[] params = null;
        dOperations[0] =
            new MBeanOperationInfo("reset",
                                   "reset State and NbChanges " +
                                   "attributes to their initial values",
                                   params , 
                                   "void", 
                                   MBeanOperationInfo.ACTION);

        dNotifications[0] =
            new MBeanNotificationInfo(
            new String[] { AttributeChangeNotification.ATTRIBUTE_CHANGE },
            AttributeChangeNotification.class.getName(),
            "This notification is emitted when the reset() method is called.");

        dMBeanInfo = new MBeanInfo(dClassName,
                                   dDescription,
                                   dAttributes,
                                   dConstructors,
                                   dOperations,
                                   dNotifications);
    }

    /*
     * -----------------------------------------------------
     * PRIVATE VARIABLES
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
    /**
	 * @uml.property  name="nbResets"
	 */
    private int nbResets = 0;

    /**
	 * @uml.property  name="dClassName"
	 */
    private String dClassName = this.getClass().getName();
    /**
	 * @uml.property  name="dDescription"
	 */
    private String dDescription = "Simple implementation of a dynamic MBean.";

    /**
	 * @uml.property  name="dAttributes"
	 * @uml.associationEnd  multiplicity="(0 -1)"
	 */
    private MBeanAttributeInfo[] dAttributes =
        new MBeanAttributeInfo[2];
    /**
	 * @uml.property  name="dConstructors"
	 * @uml.associationEnd  multiplicity="(0 -1)"
	 */
    private MBeanConstructorInfo[] dConstructors =
        new MBeanConstructorInfo[1];
    /**
	 * @uml.property  name="dNotifications"
	 * @uml.associationEnd  multiplicity="(0 -1)"
	 */
    private MBeanNotificationInfo[] dNotifications =
        new MBeanNotificationInfo[1];
    /**
	 * @uml.property  name="dOperations"
	 * @uml.associationEnd  multiplicity="(0 -1)"
	 */
    private MBeanOperationInfo[] dOperations =
        new MBeanOperationInfo[1];
    /**
	 * @uml.property  name="dMBeanInfo"
	 * @uml.associationEnd  multiplicity="(1 1)"
	 */
    private MBeanInfo dMBeanInfo = null;
}
