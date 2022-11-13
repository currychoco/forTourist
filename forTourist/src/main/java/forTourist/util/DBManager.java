package forTourist.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBManager {
	public static Connection getConnection(){
		Connection conn = null;	
		final String url = "jdbc:mysql://database-1.ccnr5xsbemm5.ap-northeast-2.rds.amazonaws.com:3306/fortourist";
		final String user = "admin";
		final String password = "tGTACmhj8b0ti";
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(url,user,password);
		}catch(Exception e){
			e.printStackTrace();
		}
		return conn;
	}
}
