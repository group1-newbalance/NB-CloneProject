package member.command;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.domain.MemberDTO;
import member.domain.TermsDTO;
import member.service.JoinService;
import mvc.command.CommandHandler;

public class JoinHandler implements CommandHandler{

	private static final String FORM_VIEW = "/customer/joinRegisterInfo.jsp";
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(request.getMethod().equalsIgnoreCase("GET")) {
			return processForm(request, response);
		} else if (request.getMethod().equalsIgnoreCase("POST")) {
			return processSubmit(request, response);
		} else {
			response.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
			return null;
		}
	}
	
	private String processForm(HttpServletRequest request, HttpServletResponse response) {
		return FORM_VIEW;
	}
	
	private String processSubmit(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		 
		String name = req.getParameter("custName");
		int gender = Integer.parseInt(req.getParameter("custSex"));
		int nativecheck = Integer.parseInt(req.getParameter("nation"));
		String birth = req.getParameter("birthDay");
		String telecom = req.getParameter("telecom");
		String phone =req.getParameter("cellNo");
		String id = req.getParameter("custId"); 
		
		String pwd = req.getParameter("custPw");
		String tel1 =  req.getParameter("phoneNum1");
		String tel2 =  req.getParameter("phoneNum2");
		String tel3 =  req.getParameter("phoneNum3");
		String tel = tel1 + "-" + tel2 + "-" + tel3;
		int zipcode = Integer.parseInt(req.getParameter("zipcode"));
		String address1 = req.getParameter("add1");
		String address2 = req.getParameter("add2");
		
		String email1 = req.getParameter("txtOrderEmail1");
		String email2 = req.getParameter("txtOrderEmail2");
		String email = email1 + "@" + email2;
		
		String specialdate1 = req.getParameter("spacialYear");
		String specialdate2 = req.getParameter("spacialMonth");
		String specialdate3 = req.getParameter("spacialDate");
		String specialdate = specialdate1 + "/" +specialdate2 + "/" + specialdate3;
		int receiveinfo = req.getParameter("receiveinfo") ==null ? -1:Integer.parseInt(req.getParameter("receiveinfo"));
		
		
		
	
	
		MemberDTO mem = new MemberDTO();
		mem.setUserId(id);
		mem.setUserPwd(pwd);
		mem.setUserName(name);
		mem.setUserGender(gender);
		mem.setUserSkt(telecom);
		mem.setUserPhone(phone);
		mem.setUserBirth(birth);
		mem.setUserEmail(email);
		mem.setUserTel(tel);
		mem.setUserZipcode(zipcode);
		mem.setUserSpecialdate(specialdate);
		mem.setUserReceiveinfo(receiveinfo);
		mem.setUserAddress1(address1);
		mem.setUserAddress2(address2);
		mem.setUserNativecheck(nativecheck);
		
		
	
		
	
		System.out.println("handler : "+mem.toString());
	
	
	
		JoinService JService = JoinService.getInstance();
	     JService.insert(mem);
	      
	     
	      String location = "/newbalance/customer/joinRegisterProc.jsp";
	      resp.sendRedirect(location);
	        
	      return null; 
	   }

	}