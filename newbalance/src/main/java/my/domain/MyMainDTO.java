package my.domain;

public class MyMainDTO {
	private String userName;
	private String lv;
	private int couponCnt;
	private int mileageAmount;
	private int wishCnt;
	private int orderCnt;
	
	public MyMainDTO(String userName, String lv, int couponCnt, int mileageAmount, int wishCnt, int orderCnt) {
		this.userName = userName;
		this.lv = lv;
		this.couponCnt = couponCnt;
		this.mileageAmount = mileageAmount;
		this.wishCnt = wishCnt;
		this.orderCnt = orderCnt;
	}
	public String getUserName() {
		return userName;
	}
	public String getLv() {
		return lv;
	}
	public int getCouponCnt() {
		return couponCnt;
	}
	public int getMileageAmount() {
		return mileageAmount;
	}
	public int getWishCnt() {
		return wishCnt;
	}
	public int getOrderCnt() {
		return orderCnt;
	}
	@Override
	public String toString() {
		return "MyMainDTO [userName=" + userName + ", lv=" + lv + ", couponCnt=" + couponCnt + ", mileageAmount="
				+ mileageAmount + ", wishCnt=" + wishCnt + ", orderCnt=" + orderCnt + "]";
	}
	
	
}
