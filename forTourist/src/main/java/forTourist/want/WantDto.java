package forTourist.want;

public class WantDto {
	private int no;
	private boolean want;
	private int contentId;
	private String userId;
	private String title;

	public WantDto(int no, boolean want, int contentId, String userId, String title) {
		super();
		this.no = no;
		this.want = want;
		this.contentId = contentId;
		this.userId = userId;
		this.title = title;
	}

	public int getNo() {
		return no;
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

//		public void setContentId(int contentId) {
//			this.contentId = contentId;
//		}

	public String getUserId() {
		return userId;
	}

	public String getTitle() {
		return title;
	}

//		public void setTitle(String title) {
//			this.title = title;
//		}

//		public void setUserId(String userId) {
//			this.userId = userId;
//		}

}
