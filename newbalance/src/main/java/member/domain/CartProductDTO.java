package member.domain;

public class CartProductDTO {
	private int cartNum;
	private String userCode;
	private String pdCode;
	private int sizeCode;
	private String color;
	private int cartCount;
	private String pdImage;
	private String pdName;
	private int pdPrice;
	private String size;
	private int maxCount;
	
	@Override
	public String toString() {
		return "CartProductDTO [pdCode=" + pdCode + ", sizeCode=" + sizeCode + ", size=" + size + ", maxCount="
				+ maxCount + "]";
	}

	public CartProductDTO(String pdCode, int sizeCode, String size, int maxCount) {
		this.pdCode = pdCode;
		this.sizeCode = sizeCode;
		this.size = size;
		this.maxCount = maxCount;
	}

	public CartProductDTO(int cartNum, String userCode, int cartCount) {
		this.cartNum = cartNum;
		this.userCode = userCode;
		this.cartCount = cartCount;
	}

	public CartProductDTO(int cartNum, String pdCode, int sizeCode, String color, int cartCount, String pdImage,
			String pdName, int pdPrice, String size, int maxCount) {
		this.cartNum = cartNum;
		this.pdCode = pdCode;
		this.sizeCode = sizeCode;
		this.color = color;
		this.cartCount = cartCount;
		this.pdImage = pdImage;
		this.pdName = pdName;
		this.pdPrice = pdPrice;
		this.size = size;
		this.maxCount = maxCount;
	}
	
	public int getMaxCount() {
		return maxCount;
	}

	public int getCartNum() {
		return cartNum;
	}
	public String getUserCode() {
		return userCode;
	}
	public String getPdCode() {
		return pdCode;
	}
	public int getSizeCode() {
		return sizeCode;
	}
	public String getColor() {
		return color;
	}
	public int getCartCount() {
		return cartCount;
	}
	public String getPdImage() {
		return pdImage;
	}
	public String getPdName() {
		return pdName;
	}
	public int getPdPrice() {
		return pdPrice;
	}
	public String getSize() {
		return size;
	}
}
