package member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.domain.UserDTO;
import member.service.CartService;
import mvc.command.CommandHandler;
import net.sf.json.JSONObject;

public class UpdateCartQtyHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		JSONObject resultJSON = new JSONObject();
		
		int cartNum = Integer.parseInt(request.getParameter("cartNum"));
		int cartCount = Integer.parseInt(request.getParameter("qty"));
		CartService cartService = CartService.getInstance();
		HttpSession session = request.getSession(false);
		int rowCount = 0;
		
		if (session != null) {
			UserDTO member = (UserDTO) session.getAttribute("member");
			if (member != null) {
				rowCount = cartService.updateCartQty(member.getUserCode(), cartNum, cartCount);
			}
		}
		if(rowCount >= 1) {
			resultJSON.put("result", "00");			
		} else {
			resultJSON.put("result", "99");		
		}

		return resultJSON.toString();
	}
	
}
