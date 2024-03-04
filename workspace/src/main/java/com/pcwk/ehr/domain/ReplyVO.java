package com.pcwk.ehr.domain;

import com.pcwk.ehr.cmn.DTO;

public class ReplyVO extends DTO{

	private int	   commentNo; // 댓글번호
	private String userId; 	  // 아이디
	private int    postNo;    // 글번호
	private String contents;  // 댓글내용
	private String regDt;     // 등록일
	private String modDt;     // 수정일
	private int    replyDelete ; //삭제여부
	
	
	public ReplyVO() {
		super();
	}


	public int getCommentNo() {
		return commentNo;
	}


	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public int getPostNo() {
		return postNo;
	}


	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}


	public String getContents() {
		return contents;
	}


	public void setContents(String contents) {
		this.contents = contents;
	}


	public String getRegDt() {
		return regDt;
	}


	public void setRegDt(String regDt) {
		this.regDt = regDt;
	}


	public String getModDt() {
		return modDt;
	}


	public void setModDt(String modDt) {
		this.modDt = modDt;
	}


	public int getReplyDelete() {
		return replyDelete;
	}


	public void setReplyDelete(int replyDelete) {
		this.replyDelete = replyDelete;
	}


	
	public ReplyVO(int commentNo, String userId, int postNo, String contents, String regDt, String modDt,
			int replyDelete) {
		super();
		this.commentNo = commentNo;
		this.userId = userId;
		this.postNo = postNo;
		this.contents = contents;
		this.regDt = regDt;
		this.modDt = modDt;
		this.replyDelete = replyDelete;
	}


	@Override
	public String toString() {
		return "ReplyVO [commentNo=" + commentNo + ", userId=" + userId + ", postNo=" + postNo + ", contents="
				+ contents + ", regDt=" + regDt + ", modDt=" + modDt + ", replyDelete=" + replyDelete + "]";
	}
	
	

	
	
	
	
	
	
	
}
