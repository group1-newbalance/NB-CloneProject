package my.command;

import java.io.IOException;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.domain.UserDTO;
import mvc.command.CommandHandler;
import my.service.MyPageService;

public class PMemberDeliveryDeleteHandler implements CommandHandler{
	private static final String FORM_VIEW ="/my/confirmMemberDeliveryInfo.jsp";
	
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
		// 회원코드 받기
		int maSeq = Integer.parseInt(request.getParameter("addrIdx"));
		MyPageService myPageService = MyPageService.getInstance();
		HttpSession session = request.getSession(false);
		
		int rowCount = 0;
		if (session != null) {
			UserDTO member = (UserDTO) session.getAttribute("member");
			if (member != null) {
				try {
					rowCount = myPageService.deleteMemberDeliveryInfo(maSeq);
				} catch (NamingException e) {
					e.printStackTrace();
				}
			}
		}

		request.setAttribute("process", "delete");
		if (rowCount == 1) {
			request.setAttribute("result", "success");
		} else {
			request.setAttribute("result", "fail"); 
		}
		return FORM_VIEW;	
	}
}
