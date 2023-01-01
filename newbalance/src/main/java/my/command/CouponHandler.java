package my.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.domain.UserDTO;
import mvc.command.CommandHandler;
import my.domain.CouponDTO;
import my.service.MyPageService;

public class CouponHandler implements CommandHandler{
	
	@Override
	   public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
	      if(request.getMethod().equalsIgnoreCase("GET")) {
	         return processGet(request, response);
	      } else if (request.getMethod().equalsIgnoreCase("POST")) {
	         return processPOST(request, response);
	      }
	      return null;
	   }

	   public String processGet(HttpServletRequest request, HttpServletResponse response) {
	      
		   	HttpSession session = request.getSession();
		      UserDTO member = (UserDTO) session.getAttribute("member");
		      String userCode = member.getUserCode();
		       
		      MyPageService mypageService = MyPageService.getInstance();
		      
		      ArrayList<CouponDTO> cpList = null;
		      try {
				cpList = mypageService.getCoupon(userCode);
				request.setAttribute("cpList", cpList);
				request.setAttribute("userCode", userCode);
			} catch (NamingException e) {
				e.printStackTrace();
			}
			 return "/my/coupon.jsp";
			 

	   }

	   public String processPOST(HttpServletRequest request, HttpServletResponse response) {
	   
	      HttpSession session = request.getSession();
	      UserDTO member = (UserDTO) session.getAttribute("member");
	      String userCode = member.getUserCode();
	      
	      String sDate = request.getParameter("sDate");
	      String eDate = request.getParameter("eDate");
	       
	      MyPageService mypageService = MyPageService.getInstance();
	      
	      String location = "/my/coupon.jsp";
	      ArrayList<CouponDTO> cpList = null;
	      try {
	    	cpList = mypageService.selectCouponByDate(userCode, sDate, eDate);
			request.setAttribute("cpList", cpList);
			
		} catch (NamingException e) {
			e.printStackTrace();
		}
	      
	      return location;
	   }
	

}
