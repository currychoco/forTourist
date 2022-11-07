package like;

public class LikeDto {
	private boolean like;
	private boolean want;
	private int contentId;
	private String userId;
	private String title;
	
	public LikeDto(boolean like, boolean want, int contentId, String userId, String title) {
		super();
		this.like = like;
		this.want = want;
		this.contentId = contentId;
		this.userId = userId;
		this.title = title;
	}

	public boolean isLike() {
		return like;
	}

	public void setLike(boolean like) {
		this.like = like;
	}

	public boolean isWant() {
		return want;
	}

	public void setWant(boolean want) {
		this.want = want;
	}

	public int getContentId() {
		return contentId;
	}

//	public void setContentId(int contentId) {
//		this.contentId = contentId;
//	}

	public String getUserId() {
		return userId;
	}

	public String getTitle() {
		return title;
	}

//	public void setTitle(String title) {
//		this.title = title;
//	}

//	public void setUserId(String userId) {
//		this.userId = userId;
//	}
	
	
	



}
