package com.xuyuan.pager_generic.action;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 基础Action，所有的Action都可以继承，省去写page和控制层统一处理，继承后，只需要些Results和execute方法
 * 
 */
@SuppressWarnings("serial")
@Controller @Scope("prototype")
public class BaseActionSupport extends ActionSupport {
	
	private int page;	//jsp页面传过来的当前页

	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
}
