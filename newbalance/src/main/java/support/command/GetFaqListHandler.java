package support.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;
import support.domain.FaqDTO;
import support.domain.StoreDTO;
import support.service.SupportService;

public class GetFaqListHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println(">GetFaqListHandler.process() 호출됨..");
	
		String searchWord = ( request.getParameter("searchWord") == null ? "" : request.getParameter("searchWord") );
		System.out.println("searchWord=" + searchWord);
		
		SupportService  faqService= SupportService.getInstance();
	    	 
		int currentPage =  ( request.getParameter("currentPage") == null ? 1 : Integer.parseInt(request.getParameter("currentPage")) );  // 현재 페이지. 
		int limitCount =  ( request.getParameter("limitCount") == null ?10: Integer.parseInt(request.getParameter("limitCount")) );  // 현재 페이지. 
		int totalCount = 0;
	    	  
	    if( searchWord == "" ) { // 검색어 없을 때 // 메인 
			List<FaqDTO> list = faqService.selectfaq(currentPage, limitCount);
			totalCount = faqService.getTotaFAQ();
			request.setAttribute("list", list);
			System.out.println(list);			
		} 
		else { // 검색어 있을 때
			List<FaqDTO> list = faqService.searchfaq(searchWord, currentPage, limitCount);
			totalCount = faqService.getTotalsFAQ(searchWord);
			request.setAttribute("list", list);
			System.out.println(list);
		}
	    	  
		request.setAttribute("totalCount", totalCount);
		System.out.println("totalCount =" + totalCount);
		
	   return "/support/faq.jsp";  // viewPage
	    	  
	 
	}

}
