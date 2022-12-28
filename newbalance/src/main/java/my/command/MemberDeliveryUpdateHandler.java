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

public class MemberDeliveryUpdateHandler implements CommandHandler{
	private static final String FORM_VIEW ="/my/updateMemberDeliveryInfo.jsp";
	
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
		
		//회원코드 받기
		HttpSession session = request.getSession(false);
		
		if (session != null) {
			UserDTO member = (UserDTO) session.getAttribute("member");
			if (member != null) {
				try {
					String cellNo = request.getParameter("cellNo");
					String[] cellNos = cellNo.split("-");
					System.out.println(request.getParameter("recvName"));
					request.setAttribute("cellNo01", cellNos[0]);
					request.setAttribute("cellNo02", cellNos[1]);
					request.setAttribute("cellNo03", cellNos[2]);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		
		return FORM_VIEW;	
	}
}
