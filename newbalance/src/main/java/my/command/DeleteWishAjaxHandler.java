package my.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.domain.UserDTO;
import mvc.command.CommandHandler;
import my.service.MyPageService;
import net.sf.json.JSONObject;

public class DeleteWishAjaxHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("> deleteWIsh.action 요청 : DeleteWishAjaxHandler.process() 호출됨...");
	      
		  JSONObject resultJSON = new JSONObject();
	      try {
	         String[] delWishList = request.getParameterValues("delList[]");
	         HttpSession session = request.getSession(false);
	         UserDTO member = (UserDTO) session.getAttribute("member");
	         String userCode = member.getUserCode();

	         MyPageService wishService = MyPageService.getInstance(); 
	         // int rowCount = wishService.deleteWishProduct(userCode, delWishList);
	         int wishCount = wishService.getWishCount(userCode);
	         request.getSession().setAttribute("wishCount", wishCount);

	         if (rowCount >= 1) {
	            resultJSON.put("result", "00");
	         }else {
	            resultJSON.put("result", "99");
	         }
	         System.out.println(resultJSON.toString());


	      } catch (Exception e) {
	         request.setAttribute("rowCount", 99) ; 
	      }

	      return resultJSON.toString();
	   }


}
