package member.service;

public class JoinServiceException extends RuntimeException{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public JoinServiceException(String mem) {
		super(mem);
	}
	
	public JoinServiceException(String mem, Exception e) {
		super(mem, e);
	}
}