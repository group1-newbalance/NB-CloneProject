package my.domain;

public class CouponDTO {
	
	private String cpCode;
	private double bfAmount;
	private String cpName;
	private int condiAmount;
	private int bfType;
	private String sPeriod;
	private String ePeriod;
	private String cpCondition;
	private int cpCondiType;
	
	
	public CouponDTO(String cpCode, double bfAmount, String cpName, int condiAmount, int bfType, String sPeriod, String ePeriod,
			String cpCondition, int cpCondiType) {
		super();
		this.cpCode = cpCode;
		this.bfAmount = bfAmount;
		this.cpName = cpName;
		this.condiAmount = condiAmount;
		this.bfType = bfType;
		this.sPeriod = sPeriod;
		this.ePeriod = ePeriod;
		this.cpCondition = cpCondition;
		this.cpCondiType = cpCondiType;
	}



	public CouponDTO(double bfAmount, String cpName, String sPeriod, String ePeriod, String cpCondition, int bfType) {
		super();
		this.bfAmount = bfAmount;
		this.cpName = cpName;
		this.sPeriod = sPeriod;
		this.ePeriod = ePeriod;
		this.cpCondition = cpCondition;
		this.bfType = bfType;
	}

	public CouponDTO() {
		// TODO Auto-generated constructor stub
	}



	public String getcpCode() {
		return cpCode;
	}

	public void setcpCode(String cpCode) {
		this.cpCode = cpCode;
	}

	public Double getBfAmount() {
		return bfAmount;
	}

	public void setBfAmount(double bfAmount) {
		this.bfAmount = bfAmount;
	}

	public String getCpName() {
		return cpName;
	}

	public void setCpName(String cpName) {
		this.cpName = cpName;
	}

	public int getCondiAmount() {
		return condiAmount;
	}

	public void setCondiAmount(int condiAmount) {
		this.condiAmount = condiAmount;
	}

	public int getBfType() {
		return bfType;
	}

	public void setBfType(int bfType) {
		this.bfType = bfType;
	}

	public String getsPeriod() {
		return sPeriod;
	}

	public void setsPeriod(String sPeriod) {
		this.sPeriod = sPeriod;
	}

	public String getePeriod() {
		return ePeriod;
	}

	public void setePeriod(String ePeriod) {
		this.ePeriod = ePeriod;
	}

	public String getCpCondition() {
		return cpCondition;
	}

	public void setCpCondition(String cpCondition) {
		this.cpCondition = cpCondition;
	}
	
	public int getcpCondiType() {
		return cpCondiType;
	}

	public void setcpCondiType(int cpCondiType) {
		this.cpCondiType = cpCondiType;
	}

	@Override
	public String toString() {
		return "CouponDTO [bfAmount=" + bfAmount + ", cpName=" + cpName + ", condiAmount=" + condiAmount + ", bfType="
				+ bfType + ", sPeriod=" + sPeriod + ", ePeriod=" + ePeriod + ", cpCondition=" + cpCondition
				+ ", cpCondiType=" + cpCondiType + "]";
	}

	

}
