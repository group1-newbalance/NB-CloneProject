package product.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.domain.UserDTO;
import mvc.command.CommandHandler;
import my.service.MyPageService;
import net.sf.json.JSONObject;
import product.domain.WishlistDTO;

public class WishListHandler implements CommandHandler {


	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		JSONObject resultJSON = new JSONObject();
		try {
			String[] wishCodeList = request.getParameterValues("wishCodeList[]");
			HttpSession session = request.getSession(false);
			UserDTO member = (UserDTO) session.getAttribute("member");
			String userCode = member.getUserCode();

			WishlistDTO dto = new WishlistDTO(wishCodeList, userCode); 

			MyPageService myPageService = MyPageService.getInstance(); 
			int rowCount = myPageService.addWishlist(dto);

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
