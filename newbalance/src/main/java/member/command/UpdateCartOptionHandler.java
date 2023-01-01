package member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.domain.UserDTO;
import member.service.CartService;
import mvc.command.CommandHandler;
import net.sf.json.JSONObject;

public class UpdateCartOptionHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		JSONObject resultJSON = new JSONObject();
		
		int cartNum = Integer.parseInt(request.getParameter("cartNum"));
		String pdCode = request.getParameter("pdCode");
		int sizeCode = Integer.parseInt(request.getParameter("pdSizeCode"));
		String color = request.getParameter("pdColor");
		String userCode = null; 
		int result = 0;
		HttpSession session = request.getSession(false);
		if (session != null) {
			UserDTO member = (UserDTO) session.getAttribute("member");
			userCode = member.getUserCode();
			CartService cartService = CartService.getInstance();
			result = cartService.updateCartOption(userCode, cartNum, pdCode, sizeCode, color);
		}
		
		if(result == 1) {
			resultJSON.put("result", "00");			
		} else if(result == 2){ //동일 옵션이 장바구니에 존재하는 경우
			resultJSON.put("result", "22");		
		} else {
			resultJSON.put("result", "99");		
		}

		return resultJSON.toString();
	}

}
