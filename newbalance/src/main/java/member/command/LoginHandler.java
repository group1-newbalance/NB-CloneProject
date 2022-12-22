package member.command;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.service.LoginFailException;
import member.service.LoginService;
import member.service.User;
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
			LoginService loginService = LoginService.getInstance();
			User user = loginService.login(id, password);
			System.out.println(user.toString());
			request.getSession().setAttribute("member", user);
			response.sendRedirect(request.getContextPath() + "/index.jsp");
			return null;
		} catch( LoginFailException e) {
			errors.put("idOrPwNotMatch", Boolean.TRUE);
			return FORM_VIEW;
		}
	}
	private String trim(String str) {
		return str == null? null : str.trim();
	}
	
}
