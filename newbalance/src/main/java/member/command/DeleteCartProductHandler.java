package member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.domain.UserDTO;
import member.service.CartService;
import mvc.command.CommandHandler;
import net.sf.json.JSONObject;

public class DeleteCartProductHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		JSONObject resultJSON = new JSONObject();
		try {
			String[] delCartList = request.getParameterValues("delList[]");
			HttpSession session = request.getSession(false);
			UserDTO member = (UserDTO) session.getAttribute("member");
			String userCode = member.getUserCode();

			CartService cartService = CartService.getInstance(); 
			int rowCount = cartService.deleteCartProduct(userCode, delCartList);
			int cartCount = cartService.getCartCount(userCode);
			request.getSession().setAttribute("cartCount", cartCount);

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
