package forTourist.review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import forTourist.util.DBManager;

public class ReviewDao {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private ReviewDao(){
		this.conn = null;
		this.pstmt = null;
		this.rs = null;
	}
	
	private static ReviewDao instance = new ReviewDao();

	public static ReviewDao getInstance() {
		return instance;
	}

	//Create
	public void setReview(ReviewDto dto) {
		int no = getNo();
		String sql ="insert into review(\r\n"
				+ "	`no`\r\n"
				+ "    ,contentid\r\n"
				+ "    ,userid\r\n"
				+ "    ,content\r\n"
				+ ")values(\r\n"
				+ "	?\r\n"
				+ "    ,?\r\n"
				+ "    ,?\r\n"
				+ "    ,?\r\n"
				+ ");";
		
		try {
			conn=DBManager.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.setInt(2, dto.getContentId());
			pstmt.setString(3, dto.getUserid());
			pstmt.setString(4, dto.getContent());
			pstmt.execute();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	public void setReviewApi(ReviewDto dto) {
		int no = getNo();
		String sql ="insert into review(\r\n"
				+ "	`no`\r\n"
				+ "    ,contentid\r\n"
				+ "    ,userid\r\n"
				+ "    ,content\r\n"
				+ "    ,title\r\n"
				+ "    ,addr1\r\n"
				+ "    ,firstimage\r\n"
				+ ")values(\r\n"
				+ "	?\r\n"
				+ "    ,?\r\n"
				+ "    ,?\r\n"
				+ "    ,?\r\n"
				+ "    ,?\r\n"
				+ "    ,?\r\n"
				+ "    ,?\r\n"
				+ ");";
		
		try {
			conn=DBManager.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.setInt(2, dto.getContentId());
			pstmt.setString(3, dto.getUserid());
			pstmt.setString(4, dto.getContent());
			pstmt.setString(5, dto.getTitle());
			pstmt.setString(6, dto.getAddr1());
			pstmt.setString(7, dto.getFirstimage());
			pstmt.execute();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	//no생성
	private int getNo() {
		int no = 0;
		String sql = "select MAX(no) from review";
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				no = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return no + 1;
	}
	
	//Read
	public List<ReviewDto> getAllReview(int contentId){
		System.out.println("리뷰읽어오기");
		List<ReviewDto> list = new ArrayList<>();
		String sql = "select * from review where contentid = ? order by no desc";
		
		try {
			conn=DBManager.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, contentId);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				int no = rs.getInt(1);
				String userid = rs.getString(3);
				String title = rs.getString(4);
				String content = rs.getString(5);
				Timestamp resDate = rs.getTimestamp(6);
				Timestamp modDate = rs.getTimestamp(7);
				
				list.add(new ReviewDto(no, contentId, userid, title, content, resDate, modDate));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return list;
	}
	
	public void deleteReview(int no) {
		String sql = "delete from review where no = ?";
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.execute();
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	//update
	public void updateReview(ReviewDto dto) {
		String sql = "update review set content = ?, modDate = now() where no = ?";
		int no = dto.getNo();
		String content = dto.getContent();
		
		try {
			conn=DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, content);
			pstmt.setInt(2, no);
			pstmt.execute();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
//	수정한부분(정민식)
	public List<ReviewDto> getAllReviewById(String userid){
		System.out.println("내 리뷰읽어오기");
		List<ReviewDto> list = new ArrayList<>();
		String sql = "select * from review where userid = ? order by no desc";
		
		try {
			conn=DBManager.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,userid);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				int no = rs.getInt(1);
				int contentId = rs.getInt(2);
				String title = rs.getString(4);
				String content = rs.getString(5);
				Timestamp resDate = rs.getTimestamp(6);
				Timestamp modDate = rs.getTimestamp(7);
				
				list.add(new ReviewDto(no, contentId, userid, title, content, resDate, modDate));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return list;
	}
	
	
	//수정한부분(정민식)
		public List<ReviewDto> getAllReviewByIdTwo(String userid){
			System.out.println("내 리뷰읽어오기");
			List<ReviewDto> list = new ArrayList<>();
			String sql = "select * from review where userid = ? order by no desc";
			//int contentId, String userid, String content , String title , String addr1, String firstimage
			try {
				conn=DBManager.getConnection();
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1,userid);
				rs=pstmt.executeQuery();
				
				while(rs.next()) {
					int no = rs.getInt(1);
					int contentId = rs.getInt(2);
					String title = rs.getString(4);
					String content = rs.getString(5);
					String addr1 = rs.getString(9);
					String firstimage = rs.getString(10);
					
					list.add(new ReviewDto(no, contentId, userid, title, content, addr1, firstimage));
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					rs.close();
					pstmt.close();
					conn.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
			
			return list;
		}
		
		
}
