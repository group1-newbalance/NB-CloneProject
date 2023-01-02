package product.domain;

public class AddCartDTO {

	private String userCode;
	private String pdCode;
	private int[] sizeCodeList;
	private String color;
	private String pdImage;
	
	public AddCartDTO(String userCode, String pdCode, int[] sizeCodeList, String color, String pdImage) {
		super();
		this.userCode = userCode;
		this.pdCode = pdCode;
		this.sizeCodeList = sizeCodeList;
		this.color = color;
		this.pdImage = pdImage;
	}
	
	public String getUserCode() {
		return userCode;
	}
	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}
	public String getPdCode() {
		return pdCode;
	}
	public void setPdCode(String pdCode) {
		this.pdCode = pdCode;
	}
	public int[] getSizeCode() {
		return sizeCodeList;
	}
	public void setSizeCode(int[] sizeCodeList) {
		this.sizeCodeList = sizeCodeList;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getPdImage() {
		return pdImage;
	}
	public void setPdImage(String pdImage) {
		this.pdImage = pdImage;
	}

}
