package forTourist.festival;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import forTourist.util.DBManager;

public class FestivalDao {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	private FestivalDao() {
		this.conn = null;
		this.pstmt = null;
		this.rs = null;
	}

	private static FestivalDao instance = new FestivalDao();

	public static FestivalDao getInstance() {
		return instance;
	}

	public FestivalDto findById(int contentId) {
		FestivalDto dto = null;
		String sql = "select content_id, addr1, addr2, areacode, booktour, cat1, cat2, cat3, event_end_date, event_start_date, poster_image, map_x, map_y, mlevel, sigungucode, tel, title from festival where content_id = ?";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, contentId);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				String addr1 = rs.getString(2);
				String addr2 = rs.getString(3);
				String areacode = rs.getString(4);
				String booktour = rs.getString(5);
				String cat1 = rs.getString(6);
				String cat2 = rs.getString(7);
				String cat3 = rs.getString(8);
				String eventEndDate = sdf.format(rs.getDate(9));
				String eventStartDate = sdf.format(rs.getDate(10));
				String posterImg = rs.getString(11);
				double mapX = rs.getDouble(12);
				double mapY = rs.getDouble(13);
				int mlevel = rs.getInt(14);
				String sigungucode = rs.getString(15);
				String tel = rs.getString(16);
				String title = rs.getString(17);

				dto = new FestivalDto(contentId, addr1, addr2, areacode, booktour, cat1, cat2, cat3, eventEndDate, eventStartDate,
						posterImg, mapX, mapY, mlevel, sigungucode, tel, title);
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

	public void insertFestival(FestivalDto dto) {

		String sql = "insert into festival(content_id, addr1, addr2, areacode, booktour, cat1, cat2, cat3, event_end_date, event_start_date, poster_image, map_x, map_y, mlevel, sigungucode, tel, title) values(?,?,?,?,?,?,?,?,STR_TO_DATE(?, '%Y%m%d'),STR_TO_DATE(?, '%Y%m%d'),?,?,?,?,?,?,?);";

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getContentId());
			pstmt.setString(2, dto.getAddr1());
			pstmt.setString(3, dto.getAddr2());
			pstmt.setString(4, dto.getAreacode());
			pstmt.setString(5, dto.getBooktour());
			pstmt.setString(6, dto.getCat1());
			pstmt.setString(7, dto.getCat2());
			pstmt.setString(8, dto.getCat3());
			pstmt.setString(9, dto.getEventEndDate());
			pstmt.setString(10, dto.getEventStartDate());
			pstmt.setString(11, dto.getPosterImage());
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

	public List<FestivalDto> getAllFestivalByDate(String date) {
		List<FestivalDto> list = new ArrayList<>();
		String sql = "select * from festival\r\n" + " where event_start_date <= STR_TO_DATE(?, '%Y-%m-%d') \r\n"
				+ " AND event_end_date >= STR_TO_DATE(?, '%Y-%m-%d') ORDER BY event_end_date;";

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, date);
			pstmt.setString(2, date);
			rs = pstmt.executeQuery();

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			while (rs.next()) {
				int contentId = rs.getInt(1);
				String addr1 = rs.getString(2);
				String addr2 = rs.getString(3);
				String areacode = rs.getString(4);
				String booktour = rs.getString(5);
				String cat1 = rs.getString(6);
				String cat2 = rs.getString(7);
				String cat3 = rs.getString(8);
				String eventEndDate = sdf.format(rs.getDate(9));
				String eventStartDate = sdf.format(rs.getDate(10));
				String posterImage = rs.getString(11);
				double mapX = rs.getDouble(12);
				double mapY = rs.getDouble(13);
				int mlevel = rs.getInt(14);
				String sigungucode = rs.getString(15);
				String tel = rs.getString(16);
				String title = rs.getString(17);

				list.add(new FestivalDto(contentId, addr1, addr2, areacode, booktour, cat1, cat2, cat3, eventEndDate,
						eventStartDate, posterImage, mapX, mapY, mlevel, sigungucode, tel, title));
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
