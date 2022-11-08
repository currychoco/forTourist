package forTourist.like;

public class LikeDto {
	
	private int no;
	private int contentId;
	private String userId;
	
	public LikeDto(int no, int contentId, String userId) {
		super();
		this.no = no;
		this.contentId = contentId;
		this.userId = userId;
	}

	public int getNo() {
		return no;
	}

	public int getContentId() {
		return contentId;
	}

	public String getUserId() {
		return userId;
	}
}
