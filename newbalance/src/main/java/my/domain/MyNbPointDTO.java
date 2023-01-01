package my.domain;

public class MyNbPointDTO {
	
	private String mynbDetails;
	private int mynbPoint;
	private String mynbDate;
	private String userLevel;
	private int userPoint;

	

	public MyNbPointDTO(String mynbDetails, int mynbPoint, String mynbDate, String userLevel, int userPoint) {
		super();
		this.mynbDetails = mynbDetails;
		this.mynbPoint = mynbPoint;
		this.mynbDate = mynbDate;
		this.userLevel = userLevel;
		this.userPoint = userPoint;

	}

	public MyNbPointDTO(String userLevel, int userPoint) {
		this.userLevel = userLevel;
		this.userPoint = userPoint;
	}

	public MyNbPointDTO() {
		// TODO Auto-generated constructor stub
	}

	public String getMynbDetails() {
		return mynbDetails;
	}

	public void setMynbDetails(String mynbDetails) {
		this.mynbDetails = mynbDetails;
	}

	public int getMynbPoint() {
		return mynbPoint;
	}

	public void setMynbPoint(int mynbPoint) {
		this.mynbPoint = mynbPoint;
	}

	public String getMynbDate() {
		return mynbDate;
	}

	public void setMynbDate(String mynbDate) {
		this.mynbDate = mynbDate;
	}

	public String getUserLevel() {
		return userLevel;
	}

	public void setUserLevel(String userLevel) {
		this.userLevel = userLevel;
	}

	public int getUserPoint() {
		return userPoint;
	}

	public void setUserPoint(int userPoint) {
		this.userPoint = userPoint;
	}

	@Override
	public String toString() {
		return "MyNbPoint [mynbDetails=" + mynbDetails + ", mynbPoint=" + mynbPoint + ", mynbDate=" + mynbDate
				+ ", userLevel=" + userLevel + ", userPoint=" + userPoint + "]";
	}

}

