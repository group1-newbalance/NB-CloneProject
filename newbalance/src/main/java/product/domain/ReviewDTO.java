package product.domain;

public class ReviewDTO {

	private int revSeq;
	private String userCode;
	private String ordCode;
	private String size;  // sz
	private String color;
	private String revDate;
	private String revContent;
	private int revGood;
	private int revBad;
	private int bottomSize;
	private double revStarScore;
	private String revFeet;
	private int revHeight;
	private int revWeight;
	private int topSize;
	private int count;
	private double avg;
	
	
	public ReviewDTO(int count, double avg) {
		this.count = count;
		this.avg = avg;
	}


	public ReviewDTO(int revSeq, String userCode, String ordCode, String size, String color, String revDate,
			String revContent, int revGood, int revBad, double revStarScore) {
		super();
		this.revSeq = revSeq;
		this.userCode = userCode;
		this.ordCode = ordCode;
		this.size = size;
		this.color = color;
		this.revDate = revDate;
		this.revContent = revContent;
		this.revGood = revGood;
		this.revBad = revBad;
		this.revStarScore = revStarScore;
	}
	
	
	public int getRevSeq() {
		return revSeq;
	}
	public String getUserCode() {
		return userCode;
	}
	public String getOrdCode() {
		return ordCode;
	}
	public String getSize() {
		return size;
	}
	public String getColor() {
		return color;
	}
	public String getRevDate() {
		return revDate;
	}
	public String getRevContent() {
		return revContent;
	}
	public int getRevGood() {
		return revGood;
	}
	public int getRevBad() {
		return revBad;
	}
	public int getBottomSize() {
		return bottomSize;
	}
	public double getRevStarScore() {
		return revStarScore;
	}
	public String getRevFeet() {
		return revFeet;
	}
	public int getRevHeight() {
		return revHeight;
	}
	public int getRevWeight() {
		return revWeight;
	}
	public int getTopSize() {
		return topSize;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public double getAvg() {
		return avg;
	}
	public void setAvg(double avg) {
		this.avg = avg;
	}

	
}
