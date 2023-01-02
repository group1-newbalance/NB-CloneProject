package payment.domain;

public class PayCancelDTO {

	private String imgUrl;
	private String pdName;
	private String ordCode;
	private int ordAmount;
	private String pcDate;
	private String pcStatus;
	
	//img_url, pd_name , ord_code , ord_amount , pc_date , pc_status
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	public String getPdName() {
		return pdName;
	}
	public void setPdName(String pdName) {
		this.pdName = pdName;
	}
	public int getOrdAmount() {
		return ordAmount;
	}
	public void setOrdAmount(int ordAmount) {
		this.ordAmount = ordAmount;
	}
	public String getOrdCode() {
		return ordCode;
	}
	public void setOrdCode(String ordCode) {
		this.ordCode = ordCode;
	}
	public String getPcStatus() {
		return pcStatus;
	}
	public void setPcStatus(String pcStatus) {
		this.pcStatus = pcStatus;
	}
	public String getPcDate() {
		return pcDate;
	}
	public void setPcDate(String pcDate) {
		this.pcDate = pcDate;
	}
	public PayCancelDTO(String imgUrl, String pdName, String ordCode, int ordAmount, String pcDate, String pcStatus) {
		super();
		this.imgUrl = imgUrl;
		this.pdName = pdName;
		this.ordCode = ordCode;
		this.ordAmount = ordAmount;
		this.pcDate = pcDate;
		this.pcStatus = pcStatus;
	}
	
	@Override
	public String toString() {
		return "PayCancelDTO [imgUrl=" + imgUrl + ", pdName=" + pdName + ", ordCode=" + ordCode + ", ordAmount="
				+ ordAmount + ", pcDate=" + pcDate + ", pcStatus=" + pcStatus + "]";
	}
	
	public PayCancelDTO() {
		super();
	}
	

	
	
	


//결제 취소정보 상품명 상품정보	주문번호	취소금액	신청일	구분
	
	
	
	
	
	
}
