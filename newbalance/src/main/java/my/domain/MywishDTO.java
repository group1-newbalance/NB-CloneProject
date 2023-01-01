package my.domain;

public class MywishDTO {
	
private int wishCode; // 관심상품SEQ
private String pdCode; // 상품코드
private String userCode; // 회원코드
private String wishInsertdate; // 관심상품 등록일
private String wishExpiredate; // 관심상품 만료일(+30일)
private String pdName; // 상품명
private int pdPrice; // 상품가격
private String imgUrl; // 이미지url

private MywishDTO() {

}

public MywishDTO(int wishCode, String pdCode, String userCode, String wishInsertdate, String wishExpiredate,
		String pdName, int pdPrice, String imgUrl) {
	super();
	this.wishCode = wishCode;
	this.pdCode = pdCode;
	this.userCode = userCode;
	this.wishInsertdate = wishInsertdate;
	this.wishExpiredate = wishExpiredate;
	this.pdName = pdName;
	this.pdPrice = pdPrice;
	this.imgUrl = imgUrl;
}

public int getWishCode() {
	return wishCode;
}
public String getPdCode() {
	return pdCode;
}
public String getUserCode() {
	return userCode;
}
public String getWishInsertdate() {
	return wishInsertdate;
}
public String getWishExpiredate() {
	return wishExpiredate;
}
public String getPdName() {
	return pdName;
}
public int getPdPrice() {
	return pdPrice;
}
public String getImgUrl() {
	return imgUrl;
}




}
