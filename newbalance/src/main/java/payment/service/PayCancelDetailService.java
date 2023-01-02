package payment.service;

public class PayCancelDetailService {
private static PayCancelDetailService instance = null;
	
	private PayCancelDetailService() {}
	
	public static PayCancelDetailService getInstance() {
		if(instance == null) {
			instance = new PayCancelDetailService();
		}
		return instance;
	}// 싱글톤
	
	//public PayCancelDetailService getPayCancelDetail(String userCode)throws NamingException{
		
		
	
}
