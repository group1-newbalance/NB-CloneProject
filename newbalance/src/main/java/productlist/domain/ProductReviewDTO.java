package productlist.domain;

public class ProductReviewDTO {
	
	private String pdCode;
	private int countPOfReview;
	private int avgReview;
	
	
	
	@Override
	public String toString() {
		return "ProductReviewDTO [pdCode=" + pdCode + ", countPOfReview=" + countPOfReview + ", avgReview=" + avgReview
				+ "]";
	}


	public ProductReviewDTO(String pdCode, int countPOfReview, int avgReview) {
		super();
		this.pdCode = pdCode;
		this.countPOfReview = countPOfReview;
		this.avgReview = avgReview;
	}
	
	
	public String getPdCode() {
		return pdCode;
	}
	public void setPdCode(String pdCode) {
		this.pdCode = pdCode;
	}
	public int getCountPOfReview() {
		return countPOfReview;
	}
	public void setCountPOfReview(int countPOfReview) {
		this.countPOfReview = countPOfReview;
	}
	public int getAvgReview() {
		return avgReview;
	}
	public void setAvgReview(int avgReview) {
		this.avgReview = avgReview;
	}
	
	
	
}
