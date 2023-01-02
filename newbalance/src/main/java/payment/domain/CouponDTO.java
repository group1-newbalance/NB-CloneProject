package payment.domain;

public class CouponDTO {

	private String cpCode;
	private int cpUseType;
	private String cpName;
	private int cpCondiType;
	private int cpCondiAmt;
	private String cpCondition;
	private double cpBenefitAmt;
	private String cpValidType;
	private int cpValidity;
	private int userCpSeq;
	private String cpSperiod;
	private String cpEperiod;
	
	public String getCpCode() {
		return cpCode;
	}
	public void setCpCode(String cpCode) {
		this.cpCode = cpCode;
	}
	public int getCpUseType() {
		return cpUseType;
	}
	public void setCpUseType(int cpUseType) {
		this.cpUseType = cpUseType;
	}
	public String getCpName() {
		return cpName;
	}
	public void setCpName(String cpName) {
		this.cpName = cpName;
	}
	public int getCpCondiType() {
		return cpCondiType;
	}
	public void setCpCondiType(int cpCondiType) {
		this.cpCondiType = cpCondiType;
	}
	public int getCpCondiAmt() {
		return cpCondiAmt;
	}
	public void setCpCondiAmt(int cpCondiAmt) {
		this.cpCondiAmt = cpCondiAmt;
	}
	public String getCpCondition() {
		return cpCondition;
	}
	public void setCpCondition(String cpCondition) {
		this.cpCondition = cpCondition;
	}
	public double getCpBenefitAmt() {
		return cpBenefitAmt;
	}
	public void setCpBenefitAmt(double cpBenefitAmt) {
		this.cpBenefitAmt = cpBenefitAmt;
	}
	public String getCpValidType() {
		return cpValidType;
	}
	public void setCpValidType(String cpValidType) {
		this.cpValidType = cpValidType;
	}
	public int getCpValidity() {
		return cpValidity;
	}
	public void setCpValidity(int cpValidity) {
		this.cpValidity = cpValidity;
	}
	public int getUserCpSeq() {
		return userCpSeq;
	}
	public void setUserCpSeq(int userCpSeq) {
		this.userCpSeq = userCpSeq;
	}
	public String getCpSperiod() {
		return cpSperiod;
	}
	public void setCpSperiod(String cpSperiod) {
		this.cpSperiod = cpSperiod;
	}
	public String getCpEperiod() {
		return cpEperiod;
	}
	public void setCpEperiod(String cpEperiod) {
		this.cpEperiod = cpEperiod;
	}
	@Override
	public String toString() {
		return "CouponDTO [cpCode=" + cpCode + ", cpUseType=" + cpUseType + ", cpName=" + cpName + ", cpCondiType="
				+ cpCondiType + ", cpCondiAmt=" + cpCondiAmt + ", cpCondition=" + cpCondition + ", cpBenefitAmt="
				+ cpBenefitAmt + ", cpValidType=" + cpValidType + ", cpValidity=" + cpValidity + ", userCpSeq="
				+ userCpSeq + ", cpSperiod=" + cpSperiod + ", cpEperiod=" + cpEperiod + "]";
	}
	public CouponDTO(String cpCode, int cpUseType, String cpName, int cpCondiType, int cpCondiAmt, String cpCondition,
			double cpBenefitAmt, String cpValidType, int cpValidity, int userCpSeq, String cpSperiod,
			String cpEperiod) {
		super();
		this.cpCode = cpCode;
		this.cpUseType = cpUseType;
		this.cpName = cpName;
		this.cpCondiType = cpCondiType;
		this.cpCondiAmt = cpCondiAmt;
		this.cpCondition = cpCondition;
		this.cpBenefitAmt = cpBenefitAmt;
		this.cpValidType = cpValidType;
		this.cpValidity = cpValidity;
		this.userCpSeq = userCpSeq;
		this.cpSperiod = cpSperiod;
		this.cpEperiod = cpEperiod;
	}
	public CouponDTO() {
		super();
	}
	
	
	
	
	
	
	
	
}
