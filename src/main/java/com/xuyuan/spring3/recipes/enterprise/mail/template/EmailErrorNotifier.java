package com.xuyuan.spring3.recipes.enterprise.mail.template;

import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;

import com.xuyuan.spring3.recipes.enterprise.mail.java.ErrorNotifier;

public class EmailErrorNotifier implements ErrorNotifier {
	
	/**
	 * @uml.property  name="mailSender"
	 * @uml.associationEnd  
	 */
	private MailSender mailSender;
    /**
	 * @uml.property  name="copyErrorMailMessage"
	 * @uml.associationEnd  
	 */
    private SimpleMailMessage copyErrorMailMessage; 
 
    /**
	 * @param mailSender
	 * @uml.property  name="mailSender"
	 */
    public void setMailSender(MailSender mailSender) { 
        this.mailSender = mailSender; 
    } 
    /**
	 * @param copyErrorMailMessage
	 * @uml.property  name="copyErrorMailMessage"
	 */
    public void setCopyErrorMailMessage(SimpleMailMessage copyErrorMailMessage) { 
        this.copyErrorMailMessage = copyErrorMailMessage; 
    }
    
    public void notifyCopyError(String srcDir, String destDir, String filename) { 
        SimpleMailMessage message = new SimpleMailMessage(copyErrorMailMessage); 
        message.setText(String.format(copyErrorMailMessage.getText(), srcDir, destDir, filename)); 
        mailSender.send(message); 
    }
}
