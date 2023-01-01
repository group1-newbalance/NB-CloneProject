package my.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.domain.UserDTO;
import mvc.command.CommandHandler;
import my.domain.MbLevelDTO;
import my.domain.MyMainDTO;
import my.service.MyPageService;

public class MbLevelHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		MyPageService myPageService = MyPageService.getInstance();
		HttpSession session = request.getSession(false);
		MbLevelDTO levelDto = null;
		if (session != null) {
			System.out.println("myMain session [not null]");
			UserDTO member = (UserDTO) session.getAttribute("member");
			if (member != null) {
				System.out.println("myMain member [not null]");
				levelDto = myPageService.getMbLevel(member.getUserCode());
			}
		}

		if(levelDto == null) {
			response.setStatus(HttpServletResponse. SC_NOT_FOUND);
			return null;
		}
		
		request.setAttribute("levelDto", levelDto);
		return "/my/mbLevel.jsp";
	}

}
