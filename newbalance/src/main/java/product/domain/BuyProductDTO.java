package product.domain;

public class BuyProductDTO {

	private String pdCode;
	private int pdPrice;
	private String pdSize;
	private int pdAmount;
	
	public BuyProductDTO(String pdCode, int pdPrice, String pdSize, int pdAmount) {
		super();
		this.pdCode = pdCode;
		this.pdPrice = pdPrice;
		this.pdSize = pdSize;
		this.pdAmount = pdAmount;
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
