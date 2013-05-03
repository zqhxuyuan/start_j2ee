package com.xuyuan.spring3.recipes.advanceioc.t10;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

import org.springframework.context.ResourceLoaderAware;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;

/**
 * 2-10. Loading External Resources 
 */
public class BannerLoader implements ResourceLoaderAware{

	/**
	 * @uml.property  name="resourceLoader"
	 * @uml.associationEnd  
	 */
	private ResourceLoader resourceLoader; 
	 
    /**
	 * @param resourceLoader
	 * @uml.property  name="resourceLoader"
	 */
    public void setResourceLoader(ResourceLoader resourceLoader) { 
        this.resourceLoader = resourceLoader; 
    } 
    
    public void showBanner() throws IOException { 
        //Resource banner = resourceLoader.getResource("file:banner.txt"); 
        Resource banner = resourceLoader.getResource("classpath:spring/2/banner.txt"); 
        InputStream in = banner.getInputStream(); 
 
        BufferedReader reader = new BufferedReader(new InputStreamReader(in)); 
        while (true) { 
            String line = reader.readLine(); 
            if (line == null) 
                break; 
            System.out.println(line); 
        } 
        reader.close(); 
    } 
	
}
