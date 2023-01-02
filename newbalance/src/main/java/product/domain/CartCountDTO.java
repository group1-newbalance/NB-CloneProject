package product.domain;

public class CartCountDTO {

	private String sizeCode;
	private String size;
	private int count;
	
	public CartCountDTO(String sizeCode, String size, int count) {
		this.sizeCode = sizeCode;
		this.size = size;
		this.count = count;
	}
	
	public String getSizeCode() {
		return sizeCode;
	}
	public void setSizeCode(String sizeCode) {
		this.sizeCode = sizeCode;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
	
	
}
