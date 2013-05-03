package com.xuyuan.spring3.recipes.enterprise.mail.spring;

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
	 * @param mailSender
	 * @uml.property  name="mailSender"
	 */
    public void setMailSender(MailSender mailSender) { 
        this.mailSender = mailSender; 
    } 
 
    public void notifyCopyError(String srcDir, String destDir, String filename) { 
        SimpleMailMessage message = new SimpleMailMessage(); 
        message.setFrom("system@localhost"); 
        message.setTo("admin@localhost"); 
        message.setSubject("File Copy Error"); 
        message.setText( 
                "Dear Administrator,\n\n" + 
                "An error occurred when copying the following file :\n" + 
                "Source directory : " + srcDir + "\n" + 
                "Destination directory : " + destDir + "\n" + 
                "Filename : " + filename); 
        mailSender.send(message); 
    } 
} 
