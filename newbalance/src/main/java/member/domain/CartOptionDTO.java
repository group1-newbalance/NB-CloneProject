package member.domain;

import java.util.List;

public class CartOptionDTO {
	private String color;
	private String colorUrl;
	private List<CartProductDTO> options;
	
	public CartOptionDTO(String color, String colorUrl, List<CartProductDTO> options) {
		super();
		this.color = color;
		this.colorUrl = colorUrl;
		this.options = options;
	}
	
	public String getColor() {
		return color;
	}
	public String getColorUrl() {
		return colorUrl;
	}
	public List<CartProductDTO> getOptions() {
		return options;
	}

	
}
