package com.pcwk.ehr.domain;

public class UserVO {
	
	private int userNo  ;//회원id
	private String userId  ;//회원id
	private String passwd  ;//비번
	private String name    ;//이름
	private int birthday;	//생년월일
	private String gender;	//성별
	private String keyword;	//관심분야
	private String email;  	//이메일
	private String phone;  	//핸드폰
	private int userLevel;	//회원id
	private int withdrawl;	//탈퇴여부
	private int agree;	//이용약관 동의여부
	
	public UserVO() {}

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

	public int getUserLevel() {
		return userLevel;
	}

	public void setUserLevel(int userLevel) {
		this.userLevel = userLevel;
	}

	public int getWithdrawl() {
		return withdrawl;
	}

	public void setWithdrawl(int withdrawl) {
		this.withdrawl = withdrawl;
	}

	public int getAgree() {
		return agree;
	}

	public void setAgree(int agree) {
		this.agree = agree;
	}

	public UserVO(int userNo, String userId, String passwd, String name, int birthday, String gender, String keyword,
			String email, String phone, int userLevel, int withdrawl, int agree) {
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
		this.userLevel = userLevel;
		this.withdrawl = withdrawl;
		this.agree = agree;
	}

	@Override
	public String toString() {
		return "UserVO [userNo=" + userNo + ", userId=" + userId + ", passwd=" + passwd + ", name=" + name
				+ ", birthday=" + birthday + ", gender=" + gender + ", keyword=" + keyword + ", email=" + email
				+ ", phone=" + phone + ", userLevel=" + userLevel + ", withdrawl=" + withdrawl + ", agree=" + agree
				+ "]";
	}


	
	


}
