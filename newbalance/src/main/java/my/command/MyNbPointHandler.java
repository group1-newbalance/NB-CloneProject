package my.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.domain.UserDTO;
import mvc.command.CommandHandler;
import my.domain.MyNbPointDTO;
import my.service.MyPageService;

public class MyNbPointHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(request.getMethod().equalsIgnoreCase("GET")) {
			return processGet(request, response);
		} else if (request.getMethod().equalsIgnoreCase("POST")) {
			return processPOST(request, response);
		}
		return null;
	}

	public String processGet(HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession();
		UserDTO member = (UserDTO) session.getAttribute("member");
		String userCode = member.getUserCode();

		MyPageService mypageService = MyPageService.getInstance();

		MyNbPointDTO mpDto = null;

		return "/my/myNbPoint.jsp";


	}


	public String processPOST(HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession();
		UserDTO member = (UserDTO) session.getAttribute("member");
		String userCode = member.getUserCode();

		String sDate = request.getParameter("sDate");
		String eDate = request.getParameter("eDate");

		MyPageService mypageService = MyPageService.getInstance();

		String location = "/my/myNbPoint.jsp";
		ArrayList<MyNbPointDTO> mpList = null;
		try {
			mpList = mypageService.selectMyNbPointByDate(userCode, sDate, eDate);
			request.setAttribute("mpList", mpList);
		} catch (NamingException e) {
			e.printStackTrace();
		}
		return location;
	}


}
