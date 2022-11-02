package forTourist.area;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AreaDao {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	private AreaDao() {
		this.conn = null;
		this.pstmt = null;
		this.rs = null;
	}
	
	private static AreaDao instance = new AreaDao();
	
	public static AreaDao getInstance() {
		return instance;
	}
	
	

}
