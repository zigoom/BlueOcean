package com.pcwk.ehr.cmn;

public class MyPageVO {
	private int    userNo;
	private String userId;
    private String passwd;
    private String name;
    private int birthday;
    private String gender;
    private String keyword;
    private String email;
    private String phone;
    
    


	
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getBirthday() {
		return birthday;
	}
	public void setBirthday(int birthday) {
		this.birthday = birthday;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public MyPageVO(int userNo, String userId, String passwd, String name, int birthday, String gender, String keyword,
			String email, String phone) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.passwd = passwd;
		this.name = name;
		this.birthday = birthday;
		this.gender = gender;
		this.keyword = keyword;
		this.email = email;
		this.phone = phone;
	}
    
	
	@Override
	public String toString() {
		return "MyPageVO [userNo=" + userNo + ", userId=" + userId + ", passwd=" + passwd + ", name=" + name
				+ ", birthday=" + birthday + ", gender=" + gender + ", keyword=" + keyword + ", email=" + email
				+ ", phone=" + phone + ", toString()=" + super.toString() + "]";
	}
    
    

   
}
