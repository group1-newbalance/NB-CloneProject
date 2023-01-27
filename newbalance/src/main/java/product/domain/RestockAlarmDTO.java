package product.domain;

import java.sql.Date;

public class RestockAlarmDTO {

	private int rsCode;
	private String rsAlert;
	private Date rsApplyDate;
	private Date rsComplDate;
	private String userCode;
	private String pdCode;
	private String color;
	private String size;
	private String colorCode;
	private String pdName;
	private String imgUrl;
	

	public RestockAlarmDTO(String userCode, String pdCode, String color, String size
			, String colorCode, String pdName, String imgUrl) {
		super();
		this.userCode = userCode;
		this.pdCode = pdCode;
		this.color = color;
		this.size = size;
		this.colorCode = colorCode;
		this.pdName = pdName;
		this.imgUrl = imgUrl;
	}
	
	public String getColorCode() {
		return colorCode;
	}
	public void setColorCode(String colorCode) {
		this.colorCode = colorCode;
	}
	public String getPdName() {
		return pdName;
	}
	public void setPdName(String pdName) {
		this.pdName = pdName;
	}
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	public int getRsCode() {
		return rsCode;
	}
	public String getRsAlert() {
		return rsAlert;
	}
	public Date getRsApplyDate() {
		return rsApplyDate;
	}
	public Date getRsComplDate() {
		return rsComplDate;
	}
	public String getUserCode() {
		return userCode;
	}
	public String getPdCode() {
		return pdCode;
	}
	public String getColor() {
		return color;
	}
	public String getSize() {
		return size;
	}

	public void setRsCode(int rsCode) {
		this.rsCode = rsCode;
	}

	public void setRsAlert(String rsAlert) {
		this.rsAlert = rsAlert;
	}

	public void setRsApplyDate(Date rsApplyDate) {
		this.rsApplyDate = rsApplyDate;
	}

	public void setRsComplDate(Date rsComplDate) {
		this.rsComplDate = rsComplDate;
	}

	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}

	public void setPdCode(String pdCode) {
		this.pdCode = pdCode;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public void setSize(String size) {
		this.size = size;
	}

	
}
