package my.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.domain.UserDTO;
import mvc.command.CommandHandler;
import my.domain.MywishDTO;
import my.service.MyPageService;

public class WishListHandler  implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println(">WishListHandler.process() 호출됨..");
		
		MyPageService myPageService = MyPageService.getInstance();
	      HttpSession session = request.getSession(false);
	      List<MywishDTO> mywishdto = null;
	      if (session != null) {
	         System.out.println("myMain session [not null]");
	         UserDTO member = (UserDTO) session.getAttribute("member");
	         if (member != null) {
	            System.out.println("myMain member [not null]");
	            mywishdto = myPageService.getMyWish(member.getUserCode());
	         }
	      }

	      if(mywishdto == null) {
	         response.setStatus(HttpServletResponse. SC_NOT_FOUND);
	         return null;
	      }
	      
	      request.setAttribute("mywishdto", mywishdto);
		
		return "/my/orderWishList.jsp";
	}

}
