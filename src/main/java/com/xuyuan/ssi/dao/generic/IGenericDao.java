package com.xuyuan.ssi.dao.generic;

import java.io.Serializable;  
import java.util.List;  
/** 
 * GenericDao DAO层泛型接口，定义基本的DAO功能 
 * @param <T>    实体类 
 * @param <PK>   主键类，必须实现Serializable接口 
 * http://blog.csdn.net/APOLLO_TS/article/details/5322131
 */  
public abstract interface IGenericDao<T, PK extends Serializable> {  
    
	/** 
     * 插入一个实体（在数据库INSERT一条记录）
     * @param entity 实体对象 
     */  
    public abstract void insert(T entity);  
    
    /** 
     * 修改一个实体对象（UPDATE一条记录） 
     * @param entity 实体对象 
     * @return 修改的对象个数，正常情况=1 
     */  
    public abstract int update(T entity);  
    
    /** 
     * 按主键删除记录 
     * @param primaryKey 主键对象 
     * @return 删除的对象个数，正常情况=1 
     */  
    public abstract int delete(PK primaryKey);  

    /** 
     * 按主键取记录 
     * @param primaryKey 主键值 
     * @return 记录实体对象，如果没有符合主键条件的记录，则返回null 
     */  
    public abstract T get(PK primaryKey);  
    
    /** 
     * 取全部记录 
     * @return 全部记录实体对象的List 
     */  
    public abstract List<T> select();
    
    /** 
     * 查询整表总记录数 
     * @return 整表总记录数 
     */  
    public abstract int count();  
    public abstract void batchInsert(final List<T> list);  
    public abstract void batchUpdate(final List<T> list);  
    public abstract void batchDelete(final List<PK> list);  
}

