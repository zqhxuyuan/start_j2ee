package com.xuyuan.spring3.recipes.advanceioc.t10;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

import org.springframework.core.io.Resource;

/**
 * 2-10. Loading External Resources 
 * 
 * Injecting Resources by using a setter method
 * 
 * In the bean configuration, you can simply  specify the resource path for this Resource property. 
 * Spring will use the preregistered property editor ResourceEditor to convert it 
 * into a  Resource  object before injecting it into your bean. 
 */
public class BannerLoader1{

    /**
	 * @uml.property  name="banner"
	 * @uml.associationEnd  
	 */
    private Resource banner;

    /**
	 * @param banner
	 * @uml.property  name="banner"
	 */
    public void setBanner(Resource banner) {
        this.banner = banner;
    }

    public void showBanner() throws IOException {
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
