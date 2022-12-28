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

public class PMemberDeliveryInsertHandler implements CommandHandler{
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
		MyPageService myPageService = MyPageService.getInstance();
		HttpSession session = request.getSession(false);
		
		int rowCount = 0;
		if (session != null) {
			UserDTO member = (UserDTO) session.getAttribute("member");
			if (member != null) {
				try {
					String maName = request.getParameter("recvName");
					String maZipcode  = request.getParameter("txtOrderZipCode");
					String maAddress1  = request.getParameter("txtOrderAddr1");
					String maAddress2 = request.getParameter("txtOrderAddr2");
					String phone1 = request.getParameter("cellNo01");
					String phone2 = request.getParameter("cellNo02");
					String phone3 = request.getParameter("cellNo03");
					String maPhone = String.format("%s-%s-%s", phone1, phone2, phone3);
					int maDefault = "Y".equals(request.getParameter("basicYn")) ? 1 : 0;
					
					MyDeliveryInfoDTO dto = new MyDeliveryInfoDTO(member.getUserCode(), maName, maZipcode, maAddress1, maAddress2, maPhone, maDefault);
					
					rowCount = myPageService.insertMemberDeliveryInfo(dto);
				} catch (NamingException e) {
					e.printStackTrace();
				}
			}
		}

		request.setAttribute("process", "insert");
		if (rowCount == 1) {
			request.setAttribute("result", "success");
		} else if(rowCount == -1){
			request.setAttribute("result", "duplicate");
		}else {
			request.setAttribute("result", "fail"); 
		}
		return FORM_VIEW;	
	}
}
