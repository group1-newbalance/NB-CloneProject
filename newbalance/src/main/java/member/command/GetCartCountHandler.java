package member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.domain.MemberDTO;
import member.service.CartService;
import mvc.command.CommandHandler;
import net.sf.json.JSONObject;

public class GetCartCountHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		JSONObject resultJSON = new JSONObject();
	
		CartService cartService = CartService.getInstance();
		HttpSession session = request.getSession(false);
		
		if(session != null) {
			MemberDTO member = (MemberDTO) session.getAttribute("member");
			if(member != null) {
				int cartCount = cartService.getCartCount(member.getUserCode());
				resultJSON.put("result", "00");
				request.getSession().setAttribute("cartCount", cartCount);
			}
		}
		
	
		return resultJSON.toString();
	}
	
}
