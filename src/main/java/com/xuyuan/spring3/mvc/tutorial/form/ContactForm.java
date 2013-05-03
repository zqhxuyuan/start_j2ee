package com.xuyuan.spring3.mvc.tutorial.form;

import java.util.List;

public class ContactForm {

	/**
	 * @uml.property  name="contacts"
	 */
	private List<Contact> contacts;
	 
    public List<Contact> getContacts() {
        return contacts;
    }
 
    public void setContacts(List<Contact> contacts) {
        this.contacts = contacts;
    }
}
