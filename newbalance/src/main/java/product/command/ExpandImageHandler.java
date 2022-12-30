package product.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.domain.UserDTO;
import mvc.command.CommandHandler;
import product.domain.ProductDTO;
import product.domain.ProductImageDTO;
import product.service.SelectProductService;

public class ExpandImageHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String pdCode = request.getParameter("pdCode");
		
		SelectProductService productService = SelectProductService.getInstance();
	 
		ProductDTO pdDto = null;
		ArrayList<ProductImageDTO> imgList = null;
				
		HttpSession session = request.getSession();
		if (session != null) {
			UserDTO member = (UserDTO) session.getAttribute("member");
			if(member != null) {
				pdDto = productService.selectProduct(pdCode, member.getUserCode());
				imgList = productService.selectImage(pdCode, member.getUserCode());
			}
		}else {
			return null;
		}

	    request.setAttribute("pdDto", pdDto);
	    request.setAttribute("imgList", imgList);
	      
	    return "/product/productExpandImage.jsp";
	}

	
}
