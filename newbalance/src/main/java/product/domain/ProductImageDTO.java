package product.domain;

public class ProductImageDTO {
	
	private int imgRowNumber;
	private String pdCode;
	private String imgUrl;
	
	
	public ProductImageDTO() {
		super();
	}

	public ProductImageDTO(int imgRowNumber, String pdCode, String imgUrl) {
		super();
		this.imgRowNumber = imgRowNumber;
		this.pdCode = pdCode;
		this.imgUrl = imgUrl;
	}
	
	
	@Override
	public String toString() {
		return "ProductImgDTO [imgRowNumber=" + imgRowNumber + ", pdCode=" + pdCode + ", imgUrl=" + imgUrl + "]";
	}

	
	public int getImgRowNumber() {
		return imgRowNumber;
	}
	public void setImgRowNumber(int imgRowNumber) {
		this.imgRowNumber = imgRowNumber;
	}
	public String getPdCode() {
		return pdCode;
	}
	public void setPdCode(String pdCode) {
		this.pdCode = pdCode;
	}
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
}
