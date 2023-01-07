package product.command;

import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.domain.UserDTO;
import member.service.CartService;
import mvc.command.CommandHandler;
import net.sf.json.JSONArray;
import product.domain.ProductColorDTO;
import product.domain.ProductDTO;
import product.domain.ProductAjaxDTO;
import product.domain.ProductImageDTO;
import product.domain.ProductSizeDTO;
import product.service.SelectProductService;

public class QuickViewHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		
		
		String pdCode = request.getParameter("pdCode");
		System.out.println("pdCode : "+pdCode);
		
		
		
		// 서비스 객체 생성
		SelectProductService productService = SelectProductService.getInstance();
		// CartService cartService = CartService.getInstance();
		
		ProductAjaxDTO pdDto = null;
		ArrayList<ProductImageDTO> imgList = null;
		ArrayList<ProductSizeDTO> sizeList = null;
		//ArrayList<ProductAjaxDTO> relatedPdList = null;
		ArrayList<ProductColorDTO> diffColorList = null;
		// ProductColorDTO colorDto = null;
		//int cartCount = 0;

		HttpSession session = request.getSession(false);
		if(session != null) {
			UserDTO member = (UserDTO) session.getAttribute("member");
			if(member != null) {
				request.setAttribute("userCode", member.getUserCode());   // ${ userCode }
				
				//cartCount = cartService.sumOfCartCount( pdCode);
				//request.setAttribute("cartCount", cartCount);
			}
		}
		
		
	
		pdDto = productService.selectProductAjax(pdCode); 
		imgList = productService.selectImage(pdCode); 
		sizeList = productService.selectSize(pdCode); 
		//relatedPdList = productService.selectRelatedProduct(pdCode);
		diffColorList = productService.diffColorProduct(pdCode); 
		// colorDto = productService.getPdColor(pdCode);

		// request 객체에 저장
		//request.setAttribute("pdDto", pdDto);
		//request.setAttribute("imgList", imgList);
		//request.setAttribute("sizeList", sizeList);
		//request.setAttribute("relatedPdList", relatedPdList);
		//request.setAttribute("diffColorList", diffColorList);
		//request.setAttribute("colorDto", colorDto);
		
		ArrayList list = new ArrayList();

		list.add(pdDto);
		list.add(imgList);
		list.add(sizeList);
		//list.add(relatedPdList);
		list.add(diffColorList);
		//list.add(colorDto);
		
		System.out.println(list.toString());
		
		JSONArray quickview = JSONArray.fromObject(list);
		System.out.println(quickview);
		
		try {

			
			return quickview.toString();
			
			}catch(Exception e){
				System.out.println(e.toString());
			}
		
		return null;

	}

}
