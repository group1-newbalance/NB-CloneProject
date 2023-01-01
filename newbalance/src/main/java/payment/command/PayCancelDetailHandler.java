
package payment.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.domain.UserDTO;
import mvc.command.CommandHandler;
import my.service.MyPageService;
import payment.domain.PayCancelDetailDTO;
import payment.service.PayCancelService;


public class PayCancelDetailHandler implements CommandHandler {
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("PayCancelDetailHandler 호출");
		
		PayCancelService cancelService = PayCancelService.getInstance();
		HttpSession session = request.getSession(false);
		PayCancelDetailDTO cancelDetailDTO = null;
		String orderNo = request.getParameter("orderNo");
		 
		if (session != null) {
			System.out.println("세션 유지중");
			UserDTO member = (UserDTO) session.getAttribute("member");
				if(member != null) {	
					System.out.println("멤버 null X");
					cancelDetailDTO = cancelService.showCancelDetail(orderNo);
				}
		}
		if (cancelDetailDTO == null) {
			response.setStatus(HttpServletResponse.SC_NOT_FOUND);
			return null;
		}
		
		
		/*
		 * String rq = request.getMethod(); if (rq.equalsIgnoreCase("GET")) {
		 * 
		 * return "/my/orderCRCDetail.jsp"; }else if(rq.equalsIgnoreCase("POST")){
		 * 
		 * return "/my/orderCRCList.jsp"; }
		 */
		System.out.println(cancelDetailDTO.toString());
		
		request.setAttribute("cancelDetailDTO",cancelDetailDTO );
		
		return "/my/orderCRCDetail.jsp";
	} 
	
}

