package member.command;

import java.util.LinkedHashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.domain.CartOptionDTO;
import member.domain.CartProductDTO;
import member.domain.UserDTO;
import member.service.CartService;
import mvc.command.CommandHandler;
import net.sf.json.JSONObject;

public class GetCartOptionHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		JSONObject resultJSON = new JSONObject();
		
		String pdCode = request.getParameter("pdCode");
		CartService cartService = CartService.getInstance();
		HttpSession session = request.getSession(false);
		
		List<CartOptionDTO> result = null;
		
		if (session != null) {
			UserDTO member = (UserDTO) session.getAttribute("member");
			if (member != null) {
				result = cartService.getCartOption(pdCode);
			}
		}
	
		resultJSON.put("result", result);			
		

		return resultJSON.toString();
	}

}
