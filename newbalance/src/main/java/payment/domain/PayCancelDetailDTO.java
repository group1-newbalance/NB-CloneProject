package payment.domain;

public class PayCancelDetailDTO {
	

	
	private String pdName;//pd_name
	private String colorCode;//color_code
	private String color;//color
	private int ordDiscount;//ord_discount
	
	private int ordAmount;//ord_amount
	
	private String payDate;//pay_date
	private String osStatus;//os_status
	private String imgUrl;//img_url
	private int totalPayAmt;//total_payamt 
	private double cpBenefitAmt; // ex 0.05 cp_benefitamt
	private int cpBenefitType;// 0일때 - , 1 일때 % 할인 cp_benefitype
	private int addMi; //addmi
	private int usercpSeq; //usercp_seq
	private int miSeq; //mi_seq
	private String payType;//pay_type
	private String pcDate;//pc_date
	private String sz;
	private int ordinfoCount;
	private String pdCode;
	
	public String getPdName() {
		return pdName;
	}
	public void setPdName(String pdName) {
		this.pdName = pdName;
	}
	public String getColorCode() {
		return colorCode;
	}
	public void setColorCode(String colorCode) {
		this.colorCode = colorCode;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
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
	public String getPayDate() {
		return payDate;
	}
	public void setPayDate(String payDate) {
		this.payDate = payDate;
	}
	public String getOsStatus() {
		return osStatus;
	}
	public void setOsStatus(String osStatus) {
		this.osStatus = osStatus;
	}
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	public int getTotalPayAmt() {
		return totalPayAmt;
	}
	public void setTotalPayAmt(int totalPayAmt) {
		this.totalPayAmt = totalPayAmt;
	}
	public double getCpBenefitAmt() {
		return cpBenefitAmt;
	}
	public void setCpBenefitAmt(double cpBenefitAmt) {
		this.cpBenefitAmt = cpBenefitAmt;
	}
	public int getCpBenefitType() {
		return cpBenefitType;
	}
	public void setCpBenefitType(int cpBenefitType) {
		this.cpBenefitType = cpBenefitType;
	}
	public int getAddMi() {
		return addMi;
	}
	public void setAddMi(int addMi) {
		this.addMi = addMi;
	}
	public int getUsercpSeq() {
		return usercpSeq;
	}
	public void setUsercpSeq(int usercpSeq) {
		this.usercpSeq = usercpSeq;
	}
	public int getMiSeq() {
		return miSeq;
	}
	public void setMiSeq(int miSeq) {
		this.miSeq = miSeq;
	}
	public String getPayType() {
		return payType;
	}
	public void setPayType(String payType) {
		this.payType = payType;
	}
	public String getPcDate() {
		return pcDate;
	}
	public void setPcDate(String pcDate) {
		this.pcDate = pcDate;
	}
	public String getSz() {
		return sz;
	}
	public void setSz(String sz) {
		this.sz = sz;
	}
	public int getOrdinfoCount() {
		return ordinfoCount;
	}
	public void setOrdinfoCount(int ordinfoCount) {
		this.ordinfoCount = ordinfoCount;
	}
	public String getPdCode() {
		return pdCode;
	}
	public void setPdCode(String pdCode) {
		this.pdCode = pdCode;
	}
	@Override
	public String toString() {
		return "PayCancelDetailDTO [pdName=" + pdName + ", colorCode=" + colorCode + ", color=" + color
				+ ", ordDiscount=" + ordDiscount + ", ordAmount=" + ordAmount + ", payDate=" + payDate + ", osStatus="
				+ osStatus + ", imgUrl=" + imgUrl + ", totalPayAmt=" + totalPayAmt + ", cpBenefitAmt=" + cpBenefitAmt
				+ ", cpBenefitType=" + cpBenefitType + ", addMi=" + addMi + ", usercpSeq=" + usercpSeq + ", miSeq="
				+ miSeq + ", payType=" + payType + ", pcDate=" + pcDate + ", sz=" + sz + ", ordinfoCount="
				+ ordinfoCount + ", pdCode=" + pdCode + "]";
	}
	public PayCancelDetailDTO(String pdName, String colorCode, String color, int ordDiscount, int ordAmount,
			String payDate, String osStatus, String imgUrl, int totalPayAmt, double cpBenefitAmt, int cpBenefitType,
			int addMi, int usercpSeq, int miSeq, String payType, String pcDate, String sz, int ordinfoCount
			) {
		super();
		this.pdName = pdName;
		this.colorCode = colorCode;
		this.color = color;
		this.ordDiscount = ordDiscount;
		this.ordAmount = ordAmount;
		this.payDate = payDate;
		this.osStatus = osStatus;
		this.imgUrl = imgUrl;
		this.totalPayAmt = totalPayAmt;
		this.cpBenefitAmt = cpBenefitAmt;
		this.cpBenefitType = cpBenefitType;
		this.addMi = addMi;
		this.usercpSeq = usercpSeq;
		this.miSeq = miSeq;
		this.payType = payType;
		this.pcDate = pcDate;
		this.sz = sz;
		this.ordinfoCount = ordinfoCount;
		
	}
	public PayCancelDetailDTO() {
		super();
	}
	
	
	
	
	
	
}
