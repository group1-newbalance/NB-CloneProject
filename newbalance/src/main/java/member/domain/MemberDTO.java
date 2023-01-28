package member.domain;

public class MemberDTO {
	private String userCode;
	private String userId;
	private String userPwd;
	private int userGender;
	private String userSkt;
	private String userPhone;
	private String userName;
	private String userBirth;
	private int userNativecheck;
	private String userTel;
	private int userReceiveinfo;
	private String userSpecialdate;
	private String userEmail;
	private int userZipcode;
	private String userInsertdate;
	private int userState ;
	private int userMileage;
	private String userFriendcode;
	private String userLastlogin;
	private String userAddress1;
	private String userAddress2;
	private String lv;
	
	
	
	
	@Override
	public String toString() {
		return "MemberDTO [userCode=" + userCode + ", userId=" + userId + ", userPwd=" + userPwd + ", userGender="
				+ userGender + ", userSkt=" + userSkt + ", userPhone=" + userPhone + ", userName=" + userName
				+ ", userBirth=" + userBirth + ", userNativecheck=" + userNativecheck + ", userTel=" + userTel
				+ ", userReceiveinfo=" + userReceiveinfo + ", userSpecialdate=" + userSpecialdate + ", userEmail="
				+ userEmail + ", userZipcode=" + userZipcode + ", userInsertdate=" + userInsertdate + ", userState="
				+ userState + ", userMileage=" + userMileage + ", userFriendcode=" + userFriendcode + ", userLastlogin="
				+ userLastlogin + ", userAddress1=" + userAddress1 + ", userAddress2=" + userAddress2 + ", lv=" + lv
				+ "]";
	}

	
	public MemberDTO() {
			super();
		    }
	public MemberDTO(String userCode, String userId, String userPwd, int userGender, String userSkt, String userPhone,
			String userName, String userBirth, int userNativecheck, String userTel, int userReceiveinfo,
			String userSpecialdate, String userEmail, int userZipcode, String userInsertdate, int userState,
			int userMileage, String userFriendcode, String userLastlogin, String userAddress1, String userAddress2, String lv) {
		this.userCode = userCode;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userGender = userGender;
		this.userSkt = userSkt;
		this.userPhone = userPhone;
		this.userName = userName;
		this.userBirth = userBirth;
		this.userNativecheck = userNativecheck;
		this.userTel = userTel;
		this.userReceiveinfo = userReceiveinfo;
		this.userSpecialdate = userSpecialdate;
		this.userEmail = userEmail;
		this.userZipcode = userZipcode;
		this.userInsertdate = userInsertdate;
		this.userState = userState;
		this.userMileage = userMileage;
		this.userFriendcode = userFriendcode;
		this.userLastlogin = userLastlogin;
		this.userAddress1 = userAddress1;
		this.userAddress2 = userAddress2;
		this.lv = lv;
	}
	public MemberDTO(String userCode, String tel, int zipcode, String address1, String address2, String email,
			String specialdate, int receiveinfo) {
		this.userCode = userCode;
		
		this.userTel =  tel;
		this.userZipcode = zipcode;
		this.userAddress1 = address1;
		this.userAddress2 = address2;
		this.userEmail = email;
		this.userSpecialdate = specialdate;
		this.userReceiveinfo = receiveinfo;
	}
	
	


	public MemberDTO(String userCode, String userId, String userPwd, int userGender, String userPhone, String userName,
			String userBirth, String userEmail, int userZipcode, int userMileage, String userAddress1,
			String userAddress2, String lv) {
		super();
		this.userCode = userCode;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userGender = userGender;
		this.userPhone = userPhone;
		this.userName = userName;
		this.userBirth = userBirth;
		this.userEmail = userEmail;
		this.userZipcode = userZipcode;
		this.userMileage = userMileage;
		this.userAddress1 = userAddress1;
		this.userAddress2 = userAddress2;
		this.lv = lv;
	}


	public MemberDTO(String userCode) {
		this.userCode = userCode;
		
	}



	

	public boolean matchPassword(String userPwd) {
		return this.userPwd.equals(userPwd);
	}

	public String getUserCode() {
		return userCode;
	}

	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public int getUserGender() {
		return userGender;
	}

	public void setUserGender(int userGender) {
		this.userGender = userGender;
	}

	public String getUserSkt() {
		return userSkt;
	}

	public void setUserSkt(String userSkt) {
		this.userSkt = userSkt;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserBirth() {
		return userBirth;
	}

	public void setUserBirth(String userBirth) {
		this.userBirth = userBirth;
	}

	public int getUserNativecheck() {
		return userNativecheck;
	}

	public void setUserNativecheck(int userNativecheck) {
		this.userNativecheck = userNativecheck;
	}

	public String getUserTel() {
		return userTel;
	}

	public void setUserTel(String userTel) {
		this.userTel = userTel;
	}

	public int getUserReceiveinfo() {
		return userReceiveinfo;
	}

	public void setUserReceiveinfo(int userReceiveinfo) {
		this.userReceiveinfo = userReceiveinfo;
	}

	public String getUserSpecialdate() {
		return userSpecialdate;
	}

	public void setUserSpecialdate(String userSpecialdate) {
		this.userSpecialdate = userSpecialdate;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public int getUserZipcode() {
		return userZipcode;
	}

	public void setUserZipcode(int userZipcode) {
		this.userZipcode = userZipcode;
	}

	public String getUserInsertdate() {
		return userInsertdate;
	}

	public void setUserInsertdate(String userInsertdate) {
		this.userInsertdate = userInsertdate;
	}

	public int getUserState() {
		return userState;
	}

	public void setUserState(int userState) {
		this.userState = userState;
	}

	public int getUserMileage() {
		return userMileage;
	}

	public void setUserMileage(int userMileage) {
		this.userMileage = userMileage;
	}

	public String getUserFriendcode() {
		return userFriendcode;
	}

	public void setUserFriendcode(String userFriendcode) {
		this.userFriendcode = userFriendcode;
	}

	public String getUserLastlogin() {
		return userLastlogin;
	}

	public void setUserLastlogin(String userLastlogin) {
		this.userLastlogin = userLastlogin;
	}

	public String getUserAddress1() {
		return userAddress1;
	}

	public void setUserAddress1(String userAddress1) {
		this.userAddress1 = userAddress1;
	}
	public String getUserAddress2() {
		return userAddress2;
	}

	public void setUserAddress2(String userAddress2) {
		this.userAddress2 = userAddress2;
	}

	public String getLv() {
		return lv;
	}

	public void setLv(String lv) {
		this.lv = lv;
	}



}
