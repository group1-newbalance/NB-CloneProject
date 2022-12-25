package productlist.command;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;
import productlist.service.ProductImgService;
import productlist.service.ProductListService;
import productlist.service.ProductSizeStockService;
import productlist.domain.CategoryDTO;
import productlist.domain.ProductColorDTO;
import productlist.domain.ProductImgDTO;
import productlist.domain.ProductListDTO;
import productlist.domain.ProductSizeStockDTO;
import productlist.service.CategorColorService;
import productlist.service.CategoryFeetService;
import productlist.service.CategoryListService;
import productlist.service.CategorySizeService;

public class ProductListHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String gender = request.getParameter("cateGrpCode");
		String cIdx = request.getParameter("cIdx");
		
		// product
		ProductListService productlistService = ProductListService.getIinstance();
		List<ProductListDTO> productList = productlistService.select(cIdx, gender);//filter(color=? or feet=?-> 이건 where문으로), sorttype( 01 02 이건 -> order by) 안넘어 오면 -1//,sorttype
		
		//product image
		ProductImgService productImgService = ProductImgService.getIinstance();
		LinkedHashMap<ProductListDTO, ArrayList<ProductImgDTO>> pImgMap = productImgService.seletProductImg(cIdx, gender);
		
		//sizeStock 사이즈별 상품재고
		ProductSizeStockService pSizeStockService = ProductSizeStockService.getIinstance();
		LinkedHashMap<String, ArrayList<ProductSizeStockDTO>> pSizeStockMap = pSizeStockService.seletProductSizeStock(cIdx, gender);
								//pd_code
		//카테고리명
		CategoryListService clistservice = CategoryListService.getIinstance();
		List<CategoryDTO> categoryList = clistservice.select(cIdx, gender);
		
		//F01, M // F,  M 왼쪽 카테고리명들
		
		//카테고리 사이즈
		CategorySizeService csizeservice = CategorySizeService.getIinstance();
		List<ProductSizeStockDTO> csizeList = csizeservice.selectSize(cIdx, gender);
		
		//카테고리 발볼
		CategoryFeetService cfeetservice = CategoryFeetService.getIinstance();
		List<ProductListDTO> cfeetList = cfeetservice.selectFeet(cIdx, gender);
		
		//카테고리 컬러
		CategorColorService cColor = CategorColorService.getIinstance();
		List<ProductColorDTO> cColorlist = cColor.selectColor(cIdx, gender);
		
		
		request.setAttribute("productList", productList);
		request.setAttribute("pImgMap", pImgMap);
		request.setAttribute("pSizeStockMap", pSizeStockMap);
		request.setAttribute("categoryList", categoryList);
		request.setAttribute("csizeList", csizeList);
		request.setAttribute("cfeetList", cfeetList);
		request.setAttribute("cColorlist", cColorlist);
		
		return "/productList/itemListMain.jsp";
		
	}

}
