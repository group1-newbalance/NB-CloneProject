package payment.domain;

public class Payment_infoDTO {
	private int payCode;
	private String userCode;
	private String payType;
	private int ordDiscount;
	private int ordAmount;
	
	private String payName;
	private String payStatus;
	private String ordCode;
	private int cardSeq;
	private int bankSeq;
	private String img_url;
	private String pd_name;
	
	public String getPd_name() {
		return pd_name;
	}
	public void setPd_name(String pd_name) {
		this.pd_name = pd_name;
	}
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
	public int getOrdDiscount() {
		return ordDiscount;
	}
	public void setOrdDiscount(int ordDiscount) {
		this.ordDiscount = ordDiscount;
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
	public String getImg_url() {
		return img_url;
	}
	public void setImg_url(String img_url) {
		this.img_url = img_url;
	}
	public Payment_infoDTO(int payCode, String userCode, String payType, int ordDiscount, int ordAmount, String payName,
			String payStatus, String ordCode, int cardSeq, int bankSeq, String img_url, String pd_name) {
		super();
		this.payCode = payCode;
		this.userCode = userCode;
		this.payType = payType;
		this.ordDiscount = ordDiscount;
		this.ordAmount = ordAmount;
		this.payName = payName;
		this.payStatus = payStatus;
		this.ordCode = ordCode;
		this.cardSeq = cardSeq;
		this.bankSeq = bankSeq;
		this.img_url = img_url;
		this.pd_name = pd_name;
	}
	
	
	
}
