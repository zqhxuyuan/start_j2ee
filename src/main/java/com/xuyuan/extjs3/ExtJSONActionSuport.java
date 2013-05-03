package com.xuyuan.extjs3;

import com.opensymphony.xwork2.ActionSupport;

public class ExtJSONActionSuport extends ActionSupport {
	private static final long serialVersionUID = 1L;
	
	/**
	 * @uml.property  name="totalCount"
	 */
	private int totalCount = 0;// 总数
    /**
	 * @uml.property  name="start"
	 */
    private transient int start = 0;// 开始数
    /**
	 * @uml.property  name="limit"
	 */
    private transient int limit = 0;// 限制数量
    
    /**
	 * @uml.property  name="jsonString"
	 */
    private String jsonString = "";
 
    /**
	 * @return
	 * @uml.property  name="jsonString"
	 */
    public String getJsonString() {
       return jsonString;
    }
 
    /**
	 * @param jsonString
	 * @uml.property  name="jsonString"
	 */
    public void setJsonString(String jsonString) {
       this.jsonString = jsonString;
    }
 
    public String jsonExecute() throws Exception {
       return super.execute();
    }
 
    /**
	 * @return
	 * @uml.property  name="totalCount"
	 */
    public int getTotalCount() {
       return totalCount;
    }
 
    /**
	 * @param totalCount
	 * @uml.property  name="totalCount"
	 */
    public void setTotalCount(int totalCount) {
       this.totalCount = totalCount;
    }
 
    /**
	 * @return
	 * @uml.property  name="start"
	 */
    public int getStart() {
       return start;
    }
 
    /**
	 * @param start
	 * @uml.property  name="start"
	 */
    public void setStart(int start) {
       this.start = start;
    }
 
    /**
	 * @return
	 * @uml.property  name="limit"
	 */
    public int getLimit() {
       return limit;
    }
 
    /**
	 * @param limit
	 * @uml.property  name="limit"
	 */
    public void setLimit(int limit) {
       this.limit = limit;
    }
}
