package my.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.domain.UserDTO;
import member.service.CartService;
import mvc.command.CommandHandler;
import my.service.MyPageService;
import net.sf.json.JSONObject;

public class DeleteWishListHandler implements CommandHandler {
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		JSONObject resultJSON = new JSONObject();
		try {
			String[] wishList = request.getParameterValues("wishList[]");
			HttpSession session = request.getSession(false);
			UserDTO member = (UserDTO) session.getAttribute("member");
			String userCode = member.getUserCode();

			MyPageService myPageService = MyPageService.getInstance(); 
			int rowCount = myPageService.deleteWishList(userCode, wishList);

			if (rowCount >= 1) {
				resultJSON.put("result", "00");
			}else {
				resultJSON.put("result", "99");
			}
			System.out.println(resultJSON.toString());


		} catch (Exception e) {
			request.setAttribute("result", 99) ; 
		}

		return resultJSON.toString();
	}
}
