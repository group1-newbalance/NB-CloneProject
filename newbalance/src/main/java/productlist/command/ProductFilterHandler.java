package productlist.command;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedHashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import mvc.command.CommandHandler;
import net.sf.json.JSONArray;
import productlist.domain.ProductImgDTO;
import productlist.domain.ProductListDTO;
import productlist.domain.ProductReviewDTO;
import productlist.domain.ProductSizeStockDTO;
import productlist.service.ProductFilterPImgAjaxService;
import productlist.service.ProductFilterReviewService;
import productlist.service.ProductFilterSizeStockAjaxService;
import productlist.service.ProductFilterListAjaxService;

public class ProductFilterHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		
		//.replace("[", "'").replace("]","'").replaceAll(", ","', '");
		//품절상품제외
		String soldOutYn = request.getParameter("soldOutYn");// "Y"
		//발사이즈, 옷사이즈 등등 사이즈들
		String[] sizeCodes = request.getParameterValues("sizeCode");
			String sizeCode = Arrays.toString(sizeCodes).replace("[", "").replace("]","");//220 , 230 , 240 
		//발 볼
		String[] feetWidths = request.getParameterValues("width");
			String feetWidth = Arrays.toString(feetWidths).replace("[", "'").replace("]","'").replaceAll(", ","', '");//"D" , "D(넓음)"
		//색상
		String[] colorCodes = request.getParameterValues("colorCode");
			String colorCode = Arrays.toString(colorCodes).replace("[", "").replace("]","");  // 02 , 57 , 20
		//서브 카테고리들...
		String[] subCateIdxes = request.getParameterValues("subCateIdx");
		String subCateIdx = Arrays.toString(subCateIdxes).replace("[", "'").replace("]","'").replaceAll(", ","', '");   //  "F01","F02"
		//가격 범위
		String[] priceRanges = request.getParameterValues("priceRange");//[0~49990,50000~99990,100000~149990]
		String[][] priceRange = null;
		if(priceRanges!=null) {
			priceRange = new String[priceRanges.length][];
			for (int i = 0; i < priceRanges.length; i++) {
				priceRange[i] = priceRanges[i].split("~"); //[["0","49990"],["50000","99990"],["100000","149990"]]
			}
		}
	/*
		for (int i = 0; i < priceRange.length; i++) {
			System.out.print(priceRange[i][0]+ "," + priceRange[i][1]);
			System.out.print("\n");
		}
	*/
		//정렬 신상품순,베스트상품순, 가격순
		String sortProducts = request.getParameter("sortProducts");
		//카테고리 그룹코드
		String cateGrpCode = request.getParameter("cateGrpCode");
		String cIdx = request.getParameter("cIdx");
		
		
		System.out.println("성별 :"  + cateGrpCode);
		System.out.println("상품카테고리 :"  + cIdx);
		System.out.println("정렬 : " + sortProducts);
		System.out.println("사이즈 : " + sizeCode);
		//System.out.println("사이즈2 : " + Arrays.toString(sizeCodes));
		//System.out.println("컬러 : " + sizeCode instanceof String);
		System.out.println("컬러 : " + colorCode);
		System.out.println("발볼 : " + feetWidth);
		//System.out.println("컬러 : " + colorCode instanceof String);
		System.out.println("서브 카테고리들 : " + subCateIdx);
		System.out.println("가격 범위 : " + priceRange);
		System.out.println();
		
		//상품정보
		ProductFilterListAjaxService productListAjaxService
			= ProductFilterListAjaxService.getInstance();
		LinkedHashMap<String, ProductListDTO> productListAjax 
			= productListAjaxService.productListAjaxService(soldOutYn, sizeCode, feetWidth, colorCode, subCateIdx, priceRange, sortProducts, cateGrpCode, cIdx);
		//상품이미지
		ProductFilterPImgAjaxService productFilterPImgAjaxService
			= ProductFilterPImgAjaxService.getInstance();
		LinkedHashMap<String, ArrayList<ProductImgDTO>> productImgAjax 
			= productFilterPImgAjaxService.productImgAjaxService(soldOutYn, sizeCode, feetWidth, colorCode, subCateIdx, priceRange, sortProducts, cateGrpCode, cIdx);
		 
		//상품재고
		ProductFilterSizeStockAjaxService productFilterSizeStockAjaxService
			= ProductFilterSizeStockAjaxService.getInstance();
		LinkedHashMap< String, ArrayList<ProductSizeStockDTO> > productSizeAjax
			= productFilterSizeStockAjaxService.productFilterSizeStockAjaxService(soldOutYn, sizeCode, feetWidth, colorCode, subCateIdx, priceRange, sortProducts, cateGrpCode, cIdx);
		//리뷰
		ProductFilterReviewService productFilterReviewAjaxService
			= ProductFilterReviewService.getInstance();
		LinkedHashMap< String, ArrayList<ProductReviewDTO> > productReviewAjax
			= productFilterReviewAjaxService.productReviewAjaxService(soldOutYn, sizeCode, feetWidth, colorCode, subCateIdx, priceRange, sortProducts, cateGrpCode, cIdx);

		//ArrayList list = new ArrayList();
		ArrayList list = new ArrayList();
		list.add(productListAjax);
		list.add(productImgAjax);
		list.add(productSizeAjax);
		list.add(productReviewAjax);
		
		JSONArray result = JSONArray.fromObject(list);
		
		System.out.println(result);
	
		try {

		
		return result.toString();
		
		}catch(Exception e){
			System.out.println(e.toString());
		}
		
		return null;
	}

}
