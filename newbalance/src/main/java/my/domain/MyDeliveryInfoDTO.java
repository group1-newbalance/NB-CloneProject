package my.domain;

public class MyDeliveryInfoDTO {
	private int maSeq;
	private String userCode;
	private String maName;
	private String maZipcode;
	private String maAddress1;
	private String maAddress2;
	private String maPhone;
	private int maDefault;
	
	
	//UPDATE
	public MyDeliveryInfoDTO(int maSeq, String userCode, String maName, String maZipcode, String maAddress1,
			String maAddress2, String maPhone, int maDefault) {
		this.maSeq = maSeq;
		this.userCode = userCode;
		this.maName = maName;
		this.maZipcode = maZipcode;
		this.maAddress1 = maAddress1;
		this.maAddress2 = maAddress2;
		this.maPhone = maPhone;
		this.maDefault = maDefault;
	}
	
	//INSERT
	public MyDeliveryInfoDTO(String userCode, String maName, String maZipcode, String maAddress1, String maAddress2,
			String maPhone, int maDefault) {
		this.userCode = userCode;
		this.maName = maName;
		this.maZipcode = maZipcode;
		this.maAddress1 = maAddress1;
		this.maAddress2 = maAddress2;
		this.maPhone = maPhone;
		this.maDefault = maDefault;
	}
	
	//SELECT
	public MyDeliveryInfoDTO(int maSeq, String maName, String maZipcode, String maAddress1, String maAddress2,
			String maPhone, int maDefault) {
		super();
		this.maSeq = maSeq;
		this.maName = maName;
		this.maZipcode = maZipcode;
		this.maAddress1 = maAddress1;
		this.maAddress2 = maAddress2;
		this.maPhone = maPhone;
		this.maDefault = maDefault;
	}

	public String getUserCode() {
		return userCode;
	}
	public int getMaSeq() {
		return maSeq;
	}
	public String getMaName() {
		return maName;
	}
	public String getMaZipcode() {
		return maZipcode;
	}
	public String getMaAddress1() {
		return maAddress1;
	}
	public String getMaAddress2() {
		return maAddress2;
	}
	public String getMaPhone() {
		return maPhone;
	}
	public int getMaDefault() {
		return maDefault;
	}
	
	
	
		
	
}
