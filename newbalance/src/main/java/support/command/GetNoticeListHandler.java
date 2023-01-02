package support.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;
import support.domain.NoticeDTO;
import support.service.SupportService;

public class GetNoticeListHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(">GetNoticeListHandler.process() 호출됨..");
		
		SupportService  listService= SupportService.getInstance();
		
		int currentPage =  ( request.getParameter("currentPage") == null ? 1 : Integer.parseInt(request.getParameter("currentPage")) );  // 현재 페이지. 
		int limitCount =  ( request.getParameter("limitCount") == null ? 10 : Integer.parseInt(request.getParameter("limitCount")) );  // 현재 페이지. 
		int totalCount = 0;
		
	    List<NoticeDTO> list = listService.select(currentPage, limitCount);
	    totalCount = listService.getTotalNotice();
	    
	      request.setAttribute("list", list);
	      request.setAttribute("totalCount", totalCount);

		return "/support/notice.jsp";
	}

	

}
