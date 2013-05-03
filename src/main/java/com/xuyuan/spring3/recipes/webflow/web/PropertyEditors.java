package com.xuyuan.spring3.recipes.webflow.web;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.PropertyEditorRegistrar;
import org.springframework.beans.PropertyEditorRegistry;
import org.springframework.beans.propertyeditors.CustomDateEditor;

public class PropertyEditors implements PropertyEditorRegistrar {
	
	public void registerCustomEditors(PropertyEditorRegistry registry) { 
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); 
        dateFormat.setLenient(false); 
        registry.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true)); 
    }

}
