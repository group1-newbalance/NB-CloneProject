package member.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.domain.CartProductDTO;
import member.domain.UserDTO;
import member.service.CartService;
import mvc.command.CommandHandler;

public class GetCartListHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// 회원코드 받기
		CartService cartService = CartService.getInstance();
		HttpSession session = request.getSession(false);
		
		List<CartProductDTO> cartData = null;
		if (session != null) {
			UserDTO member = (UserDTO) session.getAttribute("member");
			if (member != null) {
				cartData = cartService.getCartList(member.getUserCode());
			}
		}
		
		request.setAttribute("cartData", cartData);
		
		return "/my/cartList.jsp";

	}

}
