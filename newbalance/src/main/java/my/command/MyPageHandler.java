package my.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.domain.UserDTO;
import mvc.command.CommandHandler;
import my.domain.MyMainDTO;
import my.service.MyPageService;

public class MyPageHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 회원코드 받기
		MyPageService myPageService = MyPageService.getInstance();
		HttpSession session = request.getSession(false);
		MyMainDTO myData = null;
		if (session != null) {
			System.out.println("myMain session [not null]");
			UserDTO member = (UserDTO) session.getAttribute("member");
			if (member != null) {
				System.out.println("myMain member [not null]");
				myData = myPageService.getMyMainMenuInfo(member.getUserCode());
			}
		}

		if(myData == null) {
			response.setStatus(HttpServletResponse. SC_NOT_FOUND);
			return null;
		}
		
		// 회원코드로 회원 이름, 등급, 쿠폰, 마일리지, 관심상품갯수, 주문배송 갯수 출력
		System.out.println(myData.toString());
		request.setAttribute("myData", myData);
		return "/my/myMain.jsp";
	}

}
