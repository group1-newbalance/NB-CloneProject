package my.command;
import java.util.Map;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.domain.UserDTO;
import mvc.command.CommandHandler;
import my.service.MyPageService;

public class MemberDeliveryInfoHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// 회원코드 받기

		MyPageService myPageService = MyPageService.getInstance();
		HttpSession session = request.getSession(false);
		
		Map<String, Object> delData = null;
		if (session != null) {
			UserDTO member = (UserDTO) session.getAttribute("member");
			if (member != null) {
				delData = myPageService.getMemberDeliveryInfo(member.getUserCode());
			}
		}
		
		request.setAttribute("delData", delData);
		
		return "/my/memberDeliveryInfo.jsp";

	}

}
