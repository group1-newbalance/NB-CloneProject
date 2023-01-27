package product.domain;

public class BuyProductDTO {

	private String pdCode;
	private int pdPrice;
	private String pdSize;
	private int sizeCode;
	private int pdAmount;
	private String pdColor;
	private int colorCode;
	private String pdImage;
	private String pdName;

	// 구매하기용
	public BuyProductDTO(String pdCode, int pdPrice, String pdSize, int pdAmount, String pdColor, int colorCode,
			String pdImage, String pdName) {
		super();
		this.pdCode = pdCode;
		this.pdPrice = pdPrice;
		this.pdSize = pdSize;
		this.pdAmount = pdAmount;
		this.pdColor = pdColor;
		this.colorCode = colorCode;
		this.pdImage = pdImage;
		this.pdName = pdName;
	}
	
	// 장바구니용
	public BuyProductDTO(String pdCode, int pdPrice, int sizeCode, int pdAmount, String pdColor, String pdImage, String pdName) {
		super();
		this.pdCode = pdCode;
		this.pdPrice = pdPrice;
		this.sizeCode = sizeCode;
		this.pdAmount = pdAmount;
		this.pdColor = pdColor;
		this.pdImage = pdImage;
		this.pdName = pdName;
	}

	public int getSizeCode() {
		return sizeCode;
	}

	public void setSizeCode(int sizeCode) {
		this.sizeCode = sizeCode;
	}

	public String getPdColor() {
		return pdColor;
	}
	public void setPdColor(String pdColor) {
		this.pdColor = pdColor;
	}
	public int getColorCode() {
		return colorCode;
	}
	public void setColorCode(int colorCode) {
		this.colorCode = colorCode;
	}
	public String getPdImage() {
		return pdImage;
	}
	public void setPdImage(String pdImage) {
		this.pdImage = pdImage;
	}
	public String getPdName() {
		return pdName;
	}
	public void setPdName(String pdName) {
		this.pdName = pdName;
	}
	public String getPdCode() {
		return pdCode;
	}
	public void setPdCode(String pdCode) {
		this.pdCode = pdCode;
	}
	public int getPdPrice() {
		return pdPrice;
	}
	public void setPdPrice(int pdPrice) {
		this.pdPrice = pdPrice;
	}
	public String getPdSize() {
		return pdSize;
	}
	public void setPdSize(String pdSize) {
		this.pdSize = pdSize;
	}
	public int getPdAmount() {
		return pdAmount;
	}
	public void setPdAmount(int pdAmount) {
		this.pdAmount = pdAmount;
	}
	
	
	
}
