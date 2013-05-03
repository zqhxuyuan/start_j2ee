package com.xuyuan.spring3.recipes.advanceioc.t11;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.util.Date;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;

import org.springframework.beans.factory.BeanNameAware;

import com.xuyuan.spring3.recipes.advanceioc.t1.Product;
import com.xuyuan.spring3.recipes.advanceioc.t6.ShoppingCart;

/**
 * 2-11. Creating Bean Post Processors
 *
 */
public class Cashier implements BeanNameAware, StorageConfig {

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
    }

    @PreDestroy
    public void closeFile() throws IOException {
        writer.close();
    }
}
