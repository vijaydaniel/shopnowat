package org.sunshine.search;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.sunshine.crontroller.InventoryController;

@Controller
public class SearchController {

	protected final Log logger = LogFactory.getLog(getClass());

	@Autowired
	private SearchService searchService;
	@Autowired
    private InventoryController inventoryController;
	
	@RequestMapping("/search_products.htm")
	public ModelAndView searchProducts(HttpServletRequest request,
			HttpServletResponse response,HttpSession session) throws ServletException, IOException {
		
		String now = (new java.util.Date()).toString();
		logger.info("returning hello view with " + now);

		Map<String, Object> myModel = new HashMap<String, Object>();
		myModel.put("now", now);
		
		String storeid = (String) session.getAttribute("storeid");
		String searchString = request.getParameter("SearchString");
		System.out.println("searchString:"+searchString+"\nstoreid:"+storeid);
		if(storeid!=null && searchString!=null){
			Integer sid = Integer.valueOf(storeid);
			myModel.put("productSearchResult",searchService.getMatchingProducts(sid,searchString));
		}

		return inventoryController.handleRequest(request, response, session,myModel);
	}
	
	@RequestMapping("/search_products_across_stores.htm")
	public ModelAndView searchProductsAcrossStores(HttpServletRequest request,
			HttpServletResponse response,HttpSession session) throws ServletException, IOException {
		
		String now = (new java.util.Date()).toString();
		logger.info("returning hello view with " + now);

		Map<String, Object> myModel = new HashMap<String, Object>();
		myModel.put("now", now);
		
		String searchString = request.getParameter("SearchString");
		System.out.println("searchString:"+searchString);
		if(searchString!=null){
			myModel.put("productSearchASResult",searchService.getMatchingProductsAcross(searchString));
		}

		return inventoryController.handleRequest(request, response, session,myModel);
	}

	@RequestMapping("/search_stores.htm")
	public ModelAndView searchStores(HttpServletRequest request,
			HttpServletResponse response,HttpSession session) throws ServletException, IOException {

		String now = (new java.util.Date()).toString();
		logger.info("returning hello view with " + now);

		Map<String, Object> myModel = new HashMap<String, Object>();
		myModel.put("now", now);
		
		String searchString = request.getParameter("SearchString");
		System.out.println("searchString:"+searchString);
		if(searchString!=null){
			myModel.put("storeSearchResult",searchService.getMatchingStores(searchString));
		}

		return inventoryController.handleRequest(request, response, session,myModel);
	}

	public void setSearchService(SearchService searchService) {
		this.searchService = searchService;
	}

}