package com.xuyuan.ssi.util;

import java.sql.Connection;
import java.sql.SQLException;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import com.ibatis.sqlmap.engine.execution.SqlExecutor;
import com.ibatis.sqlmap.engine.mapping.statement.RowHandlerCallback;
import com.ibatis.sqlmap.engine.scope.StatementScope;

/**
 * 支持物理分页
 * @author Administrator
 */
public class LimitSqlExecutor extends SqlExecutor {
    private static final Log logger = LogFactory.getLog(LimitSqlExecutor.class);
    
    /**
	 * @uml.property  name="dialect"
	 * @uml.associationEnd  
	 */
    private Dialect dialect;
    /**
	 * @uml.property  name="enableLimit"
	 */
    private boolean enableLimit = true;

    @Override
    public void executeQuery(StatementScope request, Connection conn, String sql,
            Object[] parameters, int skipResults, int maxResults,
            RowHandlerCallback callback) throws SQLException {
        if ((skipResults != NO_SKIPPED_RESULTS || maxResults != NO_MAXIMUM_RESULTS) && supportsLimit()) {
            sql = dialect.getLimitString(sql, skipResults, maxResults);
            if(logger.isDebugEnabled()){
                logger.debug(sql);
            }
            skipResults = NO_SKIPPED_RESULTS;
            maxResults = NO_MAXIMUM_RESULTS;            
        }
        super.executeQuery(request, conn, sql, parameters, skipResults,maxResults, callback);
    }
    
    public boolean supportsLimit() {
        if (enableLimit && dialect != null) {
            return dialect.supportsLimit();
        }
        return false;
    }
    
    /**
	 * @return
	 * @uml.property  name="dialect"
	 */
    public Dialect getDialect() {
        return dialect;
    }
    /**
	 * @param dialect
	 * @uml.property  name="dialect"
	 */
    public void setDialect(Dialect dialect) {
        this.dialect = dialect;
    }
    /**
	 * @return
	 * @uml.property  name="enableLimit"
	 */
    public boolean isEnableLimit() {
        return enableLimit;
    }
    /**
	 * @param enableLimit
	 * @uml.property  name="enableLimit"
	 */
    public void setEnableLimit(boolean enableLimit) {
        this.enableLimit = enableLimit;
    }
}

