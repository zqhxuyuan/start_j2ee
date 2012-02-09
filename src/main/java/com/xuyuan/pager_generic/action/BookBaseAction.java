package com.xuyuan.pager_generic.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionContext;
import com.xuyuan.pager.entity.Books;
import com.xuyuan.pager_generic.model.PageView;
import com.xuyuan.pager_generic.service.IBookManager;

@SuppressWarnings("serial")
@Results({@Result(name = "success", location = "/pager/book_list.jsp"), @Result(name = "input", location = "/index.jsp") })
public class BookBaseAction extends BaseActionSupport {
	
	@Autowired
	private IBookManager bookManager;
	
	PageView<Books> pageView ;

	public String execute() throws Exception {
		HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
		int maxResult = 5;

		pageView = new PageView<Books>(maxResult, getPage());
		pageView.setQueryResult(bookManager.getScrollData(pageView.getFirstResult(), maxResult));
		
		return SUCCESS;
	}

	public PageView<Books> getPageView() {
		return pageView;
	}

	public void setPageView(PageView<Books> pageView) {
		this.pageView = pageView;
	}
}
