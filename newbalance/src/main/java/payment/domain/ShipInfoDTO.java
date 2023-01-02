package payment.domain;

public class ShipInfoDTO {
	private String ordCode;
	private String shipName;
	private String shipPhone;
	private int shipZipCode;
	private String shipPhone2;
	private String shipRequest;
	private String shipAddress;
	private String userCode;
	
	public String getOrdCode() {
		return ordCode;
	}
	public void setOrdCode(String ordCode) {
		this.ordCode = ordCode;
	}
	public String getShipName() {
		return shipName;
	}
	public void setShipName(String shipName) {
		this.shipName = shipName;
	}
	public String getShipPhone() {
		return shipPhone;
	}
	public void setShipPhone(String shipPhone) {
		this.shipPhone = shipPhone;
	}
	public int getShipZipCode() {
		return shipZipCode;
	}
	public void setShipZipCode(int shipZipCode) {
		this.shipZipCode = shipZipCode;
	}
	public String getShipPhone2() {
		return shipPhone2;
	}
	public void setShipPhone2(String shipPhone2) {
		this.shipPhone2 = shipPhone2;
	}
	public String getShipRequest() {
		return shipRequest;
	}
	public void setShipRequest(String shipRequest) {
		this.shipRequest = shipRequest;
	}
	public String getShipAddress() {
		return shipAddress;
	}
	public void setShipAddress(String shipAddress) {
		this.shipAddress = shipAddress;
	}
	public String getUserCode() {
		return userCode;
	}
	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}
	@Override
	public String toString() {
		return "ShipInfoDTO [ordCode=" + ordCode + ", shipName=" + shipName + ", shipPhone=" + shipPhone
				+ ", shipZipCode=" + shipZipCode + ", shipPhone2=" + shipPhone2 + ", shipRequest=" + shipRequest
				+ ", shipAddress=" + shipAddress + ", userCode=" + userCode + "]";
	}
	public ShipInfoDTO(String ordCode, String shipName, String shipPhone, int shipZipCode, String shipPhone2,
			String shipRequest, String shipAddress, String userCode) {
		super();
		this.ordCode = ordCode;
		this.shipName = shipName;
		this.shipPhone = shipPhone;
		this.shipZipCode = shipZipCode;
		this.shipPhone2 = shipPhone2;
		this.shipRequest = shipRequest;
		this.shipAddress = shipAddress;
		this.userCode = userCode;
	}
	public ShipInfoDTO() {
		super();
	}
	
	
}
