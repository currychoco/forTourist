package forTourist.area;

public class AreaDto {

	/*
	 * 
	 * addr1 : : "(삼성동)" areacode : "1" booktour : "0"
	 * cat1 : "A02" cat2 : "A0206" cat3 : "A02060900" contentid : "130304"
	 * contenttypeid : "14" createdtime : "20040317090000" firstimage :
	 * "http://tong.visitkorea.or.kr/cms/resource/62/1923662_image2_1.jpg"
	 * firstimage2 :
	 * "http://tong.visitkorea.or.kr/cms/resource/62/1923662_image3_1.jpg" mapx :
	 * "127.0466663104" mapy : "37.5136338386" mlevel : "6" modifiedtime :
	 * "20211209185523" readcount : 23443 sigungucode : "1" tel : "" title :
	 * "서울특별시교육청 강남도서관"
	 * 
	 */
	private int contentId;
	private String addr1;
	private String addr2;
	private String areacode;
	private String booktour;
	private String cat1;
	private String cat2;
	private String cat3;
	private String contentid;
	private int contenttypeid;
	private String firstimage;
	private String firstimage2;
	private double mapx;
	private double mapy;
	private int mlevel;
	private String readcount; 
	private int sigungucode;
	private String tel;
	private String title;
	
	
	public AreaDto(int contentId, String addr1, String addr2, String areacode, String booktour, String cat1,
			String cat2, String cat3, String contentid2, int contenttypeid, String firstimage, String firstimage2,
			double mapx, double mapy, int mlevel, String readcount, int sigungucode, String tel, String title) {
		super();
		this.contentId = contentId;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.areacode = areacode;
		this.booktour = booktour;
		this.cat1 = cat1;
		this.cat2 = cat2;
		this.cat3 = cat3;
		contentid = contentid2;
		this.contenttypeid = contenttypeid;
		this.firstimage = firstimage;
		this.firstimage2 = firstimage2;
		this.mapx = mapx;
		this.mapy = mapy;
		this.mlevel = mlevel;
		this.readcount = readcount;
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


	public String getContentid() {
		return contentid;
	}


	public int getContenttypeid() {
		return contenttypeid;
	}


	public String getFirstimage() {
		return firstimage;
	}


	public String getFirstimage2() {
		return firstimage2;
	}


	public double getMapx() {
		return mapx;
	}


	public double getMapy() {
		return mapy;
	}


	public int getMlevel() {
		return mlevel;
	}


	public String getReadcount() {
		return readcount;
	}


	public int getSigungucode() {
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
		return "AreaDto [contentId=" + contentId + ", addr1=" + addr1 + ", addr2=" + addr2 + ", areacode=" + areacode
				+ ", booktour=" + booktour + ", cat1=" + cat1 + ", cat2=" + cat2 + ", cat3=" + cat3 + ", contentid="
				+ contentid + ", contenttypeid=" + contenttypeid + ", firstimage=" + firstimage + ", firstimage2="
				+ firstimage2 + ", mapx=" + mapx + ", mapy=" + mapy + ", mlevel=" + mlevel + ", readcount=" + readcount
				+ ", sigungucode=" + sigungucode + ", tel=" + tel + ", title=" + title + "]";
	}
	
	
}
