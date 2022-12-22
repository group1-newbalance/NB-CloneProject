package member.service;

public class User {
	private String id;
	private String pwd;
	
	
	
	public User(String id) {
		this.id = id;
	}

	public User(String id, String pwd) {
		this.id = id;
		this.pwd = pwd;
	}

	public String getId() {
		return id;
	}

	public String getPwd() {
		return pwd;
	}
	
	public boolean matchPassword(String pwd) {
		return this.pwd.equals(pwd);
		
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", pwd=" + pwd + "]";
	}
	
	
}
