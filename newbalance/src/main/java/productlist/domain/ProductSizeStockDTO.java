package productlist.domain;

public class ProductSizeStockDTO {

	private String pd_code;
	private int size_code;
	private int stock_count;
	private String sz;


	public ProductSizeStockDTO(String pd_code, int size_code, int stock_count, String sz) {
		super();
		this.pd_code = pd_code;
		this.size_code = size_code;
		this.stock_count = stock_count;
		this.sz = sz;
	}
	
	
	public String getPd_code() {
		return pd_code;
	}
	public void setPd_code(String pd_code) {
		this.pd_code = pd_code;
	}
	public int getSize_code() {
		return size_code;
	}
	public void setSize_code(int size_code) {
		this.size_code = size_code;
	}
	public int getStock_count() {
		return stock_count;
	}
	public void setStock_count(int stock_count) {
		this.stock_count = stock_count;
	}
	public String getSz() {
		return sz;
	}
	public void setSz(String sz) {
		this.sz = sz;
	}
	
	
	
	
	
}
