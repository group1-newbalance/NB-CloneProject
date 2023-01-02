package my.domain;

public class MbLevelDTO {
	private String lv;
	private int currentScore;
	private int buyCount;
	private int buyAmount;
	private int userPoint;
	private int needScore;
	
	
	public MbLevelDTO() {
		super();
	}

	public MbLevelDTO(String lv, int currentScore, int buyCount, int buyAmount, int userPoint, int needScore) {
		this.lv = lv;
		this.currentScore = currentScore;
		this.buyCount = buyCount;
		this.buyAmount = buyAmount;
		this.userPoint = userPoint;
		this.needScore = needScore;
	}

	public String getLv() {
		return lv;
	}

	public void setLv(String lv) {
		this.lv = lv;
	}

	public int getCurrentScore() {
		return currentScore;
	}

	public void setCurrentScore(int currentScore) {
		this.currentScore = currentScore;
	}

	public int getBuyCount() {
		return buyCount;
	}

	public void setBuyCount(int buyCount) {
		this.buyCount = buyCount;
	}

	public int getBuyAmount() {
		return buyAmount;
	}

	public void setBuyAmount(int buyAmount) {
		this.buyAmount = buyAmount;
	}

	public int getUserPoint() {
		return userPoint;
	}

	public void setUserPoint(int userPoint) {
		this.userPoint = userPoint;
	}

	public int getNeedScore() {
		return needScore;
	}

	public void setNeedScore(int needScore) {
		this.needScore = needScore;
	}

	@Override
	public String toString() {
		return "MbLevelDTO [lv=" + lv + ", currentScore=" + currentScore + ", buyCount=" + buyCount + ", buyAmount="
				+ buyAmount + ", userPoint=" + userPoint + ", needScore=" + needScore + "]";
	}
	

}

