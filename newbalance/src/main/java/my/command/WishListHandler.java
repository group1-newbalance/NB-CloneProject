package my.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.domain.UserDTO;
import mvc.command.CommandHandler;
import my.domain.MyWishDTO;
import my.service.MyPageService;

public class WishListHandler  implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println(">WishListHandler.process() 호출됨..");
		
		MyPageService myPageService = MyPageService.getInstance();
	      HttpSession session = request.getSession(false);
	      List<MyWishDTO> mywishdto = null;
	      if (session != null) {
	         UserDTO member = (UserDTO) session.getAttribute("member");
	         if (member != null) {

	            mywishdto = myPageService.getMemberWishList(member.getUserCode());
	         }
	      }
	      
	      request.setAttribute("wishData", mywishdto);
		
		return "/my/orderWishList.jsp";
	}

}
