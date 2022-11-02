package forTourist.keyword;

public class KeywordDto {
	
	private int contentId;
	private String addr1;
	private String addr2;
	private String areacode;
	private String booktour;
	private String cat1;
	private String cat2;
	private String cat3;
	private String keyword;
	private String mainImage;
	private double mapX;
	private double mapY;
	private int mlevel;
	private String sigungucode;
	private String tel;
	private String title;
	
	public KeywordDto(int contentId, String addr1, String addr2, String areacode, String booktour, String cat1,
			String cat2, String cat3, String keyword, String mainImage, double mapX,
			double mapY, int mlevel, String sigungucode, String tel, String title) {
		super();
		this.contentId = contentId;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.areacode = areacode;
		this.booktour = booktour;
		this.cat1 = cat1;
		this.cat2 = cat2;
		this.cat3 = cat3;
		this.keyword = keyword;
		this.mainImage = mainImage;
		this.mapX = mapX;
		this.mapY = mapY;
		this.mlevel = mlevel;
		this.sigungucode = sigungucode;
		this.tel = tel;
		this.title = title;
	}
	
	public int getContentId() {
		return contentId;
	}

	public String getAddr1() {
		return addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public String getAreacode() {
		return areacode;
	}
	
	public String getBooktour() {
		return booktour;
	}

	public String getCat1() {
		return cat1;
	}

	public String getCat2() {
		return cat2;
	}

	public String getCat3() {
		return cat3;
	}
	
	public String getKeyword() {
		return keyword;
	}
	
	public String getMainImage() {
		return mainImage;
	}

	public double getMapX() {
		return mapX;
	}

	public double getMapY() {
		return mapY;
	}

	public int getMlevel() {
		return mlevel;
	}
	
	public String getSigungucode() {
		return sigungucode;
	}

	public String getTel() {
		return tel;
	}

	public String getTitle() {
		return title;
	}
	
	@Override
	public String toString() {
		return "KeywordDto [contentId=" + contentId + ", addr1=" + addr1 + ", addr2=" + addr2 + ", areacode="
				+ areacode + ", booktour=" + booktour + ", cat1=" + cat1 + ", cat2=" + cat2 + ", cat3=" + cat3
				+ ", keyword=" + keyword + ", mainImage="
				+ mainImage + ", mapX=" + mapX + ", mapY=" + mapY + ", mlevel=" + mlevel + ", sigungucode="
				+ sigungucode + ", tel=" + tel + ", title=" + title + "]";
	}

}
