package product.domain;

public class ProductSizeDTO {

	private String pdCode;
	private int sizeCode;
	private int stockCount;
	private String sz;


	public ProductSizeDTO() {
		super();
	}

	public ProductSizeDTO(String pdCode, int sizeCode, int stockCount, String sz) {
		super();
		this.pdCode = pdCode;
		this.sizeCode = sizeCode;
		this.stockCount = stockCount;
		this.sz = sz;
	}
	
	
	public String getPdCode() {
		return pdCode;
	}
	public void setPdCode(String pdCode) {
		this.pdCode = pdCode;
	}
	public int getSizeCode() {
		return sizeCode;
	}
	public void setSizeCode(int sizeCode) {
		this.sizeCode = sizeCode;
	}
	public int getStockCount() {
		return stockCount;
	}
	public void setStockCount(int stockCount) {
		this.stockCount = stockCount;
	}
	public String getSz() {
		return sz;
	}
	public void setSz(String sz) {
		this.sz = sz;
	}
	
}
