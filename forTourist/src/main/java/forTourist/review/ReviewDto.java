package forTourist.review;

import java.sql.Timestamp;

public class ReviewDto {
	private int no;
	private int contentId;
	private String userid;
	private String title;
	private String content;
	private Timestamp resDate;
	private Timestamp modDate;
	
	public ReviewDto(int no, int contentId, String userid, String title, String content, Timestamp resDate,
			Timestamp modDate) {
		super();
		this.no = no;
		this.contentId = contentId;
		this.userid = userid;
		this.title = title;
		this.content = content;
		this.resDate = resDate;
		this.modDate = modDate;
	}

	public ReviewDto(int contentId, String userid, String content) {
		super();
		this.contentId = contentId;
		this.userid = userid;
		this.content = content;
	}

	public ReviewDto(int no, String content) {
		super();
		this.no = no;
		this.content = content;
	}

	public int getNo() {
		return no;
	}

	public int getContentId() {
		return contentId;
	}

	public String getUserid() {
		return userid;
	}

	public String getTitle() {
		return title;
	}

	public String getContent() {
		return content;
	}

	public Timestamp getResDate() {
		return resDate;
	}

	public Timestamp getModDate() {
		return modDate;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public void setModDate(Timestamp modDate) {
		this.modDate = modDate;
	}
	
	
}
