package org.sunshine.crontroller;

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
import org.sunshine.product.ProductService;
import org.sunshine.store.StoreService;

@Controller
public class InventoryController {

	protected final Log logger = LogFactory.getLog(getClass());

	@Autowired
	private ProductService productService;
	@Autowired
	private StoreService storeService;

	@RequestMapping("/index")
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response,HttpSession session,Map<String, Object> myModel) throws ServletException, IOException {

		
		String now = (new java.util.Date()).toString();
		logger.info("returning hello view with " + now);

		if(myModel==null){
		 myModel = new HashMap<String, Object>();
		}
		myModel.put("now", now);
		myModel.put("stores", storeService.getStores());
		
		String selectedStore = request.getParameter("store");
		session.setAttribute("storeid",selectedStore);
		if(selectedStore!=null){
			myModel.put("products",productService.getSelectedProducts(selectedStore));
		}		

		return new ModelAndView("index", "model", myModel);
	}
	
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	public void setStoreService(StoreService storeService) {
		this.storeService = storeService;
	}
	
}