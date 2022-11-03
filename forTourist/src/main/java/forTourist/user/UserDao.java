package forTourist.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import forTourist.util.DBManager;

public class UserDao {

	private String url;
	private String user;
	private String password;

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	private UserDao() {
		this.url = "jdbc:mysql://database-1.ccnr5xsbemm5.ap-northeast-2.rds.amazonaws.com:3306/fortourist";
		this.user = "admin";
		this.password = "tGTACmhj8b0ti";

		this.conn = null;
		this.pstmt = null;
		this.rs = null;

	}

	private static UserDao instance = new UserDao();

	public static UserDao getInstance() {
		return instance;
	}

	public void createUser(UserDto userDto) {
		String sql = "INSERT INTO user VALUERS(?, ?, ?, ?, ?, ?, ?, ?)";

		try {
			this.conn = DBManager.getConnection();
			this.pstmt = this.conn.prepareStatement(sql);

			this.pstmt.setInt(1, userDto.getNo());
			this.pstmt.setString(2, userDto.getId());
			this.pstmt.setString(3, userDto.getPassword());
			this.pstmt.setString(4, userDto.getName());
			this.pstmt.setString(5, userDto.getNickname());
			this.pstmt.setString(6, userDto.getGender());
			this.pstmt.setString(7, userDto.getPhone());
//			this.pstmt.setTimestamp(8, userDto.getResDate());

			this.pstmt.execute();
			System.out.println("생성 성공 ");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("생성 실패 ");
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public ArrayList<UserDto> getUserAll() {
		ArrayList<UserDto> result = new ArrayList<>();
		String sql = "SELECT * FROM user";

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			// no id password name nickname gender phone resDate 8
			while (rs.next()) {
				int no = rs.getInt(1);
				String id = rs.getString(2);
				String password = rs.getString(3);
				String name = rs.getString(4);
				String nickname = rs.getString(5);
				String gender = rs.getString(6);
				String phone = rs.getString(7);
//				Timestamp resDate = rs.getTimestamp(8);
				result.add(new UserDto(no, id, password, name, nickname, gender, phone));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	public int getLastNo() {
		String sql = "SELECT MAX(no) FROM user";
		
		try{
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) +1;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				conn.close();
				pstmt.close();
				rs.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return 0;
	}
	
	
	
	public void deleteUser(String account , String password) {
		
		
	}
	

}
