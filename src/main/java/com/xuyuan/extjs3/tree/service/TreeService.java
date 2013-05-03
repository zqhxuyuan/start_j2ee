package com.xuyuan.extjs3.tree.service;

import java.util.List;

import com.xuyuan.extjs3.tree.bean.Exttree;

public interface TreeService<T> {

	//通过entity对象查询子对象进行递归变量查找
	public void getTreeByParentId2Recursion(T entity) throws Exception;

	//通过sort对象去查询子结点list
	//public List<T> getTreeListByParentId(T entity) throws Exception;
	//public void getTreeListByParentId(List<T> children, T entity) throws Exception;


    public Exttree findById(Long id) throws Exception;
    public List<Exttree> findChildById(Long parentId) throws Exception;

    public void save(Exttree node) throws Exception;
    public void modify(Exttree node) throws Exception;

	//异步修改标题
    public void ajaxModifyTitle(Long id, String title) throws Exception;

    //异步移除父节点
    public void ajaxRemoveParentById(Long parentId) throws Exception;

    //异步移动节点
    public void ajaxMoveNode(Long id, Long oldParentId, Long newParentId, Long nodeIndex) throws Exception;

    //节点向上
    public void upNode(int parentId, int minIndex, int maxIndex) throws Exception;

    //节点向下
    public void downNode(int parentId, int minIndex, int maxIndex) throws Exception;

}
