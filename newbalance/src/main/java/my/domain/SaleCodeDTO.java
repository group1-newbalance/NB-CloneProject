package my.domain;

public class SaleCodeDTO {
	
	private String friendCode;
	
	public SaleCodeDTO() {
		super();
	}

	public SaleCodeDTO(String friendCode) {
		this.friendCode = friendCode;
	}

	public String getFriendCode() {
		return friendCode;
	}

	public void setFriendCode(String friendCode) {
		this.friendCode = friendCode;
	}

	@Override
	public String toString() {
		return "SaleCodeDTO [friendCode=" + friendCode + "]";
	}
	
	
	
	
	
}
