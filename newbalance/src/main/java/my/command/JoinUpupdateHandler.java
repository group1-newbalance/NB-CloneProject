package my.command;

import java.io.IOException;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.domain.MemberDTO;
import member.domain.UserDTO;
import member.service.JoinService;
import mvc.command.CommandHandler;



public class JoinUpupdateHandler implements CommandHandler {
	private static final String FORM_VIEW ="/newbalance/my/memberModifyProc.jsp";
	
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
	
	
	private String processSubmit(HttpServletRequest req, HttpServletResponse response) throws IOException {
		JoinService joinService = JoinService.getInstance();
		HttpSession session = req.getSession(false);
		
		int rowCount = 0;
		if (session != null) {
			UserDTO member = (UserDTO) session.getAttribute("member");
			if (member != null) {
				try {
									
					String tel1 =  req.getParameter("phoneNum1");
					String tel2 =  req.getParameter("phoneNum2");
					String tel3 =  req.getParameter("phoneNum3");
					String tel = tel1 + "-" + tel2 + "-" + tel3;
					int zipcode = Integer.parseInt(req.getParameter("zipcode"));
					String address1 = req.getParameter("add1");
					String address2 = req.getParameter("add2");
					
					String email1 = req.getParameter("txtOrderEmail1");
					String email2 = req.getParameter("txtOrderEmail2");
					String email = email1 + "@" + email2;
					
					String specialdate1 = req.getParameter("specialYear");
					String specialdate2 = req.getParameter("specialMonth");
					String specialdate3 = req.getParameter("specialDate");
					String specialdate = specialdate1 + "/" +specialdate2 + "/" + specialdate3;
					specialdate = req.getParameter("specialdate") == null ? "" :req.getParameter("specialdate");
					int receiveinfo = req.getParameter("receiveinfo") ==null ? -1:Integer.parseInt(req.getParameter("receiveinfo"));
					
					MemberDTO dto = new MemberDTO(member.getUserCode(),tel,zipcode,address1,address2,email, specialdate,receiveinfo);
					
					rowCount = joinService.update(dto);
					
					
					System.out.println("handler : "+member.toString());
				} catch (NamingException e) {
					e.printStackTrace();
				}
			}
		}
		
		req.setAttribute("process", "update");
		if (rowCount == 1) {
			req.setAttribute("result", "success");
		} else {
			req.setAttribute("result", "fail"); 
		}
		
		return FORM_VIEW;	
	}
}
