package com.xuyuan.search.compass.service;

import org.compass.core.Compass;
import org.compass.core.CompassCallback;
import org.compass.core.CompassDetachedHits;
import org.compass.core.CompassHits;
import org.compass.core.CompassQuery;
import org.compass.core.CompassSession;
import org.compass.core.CompassTemplate;
import org.compass.core.CompassTransaction;
import org.compass.core.support.search.CompassSearchCommand;
import org.compass.core.support.search.CompassSearchResults;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.util.Assert;

import com.xuyuan.search.compass.service.AdvancedSearchCommand.CompassSort;

/**
 * 仿照 {@link org.compass.spring.web.mvc.CompassSearchController}
 * 中的代码，构建了一个Service，方便不使用Spring MVC
 * 
 * @see org.compass.spring.web.mvc.CompassSearchController
 * @see org.compass.spring.web.mvc.AbstractCompassCommandController
 */
public class CompassSearchService implements InitializingBean {

	// 每页显示的条目数量
	private Integer pageSize = 15;

	private Compass compass;

	private CompassTemplate compassTemplate;

/**
     * 公开的搜索接口，返回匹配的搜索结果，与
     * {@link org.compass.spring.web.mvc.CompassSearchController#handle(javax.servlet.http.HttpServletRequest,
     *javax.servlet.http.HttpServletResponse,Object,org.springframework.validation.BindException) 处理相似
     *
     * @see org.compass.spring.web.mvc.CompassSearchController#handle(javax.servlet.http.HttpServletRequest,
     *javax.servlet.http.HttpServletResponse,java.lang.Object,org.springframework.validation.BindException)
     */
	public CompassSearchResults search(final CompassSearchCommand command) {
		return (CompassSearchResults) getCompassTemplate().execute(
		// CompassTransaction.TransactionIsolation.READ_ONLY_READ_COMMITTED,
				new CompassCallback() {
					public Object doInCompass(CompassSession session) {
						return performSearch(command, session);
					}
				});
	}

	/**
	 * 通过此方法调用搜索引擎,进行结果匹配搜索.
	 * 
	 * @see org.compass.spring.web.mvc.CompassSearchController#performSearch(org.compass.spring.web.mvc.CompassSearchCommand,org.compass.core.CompassSession)
	 */
	protected CompassSearchResults performSearch(
			CompassSearchCommand searchCommand, CompassSession session) {
		long time = System.currentTimeMillis();
		CompassQuery query = buildQuery(searchCommand, session);
		CompassHits hits = query.hits();
		CompassDetachedHits detachedHits;
		CompassSearchResults.Page[] pages = null;
		if (pageSize == null) {
			doProcessBeforeDetach(searchCommand, session, hits, -1, -1);
			detachedHits = hits.detach();
		} else {
			int iPageSize = pageSize;
			int page = 0;
			int hitsLength = hits.getLength();
			if (searchCommand.getPage() != null) {
				page = searchCommand.getPage();
			}
			int from = page * iPageSize;

			if (from > hits.getLength()) {

				// 如果起始的条目大于搜索到的条目
				from = hits.getLength() - iPageSize;
				doProcessBeforeDetach(searchCommand, session, hits, from,
						hitsLength);
				detachedHits = hits.detach(from, hitsLength);
			} else if ((from + iPageSize) > hitsLength) {

				// 结束的条目大于搜索到的结果
				doProcessBeforeDetach(searchCommand, session, hits, from,
						hitsLength);
				detachedHits = hits.detach(from, hitsLength);
			} else {

				// 中间的页码，直接取出相应的条目
				doProcessBeforeDetach(searchCommand, session, hits, from,
						iPageSize);
				detachedHits = hits.detach(from, iPageSize);
			}
			doProcessAfterDetach(searchCommand, session, detachedHits);
			int numberOfPages = (int) Math.ceil((float) hitsLength / iPageSize);
			pages = new CompassSearchResults.Page[numberOfPages];
			for (int i = 0; i < pages.length; i++) {
				pages[i] = new CompassSearchResults.Page();
				pages[i].setFrom(i * iPageSize + 1);
				pages[i].setSize(iPageSize);
				pages[i].setTo((i + 1) * iPageSize);
				if (from >= (pages[i].getFrom() - 1) && from < pages[i].getTo()) {
					pages[i].setSelected(true);
				} else {
					pages[i].setSelected(false);
				}
			}
			if (numberOfPages > 0) {
				CompassSearchResults.Page lastPage = pages[numberOfPages - 1];
				if (lastPage.getTo() > hitsLength) {
					lastPage.setSize(hitsLength - lastPage.getFrom());
					lastPage.setTo(hitsLength);
				}
			}
		}
		time = System.currentTimeMillis() - time;
		CompassSearchResults searchResults = new CompassSearchResults(
				detachedHits.getHits(), time, pageSize);
		searchResults.setPages(pages);
		return searchResults;
	}

	/**
	 * 构建Lucene搜索器.
	 */
	protected CompassQuery buildQuery(CompassSearchCommand searchCommand,
			CompassSession session) {
		CompassQuery query = session.queryBuilder()
				.queryString(searchCommand.getQuery().trim()).toQuery();

		if (AdvancedSearchCommand.class.isAssignableFrom(searchCommand
				.getClass())) {
			AdvancedSearchCommand advancedSearchCommand = (AdvancedSearchCommand) searchCommand;

			for (CompassSort sort : advancedSearchCommand.getSortMap()) {
				query.addSort(sort.getName(), sort.getType(),
						sort.getDirection());
			}
		}
		return query;
	}

	/**
	 * 在detach 之前，可以做一些操作。比如highlighting...
	 * 
	 * @param from
	 *            需要注意的是，如果pageSize 没有指定，那么这里传入的参数为-1
	 */
	protected void doProcessBeforeDetach(CompassSearchCommand searchCommand,
			CompassSession session, CompassHits hits, int from, int size) {
		if (AdvancedSearchCommand.class.isAssignableFrom(searchCommand
				.getClass())) {
			if (from < 0) {
				from = 0;
				size = hits.getLength();
			}
			String[] highlightFields = ((AdvancedSearchCommand) searchCommand)
					.getHighlightFields();

			if (highlightFields == null) {
				return;
			}

			// highlight fields
			for (int i = from; i < size; i++) {
				for (String highlightField : highlightFields) {
					hits.highlighter(i).fragment(highlightField);
				}
			}
		}
	}

	/**
	 * An option to perform any type of processing before the hits are detached.
	 */
	protected void doProcessAfterDetach(CompassSearchCommand searchCommand,
			CompassSession session, CompassDetachedHits hits) {

	}

	public void afterPropertiesSet() throws Exception {
		Assert.notNull(compass, "Must set compass property");
		this.compassTemplate = new CompassTemplate(compass);
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public void setCompass(Compass compass) {
		this.compass = compass;
	}

	protected CompassTemplate getCompassTemplate() {
		return this.compassTemplate;
	}

}
