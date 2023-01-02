package support.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;
import net.sf.json.JSONArray;
import support.domain.NoticeDTO;
import support.service.SupportService;

public class GetNoticeAjaxHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
	
		
		System.out.println(">GetNoticeAjaxHandler.process() 호출됨..");
		
		SupportService  listService= SupportService.getInstance();
		
		int currentPage =  ( request.getParameter("currentPage") == null ? 1 : Integer.parseInt(request.getParameter("currentPage")) );  
		int limitCount =  ( request.getParameter("limitCount") == null ? 10 : Integer.parseInt(request.getParameter("limitCount")) ); 
		int totalCount = 0;
		
		List<NoticeDTO> list = listService.select(currentPage, limitCount);
	    totalCount = listService.getTotalNotice();
	    
	      request.setAttribute("list", list);
	      request.setAttribute("totalCount", totalCount);

		
		JSONArray jsonObject = JSONArray.fromObject(list); 
		System.out.println(jsonObject.toString());
		return jsonObject.toString();
	}

	
}
