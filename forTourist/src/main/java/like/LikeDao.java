package like;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import forTourist.util.DBManager;

public class LikeDao {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private LikeDao() {
		this.conn=null;
		this.pstmt=null;
		this.rs=null;
	}
	
	private static LikeDao instance = new LikeDao();
	
	public static LikeDao getInstance() {
		return instance;
	}
	
	//create
	public void createLike(LikeDto likeDto) {
		String sql = "INSERT INTO `like`(`like`,`want`,`contentId`,`userId`,`title`) VALUES(?, ?, ?, ?, ?)";
	
		try {
			this.conn = DBManager.getConnection();
			this.pstmt = this.conn.prepareStatement(sql);
			
			this.pstmt.setBoolean(1, likeDto.isLike());
			this.pstmt.setBoolean(2, likeDto.isWant());
			this.pstmt.setInt(3, likeDto.getContentId());
			this.pstmt.setString(4, likeDto.getUserId());
			this.pstmt.setString(5, likeDto.getTitle());
			
			this.pstmt.execute();
			System.out.println("좋아요칸 생성 성공");
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("좋아요 칸 생성 실패");
		}finally {
			try {
				conn.close();
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	//read 전부 읽기
	public ArrayList<LikeDto> getLikeAll(){
		ArrayList<LikeDto> result = new ArrayList<LikeDto>();
		String sql = "SELECT * FROM `like`";
		
		try {
			this.conn = DBManager.getConnection();
			this.pstmt = this.conn.prepareStatement(sql);
			this.rs = this.pstmt.executeQuery();
			
			while(rs.next()) {
				boolean like = rs.getBoolean(1);
				boolean want = rs.getBoolean(2);
				int contentId = rs.getInt(3);
				String userId = rs.getString(4);
				String title = rs.getString(5);
				
				result.add(new LikeDto(like,want, contentId, userId, title));

			}
		} catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				conn.close();
				pstmt.close();
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	//read userId 받아서 읽어오기
	public ArrayList<LikeDto> getLikeAllById(String userId){
		ArrayList<LikeDto> result = new ArrayList<LikeDto>();
		String sql = "SELECT * FROM `like` WHERE `userId`=?";
		
		try {
			this.conn = DBManager.getConnection();
			this.pstmt = this.conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			this.rs = this.pstmt.executeQuery();
			
			while(rs.next()) {
				boolean like = rs.getBoolean(1);
				boolean want = rs.getBoolean(2);
				int contentId = rs.getInt(3);
				String title = rs.getString(4);
				
				result.add(new LikeDto(like,want, contentId, userId, title));

			}
		} catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				conn.close();
				pstmt.close();
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	//read contentId 받아와서 총 좋아요 수 불러오기 전용
	public ArrayList<LikeDto> getLikeAllbyContentId(int contentId){
		ArrayList<LikeDto> result = new ArrayList<LikeDto>();
		String sql = "SELECT * FROM `like` WHERE `contentId`=?";
		
		try {
			this.conn = DBManager.getConnection();
			this.pstmt = this.conn.prepareStatement(sql);
			this.pstmt.setInt(1, contentId);
			this.rs = this.pstmt.executeQuery();
			
			while(rs.next()) {
				boolean like = rs.getBoolean(1);
				boolean want = rs.getBoolean(2);
				String userId = rs.getString(4);
				String title = rs.getString(5);
				
				result.add(new LikeDto(like,want, contentId, userId, title));

			}
		} catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				conn.close();
				pstmt.close();
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	// 좋아요 찜을 변경하기 전에 이미 생성되어있는지 확인하기 위함
	public LikeDto getLikebyTwoId(int contentId , String userId){
		LikeDto result = null;
		String sql = "SELECT * FROM `like` WHERE `contentId`=? AND `userId`=?";
		
		try {
			this.conn = DBManager.getConnection();
			this.pstmt = this.conn.prepareStatement(sql);
			this.pstmt.setInt(1, contentId);
			this.pstmt.setString(2, userId);
			this.rs = this.pstmt.executeQuery();
			
			while(rs.next()) {
				boolean like = rs.getBoolean(1);
				boolean want = rs.getBoolean(2);
				String title = rs.getString(5);
				
				result =new LikeDto(like,want, contentId, userId, title);

			}
		} catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				conn.close();
				pstmt.close();
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	// Update
	public void modifyLike(LikeDto like) {
		String sql = "UPDATE `like` SET `like`=?, `want`=? WHERE `contentId`=? AND `userId`=?";
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setBoolean(1, like.isLike());
			pstmt.setBoolean(2, like.isWant());
			
			pstmt.execute();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	//delete
	public void deleteLikes(String userId) {
		String sql = "DELETE FROM `like` WHERE `userId`=?";
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.execute();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}









}
