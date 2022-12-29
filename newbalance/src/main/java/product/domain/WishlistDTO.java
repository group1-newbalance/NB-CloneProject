package product.domain;

public class WishlistDTO {

	private int wishCode;
	private String[] pdCode;
	private String userCode;
	
	public WishlistDTO(String[] pdCode, String userCode) {
		this.pdCode = pdCode;
		this.userCode = userCode;
	}

	public int getWishCode() {
		return wishCode;
	}
	
	public String[] getPdCode() {
		return pdCode;
	}

	public String getUserCode() {
		return userCode;
	}

	
	
}
