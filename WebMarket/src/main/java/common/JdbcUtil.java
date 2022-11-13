package common;

import java.sql.*;


public class JdbcUtil {

	static {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

	public static Connection getConnection() {
		Connection con = null;
		String url = "jdbc:oracle:thin:@localhost:1521:XE";
		String id = "java";
		String passwd = "java1234";
	
		try {
			con = DriverManager.getConnection(url,id,passwd);
			con.setAutoCommit(false);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return con;
	}
	

	public static void close(Connection con) {	
		try {
			con.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public static void close(Statement stmt) {	
		try {
			stmt.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public static void close(ResultSet rs) {	
		try {
			rs.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	//Commit
	public static void commit(Connection con) {
		try {
			con.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	//Rollback
	public static void rollback(Connection con) {
		try {
			con.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
}
