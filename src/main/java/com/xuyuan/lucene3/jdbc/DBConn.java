package com.xuyuan.lucene3.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Calendar;

/**
 * JDBC 操作数据库工具类
 *
 * 这个类还有很多需要优化的地方.比如
 * 获取Connection,应该写成static方法.保证单个实例.
 * 关闭数据库的方法要先判断对象是否为空.
 * 还可以提供批量保存,批量更新的方法...
 * @author Administrator
 *
 */
public class DBConn {

	public String ClassString = null;
	public String ConnectionString = null;
	public String UserName = "root";
	public String PassWord = "root";

	public Connection Conn;
	public Statement Stmt;

	public DBConn() {
		// For MySQL Driver
		ClassString="com.mysql.jdbc.Driver";
		ConnectionString="jdbc:mysql://localhost:3306/blog?user="+UserName+"&password="+PassWord+"&useUnicode=true&characterEncoding=utf-8";

		/*
		From System.xml
		 ClassString=XmlUtility.getConfigValue("DB_ClassString");//"oracle.jdbc.driver.OracleDriver";
		 ConnectionString=XmlUtility.getConfigValue("DB_ConnectionString");//"jdbc:oracle:thin:@192.168.103.171:1521:jstrd";
		 UserName=XmlUtility.getConfigValue("DB_UserName");//"htgl";
		 PassWord=XmlUtility.getConfigValue("DB_PassWord");//"1";

		For ODBC
		 ClassString="sun.jdbc.odbc.JdbcOdbcDriver";
		 ConnectionString=("jdbc:odbc:DBDemo");
		 UserName="dbdemo";
		 PassWord="dbdemo";

		For Access Driver
		 ClassString="sun.jdbc.odbc.JdbcOdbcDriver";
		 ConnectionString=("jdbc:odbc:Driver={MicroSoft Access Driver (*.mdb)};DBQ=C:\\dbdemo.mdb;ImplicitCommitSync=Yes;MaxBufferSize=512;MaxScanRows=128;PageTimeout=5;SafeTransactions=0;Threads=3;UserCommitSync=Yes;").replace('\\','/');

		For SQLServer Driver
		 ClassString="com.microsoft.jdbc.sqlserver.SQLServerDriver";
		 ConnectionString="jdbc:microsoft:sqlserver://127.0.0.1:1433;DatabaseName=name;User=sa;Password=pwd";

		 ClassString="net.sourceforge.jtds.jdbc.Driver";
		 ConnectionString="jdbc:jtds:sqlserver://127.0.0.1:1433;DatabaseName=name;User=sa;Password=pwd";

		For Oracle Driver
		 ClassString="oracle.jdbc.driver.OracleDriver";
		 ConnectionString="jdbc:oracle:thin:@192.168.103.171:1521:jstrd";
		 UserName="htgl";
		 PassWord="1";

		For Sybase Driver
		 ClassString="com.sybase.jdbc.SybDriver";
		 ConnectionString="jdbc:sybase:Tds:localhost:5007/tsdata";
		 Properties sysProps = System.getProperties();
		 SysProps.put("user","userid");
		 SysProps.put("password","user_password");
		 DriverManager.getConnection(ConnectionString,sysProps);
		*/
	}

	// 打开连接
	public boolean OpenConnection() {
		boolean mResult = true;
		try {
			Class.forName(ClassString);
			Conn = DriverManager.getConnection(ConnectionString, UserName,PassWord);
			Stmt = Conn.createStatement();
			mResult = true;
		} catch (Exception e) {
			System.out.println(e.toString());
			mResult = false;
		}
		return (mResult);
	}

	// 关闭数据库连接
	public void CloseConnection() {
		try {
			Stmt.close();
			Conn.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}

	// 获取当前时间(JAVA)
	public String GetDateTime() {
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String mDateTime = formatter.format(cal.getTime());
		return (mDateTime);
	}

	// 获取当前时间(T-SQL)
	public java.sql.Date GetDate() {
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String mDateTime = formatter.format(cal.getTime());
		return (java.sql.Date.valueOf(mDateTime));
	}

	// 生成新的ID
	public int GetMaxID(String vTableName, String vFieldName) {
		int mResult = 0;
		boolean mConn = true;
		String mSql = new String();
		mSql = "select max(" + vFieldName + ")+1 as MaxID from " + vTableName;
		try {
			if (Conn != null) {
				mConn = Conn.isClosed();
			}
			if (mConn) {
				OpenConnection();
			}

			ResultSet result = ExecuteQuery(mSql);
			if (result.next()) {
				mResult = result.getInt("MaxID");
			}
			result.close();

			if (mConn) {
				CloseConnection();
			}

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return (mResult);
	}

	// 数据检索
	public ResultSet ExecuteQuery(String SqlString) {
		ResultSet result = null;
		try {
			result = Stmt.executeQuery(SqlString);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return (result);
	}

	// 数据更新(增、删、改)
	public int ExecuteUpdate(String SqlString) {
		int result = 0;
		try {
			result = Stmt.executeUpdate(SqlString);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return (result);
	}
	
	public static void main(String[] args) {
		
	}
}
