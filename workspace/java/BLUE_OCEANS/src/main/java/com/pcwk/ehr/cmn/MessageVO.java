package com.pcwk.ehr.cmn;

public class MessageVO {
	private String megId;//메시지 id
	private String msgContents; //세미지
	
	public MessageVO() {}

	public MessageVO(String megId, String msgContents) {
		super();
		this.megId = megId;
		this.msgContents = msgContents;
	}

	public String getMegId() {
		return megId;
	}

	public void setMegId(String megId) {
		this.megId = megId;
	}

	public String getMsgContents() {
		return msgContents;
	}

	public void setMsgContents(String msgContents) {
		this.msgContents = msgContents;
	}

	@Override
	public String toString() {
		return "MessageVO [megId=" + megId + ", msgContents=" + msgContents + "]";
	}
	
	
}
