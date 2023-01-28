package my.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.domain.MemberDTO;
import member.domain.UserDTO;
import member.service.JoinService;
import mvc.command.CommandHandler;

public class JoinDeleteHandler implements CommandHandler{
	private static final String FORM_VIEW ="/my/memberOutProc.jsp";
	
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

	
	private String processSubmit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 회원코드 받기
		JoinService joinService = JoinService.getInstance();
		HttpSession session = request.getSession(false);
		
		int rowCount = 0;
		if (session != null) {
			UserDTO member = (UserDTO) session.getAttribute("member");
			if (member != null) {
				
				try {
				
				//MemberDTO dto = new MemberDTO(member.getUserCode());
				
				rowCount = joinService.delete(member.getUserCode());
				System.out.println("handler 찍혀ㅑ ? ");
				} catch (Exception e) {
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
