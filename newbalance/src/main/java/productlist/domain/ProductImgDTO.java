package productlist.domain;

public class ProductImgDTO {
	
	private int imgRowNumber;
	private String pd_code;
	private String img_url;
	
	public ProductImgDTO(int imgRowNumber, String pd_code, String img_url) {
		super();
		this.imgRowNumber = imgRowNumber;
		this.pd_code = pd_code;
		this.img_url = img_url;
	}
	
	
	
	@Override
	public String toString() {
		return "ProductImgDTO [imgRowNumber=" + imgRowNumber + ", pd_code=" + pd_code + ", img_url=" + img_url + "]";
	}



	public int getImgRowNumber() {
		return imgRowNumber;
	}
	public void setImgRowNumber(int imgRowNumber) {
		this.imgRowNumber = imgRowNumber;
	}
	public String getPd_code() {
		return pd_code;
	}
	public void setPd_code(String pd_code) {
		this.pd_code = pd_code;
	}
	public String getImg_url() {
		return img_url;
	}
	public void setImg_url(String img_url) {
		this.img_url = img_url;
	}
	
	

	

	
	
	
}
