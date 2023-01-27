package product.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.domain.UserDTO;
import mvc.command.CommandHandler;
import net.sf.json.JSONObject;
import product.domain.BuyProductDTO;
import product.service.SelectProductService;

public class AddCartHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("AddCartHandler 호출됨");
		
		HttpSession session = request.getSession();
		UserDTO member = (UserDTO) session.getAttribute("member");
		String userCode = member.getUserCode();

		JSONObject resultJSON = new JSONObject();
		try {
			
			String pdCode = request.getParameter("pd_code");
			int pdPrice = Integer.parseInt(request.getParameter("pd_price").replaceAll(",", ""));
			int sizeCode = Integer.parseInt(request.getParameter("sizeCode"));
			int pdAmount = Integer.parseInt(request.getParameter("pd_amount"));
			String pdColor = request.getParameter("pd_color");
			String pdImage = request.getParameter("pd_image");
			String pdName = request.getParameter("pd_name");
			
			//String[] sizeCodeList = request.getParameterValues("sizecode");

			/*
			int[] sizeCode = new int[sizeCodeList.length];
			for (int i = 0; i < sizeCodeList.length; i++) {
				sizeCode[i] = Integer.parseInt(sizeCodeList[i]);		
			}
			System.out.println(Arrays.toString(sizeCode));
			*/

			
			BuyProductDTO cartDto = new BuyProductDTO(pdCode, pdPrice, sizeCode, pdAmount, pdColor, pdImage, pdName);
			
			System.out.println(userCode + "/" + pdCode + "/" + pdPrice + "/" + sizeCode + "/" + pdAmount 
					+ "/" + pdColor + "/" + pdImage + "/" + pdName);

			SelectProductService productService = SelectProductService.getInstance(); 
			int rowCount = productService.addCartList(cartDto, userCode);
			System.out.println(rowCount);
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
