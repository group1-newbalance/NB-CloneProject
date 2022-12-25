package productlist.domain;

public class ProductColorDTO {
	
	private int imgRowNumber;
	private String color_code;
	private String color_url;
	
	
	
	
	public ProductColorDTO(int imgRowNumber, String color_code, String color_url) {
		super();
		this.imgRowNumber = imgRowNumber;
		this.color_code = color_code;
		this.color_url = color_url;
	}
	
	public int getImgRowNumber() {
		return imgRowNumber;
	}
	public void setImgRowNumber(int imgRowNumber) {
		this.imgRowNumber = imgRowNumber;
	}
	public String getColor_code() {
		return color_code;
	}
	public void setColor_code(String color_code) {
		this.color_code = color_code;
	}
	public String getColor_url() {
		return color_url;
	}
	public void setColor_url(String color_url) {
		this.color_url = color_url;
	}
	

	
	

}
