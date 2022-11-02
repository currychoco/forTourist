package forTourist.keyword;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import forTourist.keyword.KeywordDao;
import forTourist.keyword.KeywordDto;
import forTourist.util.DBManager;

public class KeywordDao {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	private KeywordDao() {
		this.conn = null;
		this.pstmt = null;
		this.rs = null;
	}
	
	private static KeywordDao instance = new KeywordDao();

	public static KeywordDao getInstance() {
		return instance;
	}
	
	public KeywordDto findById(int contentId) {
		KeywordDto dto = null;
		String sql = "select content_id, addr1, addr2, areacode, booktour, cat1, cat2, cat3, keyword, main_image, map_x, map_y, mlevel, sigungucode, tel, title from keyword where content_id = ?";
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, contentId);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				String addr1 = rs.getString(2);
				String addr2 = rs.getString(3);
				String areacode = rs.getString(4);
				String booktour = rs.getString(5);
				String cat1 = rs.getString(6);
				String cat2 = rs.getString(7);
				String cat3 = rs.getString(8);
				
//				String keyword = rs.getString(9); keyword String으로 받기(?)
				String mainImg = rs.getString(11);
				double mapX = rs.getDouble(12);
				double mapY = rs.getDouble(13);
				int mlevel = rs.getInt(14);
				String sigungucode = rs.getString(15);
				String tel = rs.getString(16);
				String title = rs.getString(17);
				
				dto = new KeywordDto(contentId, addr1, addr2, areacode, booktour, cat1, cat2, cat3, null, mainImg, mapX, mapY, mlevel, sigungucode, tel, title);
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
		return dto;
	}
	
	public void insertKeyword(KeywordDto dto) {

		String sql = "insert into keyword(content_id, addr1, addr2, areacode, booktour, cat1, cat2, cat3, keyword, main_image, map_x, map_y, mlevel, sigungucode, tel, title) values(?,?,?,?,?,?,?,?,STR_TO_KEYWORD,?,?,?,?,?,?,?);";
		
		try {
			conn=DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getContentId());
			pstmt.setString(2, dto.getAddr1());
			pstmt.setString(3, dto.getAddr2());
			pstmt.setString(4, dto.getAreacode());
			pstmt.setString(5, dto.getBooktour());
			pstmt.setString(6, dto.getCat1());
			pstmt.setString(7, dto.getCat2());
			pstmt.setString(8, dto.getCat3());
			pstmt.setString(9, dto.getKeyword());
			pstmt.setString(11, dto.getMainImage());
			pstmt.setDouble(12, dto.getMapX());
			pstmt.setDouble(13, dto.getMapY());
			pstmt.setInt(14, dto.getMlevel());
			pstmt.setString(15, dto.getSigungucode());
			pstmt.setString(16, dto.getTel());
			pstmt.setString(17, dto.getTitle());
	
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
}