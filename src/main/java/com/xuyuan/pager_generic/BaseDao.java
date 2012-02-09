package com.xuyuan.pager_generic;

import java.io.Serializable;
import java.util.LinkedHashMap;
import java.util.List;

import com.xuyuan.pager_generic.model.PageModel;

/**
 * DAO层封装接口，包含常用的CURD和分页操作
 */
public interface BaseDao<T> {
	public void save(Object entity);								//保存实体
	public void update(Object entity);								//更新实体
	public void delete(Serializable... entityids);					//删除实体
	public T find(Serializable entityId);							//获取实体
	
	public List<T> findByProperty(String propertyName, Object value);	//根据属性查找对象
	public List<T> findByEntity(Object entiey);		 					//根据实体查找对象

	/**
	 * 获取分页数据
	 * @param firstindex 开始索引
	 * @param maxresult 每页显示记录数
	 * @param wherejpql where语句
	 * @param queryParams 查询参数
	 * @param orderby 排序序列
	 * @return 分页数据
	 */
	public PageModel<T> getScrollData(final int firstindex, final int maxresult, final String wherejpql, final Object[] queryParams, final LinkedHashMap<String, String> orderby);
	public PageModel<T> getScrollData(final int firstindex, final int maxresult, final String wherejpql, final Object[] queryParams);
	public PageModel<T> getScrollData(final int firstindex, final int maxresult, final LinkedHashMap<String, String> orderby);
	public PageModel<T> getScrollData(final int firstindex, final int maxresult);
	public PageModel<T> getScrollData();	//获取所有对象
	public int getCount();					//获取记录总数
}
