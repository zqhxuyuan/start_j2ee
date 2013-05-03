package com.xuyuan.spring3.recipes.advanceioc;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.util.Date;
import java.util.Locale;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;

import org.springframework.beans.factory.BeanNameAware;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.context.ApplicationEventPublisherAware;
import org.springframework.context.MessageSource;
import org.springframework.context.MessageSourceAware;

import com.xuyuan.spring3.recipes.advanceioc.t1.Product;
import com.xuyuan.spring3.recipes.advanceioc.t11.StorageConfig;
import com.xuyuan.spring3.recipes.advanceioc.t14.CheckoutEvent;
import com.xuyuan.spring3.recipes.advanceioc.t6.ShoppingCart;

/**
 * 2-9. Making Beans Aware of the Container
 * 
 * BeanNameAware:
 * make your cashier bean aware of its bean name in the IoC container by implementing the  BeanNameAware interface. 
 * When this bean name is injected, you can save it as the cashier name. 
 * This can save you the trouble of setting another name property for the cashier.
 * 
 * 
 * @author Administrator
 *
 */
public class Cashier implements BeanNameAware, MessageSourceAware, ApplicationEventPublisherAware, StorageConfig {

    /**
	 * @uml.property  name="name"
	 */
    private String name;
    /**
	 * @uml.property  name="path"
	 */
    private String path;
    /**
	 * @uml.property  name="writer"
	 */
    private BufferedWriter writer;
    
    /**
	 * @uml.property  name="messageSource"
	 * @uml.associationEnd  
	 */
    private MessageSource messageSource;
    /**
	 * @uml.property  name="applicationEventPublisher"
	 * @uml.associationEnd  
	 */
    private ApplicationEventPublisher applicationEventPublisher;

    //BeanNameAware
    public void setBeanName(String beanName) {
        this.name = beanName;
    }

    //StorageConfig
    /**
	 * @return
	 * @uml.property  name="path"
	 */
    public String getPath() {
        return path;
    }

    /**
	 * @param path
	 * @uml.property  name="path"
	 */
    public void setPath(String path) {
        this.path = path;
    }

    //MessageSourceAware
    /**
	 * @param messageSource
	 * @uml.property  name="messageSource"
	 */
    public void setMessageSource(MessageSource messageSource) {
        this.messageSource = messageSource;
    }

    //ApplicationEventPublisherAware
    /**
	 * @param applicationEventPublisher
	 * @uml.property  name="applicationEventPublisher"
	 */
    public void setApplicationEventPublisher(ApplicationEventPublisher applicationEventPublisher) {
        this.applicationEventPublisher = applicationEventPublisher;
    }

    @PostConstruct
    public void openFile() throws IOException {
        File logFile = new File(path, name + ".txt");
        writer = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(logFile, true)));
    }

    public void checkout(ShoppingCart cart) throws IOException {
        double total = 0;
        for (Product product : cart.getItems()) {
            total += product.getPrice();
        }
        writer.write(new Date() + "\t" + total + "\r\n");
        writer.flush();

        String alert = messageSource.getMessage("alert.checkout", new Object[] {total, new Date() }, Locale.US);
        System.out.println(alert);

        CheckoutEvent event = new CheckoutEvent(this, total, new Date());
        applicationEventPublisher.publishEvent(event);
    }

    @PreDestroy
    public void closeFile() throws IOException {
        writer.close();
    }
}
