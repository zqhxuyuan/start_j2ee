package com.xuyuan.extjs3.tree.dao;

import java.util.List;

import com.xuyuan.extjs3.tree.bean.Exttree;

/**
 * Ext访问数据库接口封装
 * @author BruceLeey / hoojo
 * @param <T>
 */
public interface TreeDao<T> {

	/**
	 * Tree,Sort 同步树 从数据库中获取所有的数据,展现树.
	 * @author hoojo
	 */
	public List<T> getTreeListByParentId(T entity) throws Exception;
	//-------------------------------------------------------------

	/**
	 * Exttree 异步树(包括CRUD操作)
	 * @author BruceLeey
	 */
	//根据ID查找对象
    public Exttree findById(Long id) throws Exception;

    //根据父节点查询所有子节点列表
    public List<Exttree> findChildById(Long parentId) throws Exception;

    //保存节点
    public void save(Exttree node) throws Exception;

    //修改节点
    public void modify(Exttree node) throws Exception;

    //执行繁杂的修改语句
    public void modifyBySQL(String hql) throws Exception;

    //根据ID删除子节点
    public void removeChildById(Exttree node) throws Exception;

    //移除节点
    public void ajaxRemoveNode(Long id) throws Exception;
}

