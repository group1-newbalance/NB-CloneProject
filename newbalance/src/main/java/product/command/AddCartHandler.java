package product.command;

import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;
import net.sf.json.JSONObject;
import product.domain.AddCartDTO;
import product.service.SelectProductService;

public class AddCartHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("AddCartHandler 호출됨");

		JSONObject resultJSON = new JSONObject();
		System.err.println(1);
		try {
			//HttpSession session = request.getSession(false);
			//UserDTO member = (UserDTO) session.getAttribute("member");
			System.err.println(2);
			String userCode = request.getParameter("userCode");
			String pdCode = request.getParameter("pdCode");
			String color = request.getParameter("color");
			System.err.println(3);
			String pdImage = request.getParameter("pdImage");
			String[] sizeCodeList = request.getParameterValues("sizeCodeList[]");

			int[] sizeCode = new int[sizeCodeList.length];
			for (int i = 0; i < sizeCodeList.length; i++) {
				sizeCode[i] = Integer.parseInt(sizeCodeList[i]);		
			}
			
			System.out.println(Arrays.toString(sizeCode));
			
			AddCartDTO dto = new AddCartDTO(userCode, pdCode, sizeCode, color, pdImage); 

			SelectProductService productService = SelectProductService.getInstance(); 
			int rowCount = productService.addCartList(dto);

			if (rowCount >= 1) {
				resultJSON.put("result", "00");
			}else {
				resultJSON.put("result", "99");
			}
			System.out.println(resultJSON.toString());


		} catch (Exception e) {
			request.setAttribute("rowCount", 99) ; 
		}

		return resultJSON.toString();
	
	}
	
	

}
