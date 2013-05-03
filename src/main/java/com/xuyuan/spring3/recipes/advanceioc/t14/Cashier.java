package com.xuyuan.spring3.recipes.advanceioc.t14;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.util.Date;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;

import org.springframework.context.ApplicationEventPublisher;
import org.springframework.context.ApplicationEventPublisherAware;

import com.xuyuan.spring3.recipes.advanceioc.t1.Product;
import com.xuyuan.spring3.recipes.advanceioc.t6.ShoppingCart;

/**
 * 2.publish an event
 * create an event instance and make a call to the publishEvent() method of an application event publisher, 
 * which can be accessed by implementing the ApplicationEventPublisherAware interface.
 */
public class Cashier implements ApplicationEventPublisherAware {

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
	 * @uml.property  name="applicationEventPublisher"
	 * @uml.associationEnd  
	 */
    private ApplicationEventPublisher applicationEventPublisher;

    /**
	 * @return
	 * @uml.property  name="name"
	 */
    public String getName() {
		return name;
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

        CheckoutEvent event = new CheckoutEvent(this, total, new Date());
        applicationEventPublisher.publishEvent(event);
    }

    @PreDestroy
    public void closeFile() throws IOException {
        writer.close();
    }
}
