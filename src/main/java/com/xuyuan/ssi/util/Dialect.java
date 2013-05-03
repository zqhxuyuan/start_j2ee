package com.xuyuan.ssi.util;

/**
 * 方言接口
 * @author Administrator
 */
public interface Dialect {  
    public boolean supportsLimit();  
    public String getLimitString(String sql, boolean hasOffset);  
    public String getLimitString(String sql, int offset, int limit);  
}  
