package com.xuyuan.spring3.recipes.intergratweb.filter;

import java.io.IOException;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class CityServiceRequestFilter implements Filter { 
	
    /**
	 * @uml.property  name="cityServiceRequestAuditor"
	 * @uml.associationEnd  
	 */
    private CityServiceRequestAuditor cityServiceRequestAuditor; 
    /**
	 * @param cityServiceRequestAuditor
	 * @uml.property  name="cityServiceRequestAuditor"
	 */
    public void setCityServiceRequestAuditor(final CityServiceRequestAuditor cityServiceRequestAuditor) { 
        this.cityServiceRequestAuditor = cityServiceRequestAuditor; 
    }
    
    @Override 
    public void init(final FilterConfig filterConfig) throws ServletException { 
    } 
 
    @Override 
    public void doFilter(final ServletRequest servletRequest, final ServletResponse servletResponse, final FilterChain filterChain) throws IOException, ServletException { 
        Map parameterMap = servletRequest.getParameterMap(); 
        this.cityServiceRequestAuditor.log(parameterMap); 
        filterChain.doFilter(servletRequest, servletResponse); 
    }
    
    @Override  
    public void destroy() { 
    } 
}
