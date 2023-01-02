package my.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.domain.UserDTO;
import mvc.command.CommandHandler;
import my.domain.QuestionDTO;
import my.service.MyPageService;

public class QuestionHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("> QuestionHandler 호출!!!! ");
		

		MyPageService myPageService = MyPageService.getInstance();
	      HttpSession session = request.getSession(false);
	      List<QuestionDTO> questiondto = null;
	      if (session != null) {
	         System.out.println("myMain session [not null]");
	         UserDTO member = (UserDTO) session.getAttribute("member");
	         if (member != null) {
	            System.out.println("myMain member [not null]");
	            questiondto = myPageService.getQuestion(member.getUserCode());
	         }
	      }

	      if(questiondto == null) {
	         response.setStatus(HttpServletResponse. SC_NOT_FOUND);
	         return null;
	      }
	      
	      request.setAttribute("questiondto", questiondto);

	      return "/my/searchQuestionList.jsp";
	   }

}
