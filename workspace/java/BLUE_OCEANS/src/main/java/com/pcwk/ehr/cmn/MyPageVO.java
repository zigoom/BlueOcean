package com.pcwk.ehr.cmn;

public class MyPageVO {
	private int userNo;
	private String userId;
    private String passwd;
    private String name;
    private int birthday;
    private String gender;
    private String phoneNo;
    private String email;
    private String userLV;
    private String keyword;
    private int del;
    
    
	public MyPageVO() {
		super();
	}
	
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
	public String getPhoneNo() {
		return phoneNo;
	}
	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUserLV() {
		return userLV;
	}
	public void setUserLV(String userLV) {
		this.userLV = userLV;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public int getDel() {
		return del;
	}
	public void setDel(int del) {
		this.del = del;
	}
	public MyPageVO(int userNo, String userId, String passwd, String name, int birthday, String gender, String phoneNo,
			String email, String userLV, String keyword, int del) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.passwd = passwd;
		this.name = name;
		this.birthday = birthday;
		this.gender = gender;
		this.phoneNo = phoneNo;
		this.email = email;
		this.userLV = userLV;
		this.keyword = keyword;
		this.del = del;
	}
	@Override
	public String toString() {
		return "MyPageVO [userNo=" + userNo + ", userId=" + userId + ", passwd=" + passwd + ", name=" + name
				+ ", birthday=" + birthday + ", gender=" + gender + ", phoneNo=" + phoneNo + ", email=" + email
				+ ", userLV=" + userLV + ", keyword=" + keyword + ", del=" + del + ", toString()=" + super.toString()
				+ "]";
	}
	
	
   
}
