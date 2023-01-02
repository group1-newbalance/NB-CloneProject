package my.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;

public class InsertQuestionHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if( request.getMethod().equalsIgnoreCase("GET") ) {  // GET
	         return "/days11/replyboard/write.jsp";  // viewPage
	      }else if(request.getMethod().equalsIgnoreCase("POST")){ // POST
	         
	         String writer = request.getParameter("writer");
	         String email = request.getParameter("email");
	         String subject = request.getParameter("subject");
	         String content = request.getParameter("content");
	         String pass = request.getParameter("pass");
	         
	         ReplyBoardDTO dto = new ReplyBoardDTO();
	            dto.setWriter(writer);
	            dto.setEmail(email);
	            dto.setSubject(subject);
	            dto.setContent(content);
	            dto.setPass(pass);  
	            // PC ip 주소
	            dto.setIp(   request.getRemoteAddr()  );
	      
	         // 답글일 경우    write.do?num=2&ref=2&step=1&depth=0
	            String parentNum = request.getParameter("num");
	         if ( parentNum == null  ) {  // 새글
	            dto.setStep(1);
	            dto.setDepth(0);
	         } else {  // 답글
	        	 int parentRef = Integer.parseInt( request.getParameter("ref") );  // 부모 그룹
	             int parentStep = Integer.parseInt( request.getParameter("step") ); // 부모 그룹순서
	             int parentDepth = Integer.parseInt( request.getParameter("depth") ); // 부모 깊이

	             dto.setRef(parentRef);
	             dto.setStep(parentStep + 1);
	             dto.setDepth(parentDepth + 1); 
	         }    // if
	         
	         WriteService writeService = WriteService.getInstance();
	         int rowCount = writeService.write(dto);
	         
	         if (rowCount == 1) {
	            String location = "list.do";
	            response.sendRedirect(location);  // 포워딩 X,  리다이렉트 O
	         }
	         
	      } else {
	         // GET, POST X
	         response.sendError( HttpServletResponse.SC_METHOD_NOT_ALLOWED );
	      }
	      return null;
	
	}

	
}
