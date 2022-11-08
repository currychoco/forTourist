package forTourist.want;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import forTourist.util.DBManager;

public class WantDao {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	private WantDao() {
			this.conn=null;
			this.pstmt=null;
			this.rs=null;
		}

	private static WantDao instance = new WantDao();

	public static WantDao getInstance() {
		return instance;
	}

	public int getLastNo() {
		String sql = "SELECT MAX(no) FROM `want`";

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) + 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
				pstmt.close();
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return 0;
	}

	// create
	public void createWant(WantDto wantDto) {
		String sql = "INSERT INTO `want`(`no`,`want`,`contentId`,`userId`,`title`, `url`) VALUES(?, ?, ?, ?, ?, ?)";
		int no = getLastNo();
		try {
			this.conn = DBManager.getConnection();
			this.pstmt = this.conn.prepareStatement(sql);

			this.pstmt.setInt(1, no);
			this.pstmt.setBoolean(2, wantDto.isWant());
			this.pstmt.setInt(3, wantDto.getContentId());
			this.pstmt.setString(4, wantDto.getUserId());
			this.pstmt.setString(5, wantDto.getTitle());
			this.pstmt.setString(6, wantDto.getUrl());

			this.pstmt.execute();
			System.out.println("찜 생성 성공");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("찜 칸 생성 실패");
		} finally {
			try {
				conn.close();
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	// read 전부 읽기
	public ArrayList<WantDto> getWantAll() {
		ArrayList<WantDto> result = new ArrayList<WantDto>();
		String sql = "SELECT * FROM `want`";

		try {
			this.conn = DBManager.getConnection();
			this.pstmt = this.conn.prepareStatement(sql);
			this.rs = this.pstmt.executeQuery();

			while (rs.next()) {
				int no = rs.getInt(1);
				boolean want = rs.getBoolean(2);
				int contentId = rs.getInt(3);
				String userId = rs.getString(4);
				String title = rs.getString(5);
				String url = rs.getString(6);

				result.add(new WantDto(no, want, contentId, userId, title, url));

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
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

	// read userId 받아서 읽어오기
	public ArrayList<WantDto> getWantAllById(String userId) {
		ArrayList<WantDto> result = new ArrayList<WantDto>();
		String sql = "SELECT * FROM `want` WHERE `userId`=?";

		try {
			this.conn = DBManager.getConnection();
			this.pstmt = this.conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			this.rs = this.pstmt.executeQuery();

			while (rs.next()) {
				int no = rs.getInt(1);
				boolean want = rs.getBoolean(2);
				int contentId = rs.getInt(3);
				String title = rs.getString(5);
				String url = rs.getString(6);

				result.add(new WantDto(no, want, contentId, userId, title, url));

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
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

	// read contentId 받아와서 총 좋아요 수 불러오기 전용
	public ArrayList<WantDto> getWantAllbyContentId(int contentId) {
		ArrayList<WantDto> result = new ArrayList<WantDto>();
		String sql = "SELECT * FROM `want` WHERE `contentId`=?";

		try {
			this.conn = DBManager.getConnection();
			this.pstmt = this.conn.prepareStatement(sql);
			this.pstmt.setInt(1, contentId);
			this.rs = this.pstmt.executeQuery();

			while (rs.next()) {
				int no = rs.getInt(1);
				boolean want = rs.getBoolean(2);
				String userId = rs.getString(4);
				String title = rs.getString(5);
				String url = rs.getString(6);

				result.add(new WantDto(no, want, contentId, userId, title, url));

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
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
	public WantDto getWantbyTwoId(int contentId, String userId) {
		WantDto result = null;
		String sql = "SELECT * FROM `want` WHERE `contentId`=? AND `userId`=?";

		try {
			this.conn = DBManager.getConnection();
			this.pstmt = this.conn.prepareStatement(sql);
			this.pstmt.setInt(1, contentId);
			this.pstmt.setString(2, userId);
			this.rs = this.pstmt.executeQuery();

			while (rs.next()) {
				int no = rs.getInt(1);
				boolean want = rs.getBoolean(2);
				String title = rs.getString(5);
				String url = rs.getString(6);

				result = new WantDto(no, want, contentId, userId, title, url);

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
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
	public void modifyWant(WantDto wantDto, boolean want) {
		String sql = "UPDATE `want` SET `want`=? WHERE `no`=?";

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);


			pstmt.setBoolean(1, want);
			pstmt.setInt(2, wantDto.getNo());

			pstmt.execute();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	// delete
	public void deleteWants(String userId) {
		String sql = "DELETE FROM `want` WHERE `userId`=?";

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.execute();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	// 사용자의 찜 정보 삭제
	public void deleteWant(int contentId, String userId) {
		final String sql = "DELETE FROM `want` WHERE `userId` = ? AND `contentId` = ?";
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setInt(2, contentId);
			pstmt.execute();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}
