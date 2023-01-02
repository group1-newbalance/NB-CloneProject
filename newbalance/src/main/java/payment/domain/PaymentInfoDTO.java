package payment.domain;

public class PaymentInfoDTO {
	private int payCode; // seq
	private String userCode;
	private String payType;
	private int ordDisCount;
	private int ordAmount;
	private String payName;
	private String payDate;//SYSDATE
	private String payStatus;
	
	private String ordCode;
	private int cardSeq;
	private int bankSeq;
	private String imgUrl;
	private String pdName;
	
	public int getPayCode() {
		return payCode;
	}
	public void setPayCode(int payCode) {
		this.payCode = payCode;
	}
	public String getUserCode() {
		return userCode;
	}
	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}
	public String getPayType() {
		return payType;
	}
	public void setPayType(String payType) {
		this.payType = payType;
	}
	public int getOrdDisCount() {
		return ordDisCount;
	}
	public void setOrdDisCount(int ordDisCount) {
		this.ordDisCount = ordDisCount;
	}
	public int getOrdAmount() {
		return ordAmount;
	}
	public void setOrdAmount(int ordAmount) {
		this.ordAmount = ordAmount;
	}
	public String getPayName() {
		return payName;
	}
	public void setPayName(String payName) {
		this.payName = payName;
	}
	public String getPayDate() {
		return payDate;
	}
	public void setPayDate(String payDate) {
		this.payDate = payDate;
	}
	public String getPayStatus() {
		return payStatus;
	}
	public void setPayStatus(String payStatus) {
		this.payStatus = payStatus;
	}
	public String getOrdCode() {
		return ordCode;
	}
	public void setOrdCode(String ordCode) {
		this.ordCode = ordCode;
	}
	public int getCardSeq() {
		return cardSeq;
	}
	public void setCardSeq(int cardSeq) {
		this.cardSeq = cardSeq;
	}
	public int getBankSeq() {
		return bankSeq;
	}
	public void setBankSeq(int bankSeq) {
		this.bankSeq = bankSeq;
	}
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
	@Override
	public String toString() {
		return "PaymentInfoDTO [payCode=" + payCode + ", userCode=" + userCode + ", payType=" + payType
				+ ", ordDisCount=" + ordDisCount + ", ordAmount=" + ordAmount + ", payName=" + payName + ", payDate="
				+ payDate + ", payStatus=" + payStatus + ", ordCode=" + ordCode + ", cardSeq=" + cardSeq + ", bankSeq="
				+ bankSeq + ", imgUrl=" + imgUrl + ", pdName=" + pdName + "]";
	}
	public PaymentInfoDTO(int payCode, String userCode, String payType, int ordDisCount, int ordAmount, String payName,
			String payDate, String payStatus, String ordCode, int cardSeq, int bankSeq, String imgUrl, String pdName) {
		super();
		this.payCode = payCode;
		this.userCode = userCode;
		this.payType = payType;
		this.ordDisCount = ordDisCount;
		this.ordAmount = ordAmount;
		this.payName = payName;
		this.payDate = payDate;
		this.payStatus = payStatus;
		this.ordCode = ordCode;
		this.cardSeq = cardSeq;
		this.bankSeq = bankSeq;
		this.imgUrl = imgUrl;
		this.pdName = pdName;
	}
	public PaymentInfoDTO() {
		super();
	}
	
	
	
	
	
}


