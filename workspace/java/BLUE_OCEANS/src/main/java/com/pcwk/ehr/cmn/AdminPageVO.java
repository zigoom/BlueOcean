package com.pcwk.ehr.cmn;

import java.util.List;

public class AdminPageVO {
	private int userNo;// 회원번호
	private String userId;// 회원id
	private String passwd;// 비번
	private String userName;// 이름
	private int birthday; // 생년월일
	private String gender; // 성별
	private String keyword; // 관심분야
	private String email; // 이메일
	private String phoneNo; // 핸드폰
	private String userLevel; // 유저등급
	private int withdrawal; // 탈퇴여부
	private int agree; // 이용약관 동의여부
	private int otpUse; // otp 사용여부
	private List<Integer> termsOfUse; // 이용약관
	private int seq;// 순번
	private String title;// 제목
	private String contents;// 내용
	private String div;// 구분
	private int readCnt;// 조회수
	private String regDt;// 등록일
	private String regId;// 등록자
	private String modDt;// 수정일
	private String modId;// 수정자
	private int commentNo;// 댓글번호
	private int postNo;// 댓글 글번호
	private int replyDelete;// 삭제여부
	private int boardDelete;// 글삭제여부
	private int no;// 약관번호
	private int identifier;// 식별자
	private String subject;// 제목
	private String context;// 본문
	private String registrationDate;// 등록일
	private String log1;
	private String log2;
	private String startDate;
	private String endDate;
	private String logDate;
	
	
	public AdminPageVO() {
	}

	
	public AdminPageVO(int userNo, String userId, String passwd, String userName, int birthday, String gender,
			String keyword, String email, String phoneNo, String userLevel, int withdrawal, int agree, int otpUse,
			List<Integer> termsOfUse, int seq, String title, String contents, String div, int readCnt, String regDt,
			String regId, String modDt, String modId, int commentNo, int postNo, int replyDelete, int boardDelete,
			int no, int identifier, String subject, String context, String registrationDate, String log1, String log2,
			String startDate, String endDate, String logDate) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.passwd = passwd;
		this.userName = userName;
		this.birthday = birthday;
		this.gender = gender;
		this.keyword = keyword;
		this.email = email;
		this.phoneNo = phoneNo;
		this.userLevel = userLevel;
		this.withdrawal = withdrawal;
		this.agree = agree;
		this.otpUse = otpUse;
		this.termsOfUse = termsOfUse;
		this.seq = seq;
		this.title = title;
		this.contents = contents;
		this.div = div;
		this.readCnt = readCnt;
		this.regDt = regDt;
		this.regId = regId;
		this.modDt = modDt;
		this.modId = modId;
		this.commentNo = commentNo;
		this.postNo = postNo;
		this.replyDelete = replyDelete;
		this.boardDelete = boardDelete;
		this.no = no;
		this.identifier = identifier;
		this.subject = subject;
		this.context = context;
		this.registrationDate = registrationDate;
		this.log1 = log1;
		this.log2 = log2;
		this.startDate = startDate;
		this.endDate = endDate;
		this.logDate = logDate;
	}


	public String getRegistrationDate() {
		return registrationDate;
	}


	public void setRegistrationDate(String registrationDate) {
		this.registrationDate = registrationDate;
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

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
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

	public String getPhoneNo() {
		return phoneNo;
	}

	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}

	public String getUserLevel() {
		return userLevel;
	}

	public void setUserLevel(String userLevel) {
		this.userLevel = userLevel;
	}

	public int getWithdrawal() {
		return withdrawal;
	}

	public void setWithdrawal(int withdrawal) {
		this.withdrawal = withdrawal;
	}

	public int getAgree() {
		return agree;
	}

	public void setAgree(int agree) {
		this.agree = agree;
	}

	public int getOtpUse() {
		return otpUse;
	}

	public void setOtpUse(int otpUse) {
		this.otpUse = otpUse;
	}

	public List<Integer> getTermsOfUse() {
		return termsOfUse;
	}

	public void setTermsOfUse(List<Integer> termsOfUse) {
		this.termsOfUse = termsOfUse;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getDiv() {
		return div;
	}

	public void setDiv(String div) {
		this.div = div;
	}

	public int getReadCnt() {
		return readCnt;
	}

	public void setReadCnt(int readCnt) {
		this.readCnt = readCnt;
	}

	public String getRegDt() {
		return regDt;
	}

	public void setRegDt(String regDt) {
		this.regDt = regDt;
	}

	public String getRegId() {
		return regId;
	}

	public void setRegId(String regId) {
		this.regId = regId;
	}

	public String getModDt() {
		return modDt;
	}

	public void setModDt(String modDt) {
		this.modDt = modDt;
	}

	public String getModId() {
		return modId;
	}

	public void setModId(String modId) {
		this.modId = modId;
	}

	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	public int getReplyDelete() {
		return replyDelete;
	}

	public void setReplyDelete(int replyDelete) {
		this.replyDelete = replyDelete;
	}

	public int getBoardDelete() {
		return boardDelete;
	}

	public void setBoardDelete(int boardDelete) {
		this.boardDelete = boardDelete;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getIdentifier() {
		return identifier;
	}

	public void setIdentifier(int identifier) {
		this.identifier = identifier;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContext() {
		return context;
	}

	public void setContext(String context) {
		this.context = context;
	}

	public String getLog1() {
		return log1;
	}

	public void setLog1(String log1) {
		this.log1 = log1;
	}

	public String getLog2() {
		return log2;
	}

	public void setLog2(String log2) {
		this.log2 = log2;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getLogDate() {
		return logDate;
	}

	public void setLogDate(String logDate) {
		this.logDate = logDate;
	}


	@Override
	public String toString() {
		return "AdminPageVO [userNo=" + userNo + ", userId=" + userId + ", passwd=" + passwd + ", userName=" + userName
				+ ", birthday=" + birthday + ", gender=" + gender + ", keyword=" + keyword + ", email=" + email
				+ ", phoneNo=" + phoneNo + ", userLevel=" + userLevel + ", withdrawal=" + withdrawal + ", agree="
				+ agree + ", otpUse=" + otpUse + ", termsOfUse=" + termsOfUse + ", seq=" + seq + ", title=" + title
				+ ", contents=" + contents + ", div=" + div + ", readCnt=" + readCnt + ", regDt=" + regDt + ", regId="
				+ regId + ", modDt=" + modDt + ", modId=" + modId + ", commentNo=" + commentNo + ", postNo=" + postNo
				+ ", replyDelete=" + replyDelete + ", boardDelete=" + boardDelete + ", no=" + no + ", identifier="
				+ identifier + ", subject=" + subject + ", context=" + context + ", registrationDate="
				+ registrationDate + ", log1=" + log1 + ", log2=" + log2 + ", startDate=" + startDate + ", endDate="
				+ endDate + ", logDate=" + logDate + "]";
	}

	

}
