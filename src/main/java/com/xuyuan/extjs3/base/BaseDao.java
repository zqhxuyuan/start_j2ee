package com.xuyuan.extjs3.base;

import java.util.List;

public interface BaseDao<T> {

	public List<T> getList(String hql) throws Exception;
}
