package my.command;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;
import my.domain.CouponDTO;
import my.service.MyPageService;

public class CouponPopupHandler implements CommandHandler{


	   public String process(HttpServletRequest request, HttpServletResponse response) {
	   
	      String userCode = request.getParameter("userCode");
	      String cpCode = request.getParameter("cpCode");
	       
	      MyPageService mypageService = MyPageService.getInstance();
	      
	      // ArrayList<CouponDTO> cpList = null;
	      CouponDTO cpDto = null;
	      try {
	    	  cpDto = mypageService.getUserCoupon(userCode, cpCode);
	    	  // cpList = mypageService.getCoupon(userCode);
			  // request.setAttribute("cpList", cpList);
			  request.setAttribute("cpDto", cpDto);
		} catch (NamingException e) {
			e.printStackTrace();
		}
	      
	      
	      String location = "/my/couponPopup.jsp";
	      
	      return location;
	   }
	

}
