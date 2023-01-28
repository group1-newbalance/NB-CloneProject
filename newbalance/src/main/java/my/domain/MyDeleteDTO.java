package my.domain;

public class MyDeleteDTO {
	
	private int delSeq; 
	private String userCode;
	private String delDate;
	public int getDelSeq() {
		return delSeq;
	}
	public void setDelSeq(int delSeq) {
		this.delSeq = delSeq;
	}
	public String getUserCode() {
		return userCode;
	}
	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}
	public String getDelDate() {
		return delDate;
	}
	public void setDelDate(String delDate) {
		this.delDate = delDate;
	}
	public MyDeleteDTO(int delSeq, String userCode, String delDate) {
		super();
		this.delSeq = delSeq;
		this.userCode = userCode;
		this.delDate = delDate;
	}
	@Override
	public String toString() {
		return "MyDeleteDTO [delSeq=" + delSeq + ", userCode=" + userCode + ", delDate=" + delDate + "]";
	}
	
	
	
	

}
