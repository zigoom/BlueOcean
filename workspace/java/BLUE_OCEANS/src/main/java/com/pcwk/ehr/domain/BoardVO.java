package com.pcwk.ehr.domain;

import com.pcwk.ehr.cmn.DTO;

public class BoardVO extends DTO {
	private int    num      ;//화면 출력 번호 post_no?
	private int    seq      ;//board테이블 고유 넘버
	private String userId   ;//아이디
	private String title    ;//제목
	private String contents ;//내용
	private int    readCnt  ;//조회수
	private String regDt    ;//등록일
	private String modDt    ;//수정일
	private int boardDelete ;//삭제여부
	private String div      ;//구분
	
	
	
	public BoardVO() {
		super();
	}



	public int getNum() {
		return num;
	}



	public void setNum(int num) {
		this.num = num;
	}



	public int getSeq() {
		return seq;
	}



	public void setSeq(int seq) {
		this.seq = seq;
	}



	public String getUserId() {
		return userId;
	}



	public void setUserId(String userId) {
		this.userId = userId;
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



	public String getModDt() {
		return modDt;
	}



	public void setModDt(String modDt) {
		this.modDt = modDt;
	}



	public int getBoardDelete() {
		return boardDelete;
	}



	public void setBoardDelete(int boardDelete) {
		this.boardDelete = boardDelete;
	}



	public String getDiv() {
		return div;
	}



	public void setDiv(String div) {
		this.div = div;
	}



	public BoardVO(int num, int seq, String userId, String title, String contents, int readCnt, String regDt,
			String modDt, int boardDelete, String div) {
		super();
		this.num = num;
		this.seq = seq;
		this.userId = userId;
		this.title = title;
		this.contents = contents;
		this.readCnt = readCnt;
		this.regDt = regDt;
		this.modDt = modDt;
		this.boardDelete = boardDelete;
		this.div = div;
	}



	@Override
	public String toString() {
		return "BoardVO [num=" + num + ", seq=" + seq + ", userId=" + userId + ", title=" + title + ", contents="
				+ contents + ", readCnt=" + readCnt + ", regDt=" + regDt + ", modDt=" + modDt + ", boardDelete="
				+ boardDelete + ", div=" + div + "]";
	}

	
	
	
}
