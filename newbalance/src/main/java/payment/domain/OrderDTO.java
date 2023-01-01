package payment.domain;

public class OrderDTO {
	//주문내역 테이블 order
	private String ordCode;
	private int ordAmount;
	private int ordDiscount;
	private String userPhone;
	private String ordName;
	private String userEmail;
	private String ordDate;
	private int ordZipcode;
	private String ordAddress;
	private String ordCfDate;
	private int ordCfCheck;
	private String nonUserCode;
	private String userCode;
	private int usercpSeq;
	private int mi_seq;
	
	public OrderDTO(String ordCode, int ordAmount, int ordDiscount, String userPhone, String ordName, String userEmail,
			String ordDate, int ordZipcode, String ordAddress, String ordCfDate, int ordCfCheck, String nonUserCode,
			String userCode, int usercpSeq, int mi_seq) {
		super();
		this.ordCode = ordCode;
		this.ordAmount = ordAmount;
		this.ordDiscount = ordDiscount;
		this.userPhone = userPhone;
		this.ordName = ordName;
		this.userEmail = userEmail;
		this.ordDate = ordDate;
		this.ordZipcode = ordZipcode;
		this.ordAddress = ordAddress;
		this.ordCfDate = ordCfDate;
		this.ordCfCheck = ordCfCheck;
		this.nonUserCode = nonUserCode;
		this.userCode = userCode;
		this.usercpSeq = usercpSeq;
		this.mi_seq = mi_seq;
	}
	public OrderDTO() {
		super();
	}
	public String getOrdCode() {
		return ordCode;
	}
	public void setOrdCode(String ordCode) {
		this.ordCode = ordCode;
	}
	public int getOrdAmount() {
		return ordAmount;
	}
	public void setOrdAmount(int ordAmount) {
		this.ordAmount = ordAmount;
	}
	public int getOrdDiscount() {
		return ordDiscount;
	}
	public void setOrdDiscount(int ordDiscount) {
		this.ordDiscount = ordDiscount;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getOrdName() {
		return ordName;
	}
	public void setOrdName(String ordName) {
		this.ordName = ordName;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getOrdDate() {
		return ordDate;
	}
	public void setOrdDate(String ordDate) {
		this.ordDate = ordDate;
	}
	public int getOrdZipcode() {
		return ordZipcode;
	}
	public void setOrdZipcode(int ordZipcode) {
		this.ordZipcode = ordZipcode;
	}
	public String getOrdAddress() {
		return ordAddress;
	}
	public void setOrdAddress(String ordAddress) {
		this.ordAddress = ordAddress;
	}
	public String getOrdCfDate() {
		return ordCfDate;
	}
	public void setOrdCfDate(String ordCfDate) {
		this.ordCfDate = ordCfDate;
	}
	public int getOrdCfCheck() {
		return ordCfCheck;
	}
	public void setOrdCfCheck(int ordCfCheck) {
		this.ordCfCheck = ordCfCheck;
	}
	public String getNonUserCode() {
		return nonUserCode;
	}
	public void setNonUserCode(String nonUserCode) {
		this.nonUserCode = nonUserCode;
	}
	public String getUserCode() {
		return userCode;
	}
	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}
	public int getUsercpSeq() {
		return usercpSeq;
	}
	public void setUsercpSeq(int usercpSeq) {
		this.usercpSeq = usercpSeq;
	}
	public int getMi_seq() {
		return mi_seq;
	}
	public void setMi_seq(int mi_seq) {
		this.mi_seq = mi_seq;
	}
	@Override
	public String toString() {
		return "OrderDTO [ordCode=" + ordCode + ", ordAmount=" + ordAmount + ", ordDiscount=" + ordDiscount
				+ ", userPhone=" + userPhone + ", ordName=" + ordName + ", userEmail=" + userEmail + ", ordDate="
				+ ordDate + ", ordZipcode=" + ordZipcode + ", ordAddress=" + ordAddress + ", ordCfDate=" + ordCfDate
				+ ", ordCfCheck=" + ordCfCheck + ", nonUserCode=" + nonUserCode + ", userCode=" + userCode
				+ ", usercpSeq=" + usercpSeq + ", mi_seq=" + mi_seq + "]";
	}
	
	
	
	

	
}
