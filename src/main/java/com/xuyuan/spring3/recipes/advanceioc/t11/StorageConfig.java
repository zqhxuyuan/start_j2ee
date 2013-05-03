package com.xuyuan.spring3.recipes.advanceioc.t11;

/**
 * ensure that the logging path of Cashier exists before the logging file is open.  This is to avoid FileNotFoundException.
 * @author  Administrator
 */
public interface StorageConfig {

    /**
	 * @uml.property  name="path"
	 */
    public String getPath();
}
