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
	private String userAddress;
	private String lv;
	
	
	public MemberDTO(String userCode, String userId, String userPwd, int userGender, String userSkt, String userPhone,
			String userName, String userBirth, int userNativecheck, String userTel, int userReceiveinfo,
			String userSpecialdate, String userEmail, int userZipcode, String userInsertdate, int userState,
			int userMileage, String userFriendcode, String userLastlogin, String userAddress, String lv) {
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
		this.userAddress = userAddress;
		this.lv = lv;
	}

	public boolean matchPassword(String userPwd) {
		return this.userPwd.equals(userPwd);
	}

	public String getUserCode() {
		return userCode;
	}

	public String getUserId() {
		return userId;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public int getUserGender() {
		return userGender;
	}

	public String getUserSkt() {
		return userSkt;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public String getUserName() {
		return userName;
	}

	public String getUserBirth() {
		return userBirth;
	}

	public int getUserNativecheck() {
		return userNativecheck;
	}

	public String getUserTel() {
		return userTel;
	}

	public int getUserReceiveinfo() {
		return userReceiveinfo;
	}

	public String getUserSpecialdate() {
		return userSpecialdate;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public int getUserZipcode() {
		return userZipcode;
	}

	public String getUserInsertdate() {
		return userInsertdate;
	}

	public int getUserState() {
		return userState;
	}

	public int getUserMileage() {
		return userMileage;
	}

	public String getUserFriendcode() {
		return userFriendcode;
	}

	public String getUserLastlogin() {
		return userLastlogin;
	}

	public String getUserAddress() {
		return userAddress;
	}

	public String getLv() {
		return lv;
	}
	
}
