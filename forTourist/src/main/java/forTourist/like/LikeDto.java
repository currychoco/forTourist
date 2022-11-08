package forTourist.like;

public class LikeDto {
	private int no;
	private boolean like;
	private int contentId;
	private String userId;
	private String title;
	private String url;
	
	public LikeDto(int no,boolean like, int contentId, String userId, String title, String url) {
		super();
		this.no = no;
		this.like = like;
		this.contentId = contentId;
		this.userId = userId;
		this.title = title;
		this.url = url;
	}

	public int getNo() {
		return no;
	}
	
	public boolean isLike() {
		return like;
	}

	public void setLike(boolean like) {
		this.like = like;
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
	public String getUrl() {
		return url;
	}

//	public void setTitle(String title) {
//		this.title = title;
//	}

//	public void setUserId(String userId) {
//		this.userId = userId;
//	}
	
	
	



}
