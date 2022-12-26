package member.command;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.domain.UserDTO;
import member.service.CartService;
import member.service.LoginFailException;
import member.service.LoginService;
import member.service.UpdateLastLoginDateException;
import mvc.command.CommandHandler;

public class LoginHandler implements CommandHandler{

	private static final String FORM_VIEW = "/customer/loginForm.jsp";
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(request.getMethod().equalsIgnoreCase("GET")) {
			return processForm(request, response);
		} else if (request.getMethod().equalsIgnoreCase("POST")) {
			return processSubmit(request, response);
		} else {
			response.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
			return null;
		}
	}
	
	private String processForm(HttpServletRequest request, HttpServletResponse response) {
		return FORM_VIEW;
	}
	
	private String processSubmit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = trim(request.getParameter("id"));
		String password = trim(request.getParameter("password"));
		
		Map<String, Boolean> errors = new HashMap<>();
		request.setAttribute("errors", errors);
		
		if ( id == null || id.isEmpty() )
			errors.put("id", Boolean.TRUE);
		if ( password == null || password.isEmpty() )
			errors.put("password", Boolean.TRUE);
		
		if (!errors.isEmpty() ) {
			return FORM_VIEW;
		}
		
		try {
			CartService cartService = CartService.getInstance();
			LoginService loginService = LoginService.getInstance();
			UserDTO user = loginService.login(id, password);
			
			int cartCount = cartService.getCartCount(user.getUserCode());
			request.getSession().setAttribute("member", user);
			request.getSession().setAttribute("cartCount", cartCount);
			
			response.sendRedirect(request.getContextPath() + "/index.jsp");
			
		} catch( LoginFailException e) {
			errors.put("idOrPwNotMatch", Boolean.TRUE);
			return FORM_VIEW;
		} catch(UpdateLastLoginDateException e) {
			System.out.println("마지막 방문일 업데이트 실패");
		}
		return null;
	}
	private String trim(String str) {
		return str == null? null : str.trim();
	}
	
}
