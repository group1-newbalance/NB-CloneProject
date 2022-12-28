package my.command;

import java.io.IOException;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.domain.UserDTO;
import mvc.command.CommandHandler;
import my.domain.MyDeliveryInfoDTO;
import my.service.MyPageService;

public class MemberDeliveryInsertHandler implements CommandHandler{
	private static final String FORM_VIEW ="/my/insertMemberDeliveryInfo.jsp";
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		if(request.getMethod().equalsIgnoreCase("POST")) {
			return processSubmit(request, response);
		}
		else {
			response.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
			return null;
		}
	}
	
	
	private String processSubmit(HttpServletRequest request, HttpServletResponse response) throws IOException {

		return FORM_VIEW;	
	}
}
