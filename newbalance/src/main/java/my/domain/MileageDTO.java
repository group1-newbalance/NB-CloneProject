package my.domain;

public class MileageDTO {
	
	private int userMile;
	private int usedMile;
	private int mileCode;
	private int mileAmount;
	private String mileDate;
	private String mileContent;



	public MileageDTO() {
		super();
	}


	public MileageDTO(int userMile) {
		this.userMile = userMile;
	}


	public MileageDTO(int userMile, int usedMile, int mileCode, int mileAmount, String mileDate) {
		this.userMile = userMile;
		this.usedMile = usedMile;
		this.mileCode = mileCode;
		this.mileAmount = mileAmount;
		this.mileDate = mileDate;
	}


	public String getMileContent() {
		return mileContent;
	}


	public void setMileContent(String mileContent) {
		this.mileContent = mileContent;
	}
	
	public int getUserMile() {
		return userMile;
	}


	public void setUserMile(int userMile) {
		this.userMile = userMile;
	}


	public int getUsedMile() {
		return usedMile;
	}


	public void setUsedMile(int usedMile) {
		this.usedMile = usedMile;
	}


	public int getMileCode() {
		return mileCode;
	}


	public void setMileCode(int mileCode) {
		this.mileCode = mileCode;
	}


	public int getMileAmount() {
		return mileAmount;
	}


	public void setMileAmount(int mileAmount) {
		this.mileAmount = mileAmount;
	}


	public String getMileDate() {
		return mileDate;
	}


	public void setMileDate(String mileDate) {
		this.mileDate = mileDate;
	}


	@Override
	public String toString() {
		return "MileageDTO [userMile=" + userMile + ", usedMile=" + usedMile + ", mileCode=" + mileCode
				+ ", mileAmount=" + mileAmount + ", mileDate=" + mileDate + "]";
	}
	
	

}

