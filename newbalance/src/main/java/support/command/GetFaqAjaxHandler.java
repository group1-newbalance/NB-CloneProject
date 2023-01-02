package support.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;
import net.sf.json.JSONArray;
import support.domain.FaqDTO;
import support.service.SupportService;

public class GetFaqAjaxHandler implements CommandHandler{
	
public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		response.setContentType("text/html; charset=UTF-8");
		System.out.println(">GetFaqAjaxHandler.process() 호출됨..");
		
	    SupportService  faqService= SupportService.getInstance();
	    
	    
	    String searchWord = ( request.getParameter("searchWord") == null ? "" : request.getParameter("searchWord") ); 

	    int currentPage =  ( request.getParameter("currentPage") == null ? 1 : Integer.parseInt(request.getParameter("currentPage")) );  // 현재 페이지. 
	    int limitCount =  ( request.getParameter("limitCount") == null ? 10: Integer.parseInt(request.getParameter("limitCount")) );  // 현재 페이지. 
	    int totalCount = 0;
	    
	    List<FaqDTO> list = null;

	    if( searchWord == "" ) { // 검색어 없을 때 // 메인 
	    	list = faqService.selectfaq(currentPage, limitCount);	
	    	totalCount = faqService.getTotaFAQ();
			request.setAttribute("list", list);
			System.out.println(list);
		} 
		else { // 검색어 있을 때
			list = faqService.searchfaq(searchWord, currentPage, limitCount);
			totalCount = faqService.getTotalsFAQ(searchWord);
			request.setAttribute("list", list);
			System.out.println(list);
		}
	    
	    request.setAttribute("totalCount", totalCount);
		System.out.println("totalCount =" + totalCount);
	    	  
	    	   
		JSONArray jsonObject = JSONArray.fromObject(list); 
	  	System.out.println("json = " + jsonObject.toString());
	  	
	  	return jsonObject.toString();
	    	  
	 
	}

}
