package common;
import java.sql.*;

import javax.servlet.ServletContext;


public class JDBConnect {	
	
	public Connection con;
	public Statement stmt;
	public PreparedStatement psmt;
	public ResultSet rs;
	
	public JDBConnect() {		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/jspWebMarket";
			String id = "root";
			String password="1234";
			con = DriverManager.getConnection(url,id,password);
			System.out.println("db연결 성공");
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void close() {
		try {
			if(rs!=null) rs.close();
			if(stmt!=null)stmt.close();
			if(psmt!=null)psmt.close();
			if(con!=null)con.close();
			System.out.println("db연결 해제");
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
	

	
	
}
