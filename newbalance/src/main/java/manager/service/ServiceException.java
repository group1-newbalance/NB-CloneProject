package manager.service;

public class ServiceException extends Exception {

	 private static final long serialVersionUID = -2408539214300123218L;

	   public ServiceException( String member ) {
	      super(member );
	   }
	   
	   public ServiceException( String member  , Exception e ) {
	      super(member , e);
	   }

}
