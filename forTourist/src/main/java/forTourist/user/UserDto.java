package forTourist.user;

import java.sql.Timestamp;

//no int id password name nickname gender phone resDate


//no int PK 
//id varchar(20) 
//password varchar(20) 
//name varchar(10) 
//nickname varchar(20) 
//gender char(1) 
//phone varchar(20) 
//resDate timestamp


public class UserDto {
	private int no;
	private String id;
	private String password;
	private String name;
	private String nickname;
	private String gender;
	private String phone;
	private Timestamp resDate;
	
	
	
	public UserDto(int no, String id, String password,  String name ,String nickname, String gender, String phone, Timestamp resDate) {
		super();
		this.no = no;
		this.id = id;
		this.password = password;
		this.name = name;
		this.nickname = nickname;
		this.gender = gender;
		this.phone = phone;
		this.resDate = resDate;
	}



	public int getNo() {
		return no;
	}



	public String getId() {
		return id;
	}



	public String getPassword() {
		return password;
	}


	public String getName() {
		return name;
	}

	public String getNickname() {
		return nickname;
	}



	public String getGender() {
		return gender;
	}



	public String getPhone() {
		return phone;
	}



	public Timestamp getResDate() {
		return resDate;
	}



//	public void setNo(int no) {
//		this.no = no;
//	}



//	public void setId(String id) {
//		this.id = id;
//	}



	public void setPassword(String password) {
		this.password = password;
	}


	public void setName(String name) {
		this.name = name;
	}
	
	
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}



//	public void setGender(String gender) {
//		this.gender = gender;
//	}



	public void setPhone(String phone) {
		this.phone = phone;
	}



//	public void setResDate(Timestamp resDate) {
//		this.resDate = resDate;
//	}
	
	
	
	
	
	
	
	
	
}
