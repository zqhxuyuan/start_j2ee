package com.xuyuan.j2ee.jta;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import javax.transaction.UserTransaction;

/**
 * http://zyw090111.iteye.com/blog/582296
 * @author Administrator
 *
 */
public class DataBase {
	private static DataBase dataBase;//单例
	
	/**
	 * @uml.property  name="ut"
	 * @uml.associationEnd  
	 */
	private UserTransaction ut;		// 事务管理对象
	/**
	 * @uml.property  name="conn"
	 */
	private Connection conn;		// 数据库连接对象
	/**
	 * @uml.property  name="context"
	 * @uml.associationEnd  multiplicity="(1 1)"
	 */
	private Context context;		// Context上下文对象
	/**
	 * @uml.property  name="pstmt"
	 */
	private PreparedStatement pstmt;
	/**
	 * @uml.property  name="res"
	 */
	public ResultSet res = null;
	
	/**
	 * @uml.property  name="tRANSACTION"
	 */
	private String TRANSACTION = "java:comp/UserTransaction";
	/**
	 * @uml.property  name="jNDI_ORA_DS"
	 */
	private String JNDI_ORA_DS = "java:/XAOracleDS";

	private DataBase() {
		try {
			context = new InitialContext();
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	public static DataBase getDataBase() {
		if (dataBase == null) {
			dataBase = new DataBase();
		}
		return dataBase;
	}

	public UserTransaction getUserTransaction() {
		try {
			// java:comp/UserTransaction是固定写法。
			ut = (UserTransaction) context.lookup(TRANSACTION);
			System.out.println("ut = " + ut);
		} catch (Exception ex) {
			ex.printStackTrace();
			System.out.println("创建UserTransaction" + ex.getMessage());
		}
		return ut;
	}

	/**
	 * 获取连接对象的方式不再是使用DriverManager.getConnection.而是使用JNDI的方式
	 */
	public void getConn() {
		try {
			// 其中java:/是前缀XAoracleDs是JBoss配置的oracle-ax-ds.xml中<jndi-name>节点的名称。
			DataSource ds = (DataSource) context.lookup(JNDI_ORA_DS);
			conn = ds.getConnection();
		} catch (Exception ex) {
			ex.printStackTrace();
			System.out.println("创建数据库连接失败~！" + ex.getMessage());
		}
	}

	public int excuteUpdate(String sql, String[] arrgs) {
		//this.getConn();
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			if (arrgs != null && arrgs.length > 0) {
				for (int i = 0; i < arrgs.length; i++) {
					pstmt.setString(i + 1, arrgs[i]);
				}
			}
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.closePstmt();
			this.closeConn();
		}
		return result;
	}

	public ResultSet excuteQuery(String sql, String[] arrgs) {
		//this.getConn();
		try {
			pstmt = conn.prepareStatement(sql);
			if (arrgs != null && arrgs.length > 0) {
				for (int i = 0; i < arrgs.length; i++) {
					pstmt.setString(i + 1, arrgs[i]);
				}
			}
			res = pstmt.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return res;
	}

	public void closeConn() {
		try {
			if (conn != null) {
				conn.close();
				conn = null;
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	public void closePstmt() {
		try {
			if (pstmt != null) {
				pstmt.close();
				pstmt = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void closeRes() {
		try {
			if (res != null) {
				res.close();
				res = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) throws Exception {
		DataBase db = DataBase.getDataBase();
		db.getConn();
		
		ResultSet rs = db.excuteQuery("select * from t157", null);
		while(rs.next()){
			System.out.println(rs.getString(1) + "  " + rs.getString(2));
		}
	}
}
