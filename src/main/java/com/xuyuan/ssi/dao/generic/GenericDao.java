package com.xuyuan.ssi.dao.generic;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.List;
import org.springframework.orm.ibatis.SqlMapClientCallback;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapExecutor;
import com.ibatis.sqlmap.engine.execution.SqlExecutor;
import com.ibatis.sqlmap.engine.impl.ExtendedSqlMapClient;
import com.xuyuan.ssi.util.LimitSqlExecutor;

public class GenericDao<T, PK extends Serializable> extends SqlMapClientDaoSupport implements IGenericDao<T, PK> {
	// sqlmap.xml定义文件中对应的sqlid  
    public static final String SQLID_INSERT = "insert";  
    public static final String SQLID_UPDATE = "update";  
    public static final String SQLID_DELETE = "delete";  
    public static final String SQLID_SELECT = "select";  
    public static final String SQLID_SELECT_PK = "selectPk";  
    public static final String SQLID_COUNT = "count";  
    /**
	 * @uml.property  name="sqlmapNamespace"
	 */
    private String sqlmapNamespace = "";  
    /**
	 * @uml.property  name="sqlExecutor"
	 * @uml.associationEnd  
	 */
    private SqlExecutor sqlExecutor; //设置是否支持物理分页.由具体的Dialect实现类和LimitSqlExecutor的关系来确定
    
    public void setEnableLimit(boolean enableLimit) {  
        if (sqlExecutor instanceof LimitSqlExecutor) {  
            ((LimitSqlExecutor) sqlExecutor).setEnableLimit(enableLimit);  
        }  
    }  
    public void initialize() throws Exception {  
        if (sqlExecutor != null) {  
            SqlMapClient sqlMapClient = getSqlMapClientTemplate().getSqlMapClient();  
            if (sqlMapClient instanceof ExtendedSqlMapClient) {  
                //ReflectUtil.setFieldValue(((ExtendedSqlMapClient) sqlMapClient).getDelegate(), "sqlExecutor", SqlExecutor.class, sqlExecutor);  
            }  
        }  
    } 
    
    /**
	 * @return
	 * @uml.property  name="sqlExecutor"
	 */
    public SqlExecutor getSqlExecutor() {  
        return sqlExecutor;  
    }  
    /**
	 * @param sqlExecutor
	 * @uml.property  name="sqlExecutor"
	 */
    public void setSqlExecutor(SqlExecutor sqlExecutor) {  
        this.sqlExecutor = sqlExecutor;  
    }
    
    /**
	 * sqlmapNamespace，对应sqlmap.xml中的命名空间
	 * @uml.property  name="sqlmapNamespace"
	 */  
    public String getSqlmapNamespace() {  
        return sqlmapNamespace;  
    }  
    /**
	 * sqlmapNamespace的设置方法，可以用于spring注入
	 * @uml.property  name="sqlmapNamespace"
	 */  
    public void setSqlmapNamespace(String sqlmapNamespace) {  
        this.sqlmapNamespace = sqlmapNamespace;  
    }  
 
    public void insert(T entity) {  
        getSqlMapClientTemplate().insert(sqlmapNamespace + "." + SQLID_INSERT,  entity);  
    }  
    public int update(T entity) {  
        return getSqlMapClientTemplate().update( sqlmapNamespace + "." + SQLID_UPDATE, entity);  
    }
    public int delete(PK primaryKey) {  
        int rows = getSqlMapClientTemplate().delete(sqlmapNamespace + "." + SQLID_DELETE, primaryKey);   
        return rows;  
    }  
    public T get(PK primaryKey) {  
        return (T) getSqlMapClientTemplate().queryForObject(sqlmapNamespace + "." + SQLID_SELECT_PK, primaryKey);  
    } 
    public List<T> select() {  
        return getSqlMapClientTemplate().queryForList(  sqlmapNamespace + "." + SQLID_SELECT);  
    }  
    public int count() {  
        Integer count = (Integer) getSqlMapClientTemplate().queryForObject(sqlmapNamespace + "." + SQLID_COUNT);  
        return count.intValue();  
    }  
    public void batchInsert(final List<T> list){  
        SqlMapClientCallback callback = new SqlMapClientCallback() {          
            public Object doInSqlMapClient(SqlMapExecutor executor) throws SQLException {              
                executor.startBatch();              
                for (T member : list) {                  
                    executor.insert(sqlmapNamespace + "." + SQLID_INSERT, member);              
                }              
                executor.executeBatch();              
                return null;          
            }      
        };      
        this.getSqlMapClientTemplate().execute(callback);      
    }  
    public void batchUpdate(final List<T> list){  
        SqlMapClientCallback callback = new SqlMapClientCallback() {          
            public Object doInSqlMapClient(SqlMapExecutor executor) throws SQLException {              
                executor.startBatch();              
                for (T member : list) {                  
                    executor.update(sqlmapNamespace + "." + SQLID_UPDATE, member);              
                }              
                executor.executeBatch();              
                return null;          
            }      
        };      
        this.getSqlMapClientTemplate().execute(callback);      
    }  
    public void batchDelete(final List<PK> list){  
        SqlMapClientCallback callback = new SqlMapClientCallback() {          
            public Object doInSqlMapClient(SqlMapExecutor executor) throws SQLException {              
                executor.startBatch();              
                for (PK member : list) {                  
                    executor.delete(sqlmapNamespace + "." + SQLID_DELETE, member);              
                }              
                executor.executeBatch();              
                return null;          
            }      
        };      
        this.getSqlMapClientTemplate().execute(callback);      
    }  
}  
