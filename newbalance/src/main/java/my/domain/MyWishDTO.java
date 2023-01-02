package my.domain;

public class MyWishDTO {
	private String pdCode;
	private String imgUrl;
	private int pdPrice;
	private String pdName;
	private int wishCode;
	
	public MyWishDTO(String pdCode, String imgUrl, int pdPrice, String pdName, int wishCode) {
		this.pdCode = pdCode;
		this.imgUrl = imgUrl;
		this.pdPrice = pdPrice;
		this.pdName = pdName;
		this.wishCode = wishCode;
	}

	public String getPdCode() {
		return pdCode;
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public int getPdPrice() {
		return pdPrice;
	}

	public String getPdName() {
		return pdName;
	}

	public int getWishCode() {
		return wishCode;
	}
	
	
	
	
	
}
