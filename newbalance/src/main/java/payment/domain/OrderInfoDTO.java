package payment.domain;

public class OrderInfoDTO {
	private int ordInfoSeq;
	private String pdCode;
	private String color;
	private String sz;
	private int ordInfoCount;
	private String osStatus;
	private String ordCode;
	private String imgUrl;
	public int getOrdInfoSeq() {
		return ordInfoSeq;
	}
	public void setOrdInfoSeq(int ordInfoSeq) {
		this.ordInfoSeq = ordInfoSeq;
	}
	public String getPdCode() {
		return pdCode;
	}
	public void setPdCode(String pdCode) {
		this.pdCode = pdCode;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getSz() {
		return sz;
	}
	public void setSz(String sz) {
		this.sz = sz;
	}
	public int getOrdInfoCount() {
		return ordInfoCount;
	}
	public void setOrdInfoCount(int ordInfoCount) {
		this.ordInfoCount = ordInfoCount;
	}
	public String getOsStatus() {
		return osStatus;
	}
	public void setOsStatus(String osStatus) {
		this.osStatus = osStatus;
	}
	public String getOrdCode() {
		return ordCode;
	}
	public void setOrdCode(String ordCode) {
		this.ordCode = ordCode;
	}
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	@Override
	public String toString() {
		return "OrderInfoDTO [ordInfoSeq=" + ordInfoSeq + ", pdCode=" + pdCode + ", color=" + color + ", sz=" + sz
				+ ", ordInfoCount=" + ordInfoCount + ", osStatus=" + osStatus + ", ordCode=" + ordCode + ", imgUrl="
				+ imgUrl + "]";
	}
	public OrderInfoDTO(int ordInfoSeq, String pdCode, String color, String sz, int ordInfoCount, String osStatus,
			String ordCode, String imgUrl) {
		super();
		this.ordInfoSeq = ordInfoSeq;
		this.pdCode = pdCode;
		this.color = color;
		this.sz = sz;
		this.ordInfoCount = ordInfoCount;
		this.osStatus = osStatus;
		this.ordCode = ordCode;
		this.imgUrl = imgUrl;
	}
	public OrderInfoDTO() {
		super();
	}
	
	
}
