package com.pcwk.ehr.cmn;

public class BookmarkVO {
	private int favoritesNo;		//관심번호
    private int userNo;				//유저번호
    private String userId;			//유저아이디
    private String stockCode;		//주식코드
    private String stockName;		//주식이름
    private int favoritesDelete;	//삭제여부
    
    public BookmarkVO() {
		// TODO Auto-generated constructor stub
	}

	public int getFavoritesNo() {
		return favoritesNo;
	}

	public void setFavoritesNo(int favoritesNo) {
		this.favoritesNo = favoritesNo;
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

	public String getStockCode() {
		return stockCode;
	}

	public void setStockCode(String stockCode) {
		this.stockCode = stockCode;
	}

	public String getStockName() {
		return stockName;
	}

	public void setStockName(String stockName) {
		this.stockName = stockName;
	}

	public int getFavoritesDelete() {
		return favoritesDelete;
	}

	public void setFavoritesDelete(int favoritesDelete) {
		this.favoritesDelete = favoritesDelete;
	}

	@Override
	public String toString() {
		return "BookmarkVO [favoritesNo=" + favoritesNo + ", userNo=" + userNo + ", userId=" + userId + ", stockCode="
				+ stockCode + ", stockName=" + stockName + ", favoritesDelete=" + favoritesDelete + "]";
	}

	public BookmarkVO(int favoritesNo, int userNo, String userId, String stockCode, String stockName,
			int favoritesDelete) {
		super();
		this.favoritesNo = favoritesNo;
		this.userNo = userNo;
		this.userId = userId;
		this.stockCode = stockCode;
		this.stockName = stockName;
		this.favoritesDelete = favoritesDelete;
	}
    
	
	
    
    
}
