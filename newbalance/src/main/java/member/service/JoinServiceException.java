package member.service;

public class JoinServiceException extends RuntimeException{

	public JoinServiceException(String mem) {
		super(mem);
	}
	
	public JoinServiceException(String mem, Exception e) {
		super(mem, e);
	}
}