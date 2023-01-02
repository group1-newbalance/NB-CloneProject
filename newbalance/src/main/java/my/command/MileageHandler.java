package my.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.domain.UserDTO;
import mvc.command.CommandHandler;
import my.domain.MileageDTO;
import my.service.MyPageService;

public class MileageHandler implements CommandHandler{
	
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
		      
		      MileageDTO miDto = null;
		      int userMile = 0;
		      try {
				userMile = mypageService.getMileage(userCode);
				request.setAttribute("userMile", userMile);
				
			} catch (NamingException e) {
				e.printStackTrace();
			}
			 return "/my/mileage.jsp";
			 

	   }

	   public String processPOST(HttpServletRequest request, HttpServletResponse response) {
	   
	      HttpSession session = request.getSession();
	      UserDTO member = (UserDTO) session.getAttribute("member");
	      String userCode = member.getUserCode();
	      
	      String sDate = request.getParameter("sDate");
	      String eDate = request.getParameter("eDate");
	       
	      MyPageService mypageService = MyPageService.getInstance();
	      
	      String location = "/my/mileage.jsp";
	      ArrayList<MileageDTO> miList = null;
	      int userMile = 0;
	      try {
	    	miList = mypageService.selectMileageByDate(userCode, sDate, eDate);
			userMile = mypageService.getMileage(userCode);
			request.setAttribute("miList", miList);
			request.setAttribute("userMile", userMile);
			
		} catch (NamingException e) {
			e.printStackTrace();
		}
	      
	      return location;
	   }
	

}
