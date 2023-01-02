package my.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.domain.MemberDTO;
import member.domain.UserDTO;


import mvc.command.CommandHandler;

import my.service.UpdateMemberService;


public class JoinUpdateHandler implements CommandHandler {
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 회원코드 받기
		UpdateMemberService memService = UpdateMemberService.getInstance();
		HttpSession session = request.getSession(false);
		MemberDTO myInfo = null;
		if (session != null) {
			UserDTO member = (UserDTO) session.getAttribute("member");
			if (member != null) {
				myInfo = memService.getMemberInfo(member.getUserCode());
			}
		}

		if(myInfo == null) {
			response.setStatus(HttpServletResponse. SC_NOT_FOUND);
			return null;
		}
		
		
		System.out.println(myInfo.toString());
		request.setAttribute("myInfo", myInfo);
		return "/my/memberModifyDetail.jsp";
	}

}

