package productlist.domain;

public class ProductListDTO {
	
	private String pd_code;
	private String color;
	private String category_code;
	private String pd_name;
	private int pd_price;
	private int pd_memberonly;
	private int pd_mincount;
	private String pd_feet;
	
	
	
	
	
	public ProductListDTO(String pd_code, String color, String category_code, String pd_name, int pd_price,
			int pd_memberonly, int pd_mincount, String pd_feet) {
		super();
		this.pd_code = pd_code;
		this.color = color;
		this.category_code = category_code;
		this.pd_name = pd_name;
		this.pd_price = pd_price;
		this.pd_memberonly = pd_memberonly;
		this.pd_mincount = pd_mincount;
		this.pd_feet = pd_feet;
	}

	public String getPd_code() {
		return pd_code;
	}
	public void setPd_code(String pd_code) {
		this.pd_code = pd_code;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getCategory_code() {
		return category_code;
	}
	public void setCategory_code(String category_code) {
		this.category_code = category_code;
	}
	public String getPd_name() {
		return pd_name;
	}
	public void setPd_name(String pd_name) {
		this.pd_name = pd_name;
	}
	public int getPd_price() {
		return pd_price;
	}
	public void setPd_price(int pd_price) {
		this.pd_price = pd_price;
	}
	public int getPd_memberonly() {
		return pd_memberonly;
	}
	public void setPd_memberonly(int pd_memberonly) {
		this.pd_memberonly = pd_memberonly;
	}
	public int getPd_mincount() {
		return pd_mincount;
	}
	public void setPd_mincount(int pd_mincount) {
		this.pd_mincount = pd_mincount;
	}
	public String getPd_feet() {
		return pd_feet;
	}
	public void setPd_feet(String pd_feet) {
		this.pd_feet = pd_feet;
	}

	
	
	
	
}
