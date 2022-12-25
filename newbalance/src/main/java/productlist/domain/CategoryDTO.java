package productlist.domain;

public class CategoryDTO {
	
	private String category_code;
	private String minor_sort;
	
	
	
	public CategoryDTO(String category_code, String minor_sort) {
		super();
		this.category_code = category_code;
		this.minor_sort = minor_sort;
	}
	
	public String getCategory_code() {
		return category_code;
	}
	public void setCategory_code(String category_code) {
		this.category_code = category_code;
	}
	public String getMinor_sort() {
		return minor_sort;
	}
	public void setMinor_sort(String minor_sort) {
		this.minor_sort = minor_sort;
	}


	

	
	
}
