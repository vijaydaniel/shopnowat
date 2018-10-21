package org.sunshine.product;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.sunshine.crontroller.InventoryController;
import org.sunshine.domain.Product;
import org.sunshine.domain.ProductImage;

@Controller
public class ProductController {

	/** Logger for this class and subclasses */
	protected final Log logger = LogFactory.getLog(getClass());
	@Autowired
	private InventoryController inventoryController;
	@Autowired
	private ProductService productService;

	@RequestMapping(value = "/product/add_product.htm", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody
	List<String> onAddProductSubmit(@RequestBody Product product)
			throws ServletException, IOException {

		logger.info("product name: " + product.getName());
		productService.addProduct(product);
		List<String> message = new ArrayList<String>();
		message.add(product.getName() + "is successfully added to your store");
		return message;
	}

	@RequestMapping(value = "/product.htm", method = RequestMethod.GET)
	public ModelAndView onAddProductRequest() throws ServletException {

		return new ModelAndView("add_products");
	}

	@RequestMapping(value = "/product/edit_product_submit.htm", method = RequestMethod.POST)
	public @ResponseBody
	List<String> onEditProductSubmit(@RequestBody Product product)
			throws ServletException, IOException {

		logger.info("product name: " + product.getName());
		productService.editProduct(product);
		List<String> message = new ArrayList<String>();
		message.add("'" + product.getName() + "' is successfully modified");
		return message;

	}

	@RequestMapping(value = "/edit_product.htm", method = RequestMethod.GET)
	public ModelAndView onEditProductRequest() throws ServletException {
		return new ModelAndView("edit_products");
	}

	@RequestMapping(value = "/edit_product_2.htm", method = RequestMethod.GET)
	public ModelAndView editProductRequest() throws ServletException {
		return new ModelAndView("edit_products_2");
	}

	@RequestMapping(value = "/delete_product_submit.htm", method = RequestMethod.POST)
	public ModelAndView onDeleteProductSubmit(HttpSession session,
			HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("product") Product product, BindingResult result)
			throws ServletException, IOException {

		logger.info("product name: " + product.getName());
		productService.deleteProduct(product);

		Map<String, Object> myModel = new HashMap<String, Object>();
		myModel.put("products", productService.getProducts());

		return inventoryController.handleRequest(request, response, session,
				myModel);
	}

	@RequestMapping(value = "viewproductsinstore.htm", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public ModelAndView viewProductsInStore() {
		return new ModelAndView("viewproducts");
	}

	@RequestMapping(value = "/product/{store_id}/productsinstore.htm", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody
	List<Product> getProductsInStore(@PathVariable("store_id") String store_id) {
		return productService.getSelectedProducts(store_id);
	}

	@RequestMapping(value = "/product/{store_id}/{category_id}/productsinstore.htm", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody
	List<Product> getProductsInStoreCategory(
			@PathVariable("store_id") String store_id,
			@PathVariable("category_id") String category_id) {
		return productService.getProducts(store_id, category_id);
	}

	@RequestMapping(value = "/product/{storeIdentity}/{category}/{offset}/{rowCount}/productsInStoreByCategory.htm", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody
	List<Product> getProductsInStoreByCategory(
			@PathVariable("storeIdentity") String storeIdentity,
			@PathVariable("category") String category,
			@PathVariable("offset") String offset,
			@PathVariable("rowCount") String rowCount) {
		List<Product> products = productService.getProducts(storeIdentity,
				category, offset, rowCount);
		System.out.println("storeIdentity:" + storeIdentity + "\tcategory:"
				+ category + "\toffset:" + offset + "\trowCount:" + rowCount);
		System.out.println(products);
		return products;
	}

	@RequestMapping(value = "/product/{store_id}/{category_id}/{subcategory_id}/productsinstore.htm", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody
	List<Product> getProduct(@PathVariable("store_id") String store_id,
			@PathVariable("category_id") String category_id,
			@PathVariable("subcategory_id") String subcategory_id) {
		return productService.getProduct(store_id, category_id, subcategory_id);
	}

	@RequestMapping(value = "/product/{store_id}/{productSearchString}/productsinstoresearch.htm", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody
	List<Product> getProductsInStoreByName(
			@PathVariable("store_id") String store_id,
			@PathVariable("productSearchString") String productSearchString) {
		productSearchString = "%" + productSearchString + "%";
		return productService.getSelectedProductsByName(store_id,
				productSearchString);
	}

	@RequestMapping(value = "/product/images.htm", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody
	List<String> getProductImages(HttpServletRequest request) {
		HttpSession session = request.getSession();
		ServletContext sc = session.getServletContext();
		String imageDirectory = sc.getRealPath("/");
		System.out.println(imageDirectory);
		return productService.getProductImages(imageDirectory);
	}

	@RequestMapping(value = "imagegallery.htm", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public ModelAndView getImageGallery() {
		return new ModelAndView("image_gallery");
	}

	@RequestMapping(value = "/product/{searchString}/images.htm", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody
	List<String> getProductImagesByName(HttpServletRequest request,
			@PathVariable("searchString") String searchString) {
		HttpSession session = request.getSession();
		ServletContext sc = session.getServletContext();
		String imageDirectory = sc.getRealPath("/");
		System.out.println(imageDirectory);
		return productService.getProductImages(imageDirectory, searchString);
	}

	@RequestMapping(value = "/product/{storeId}/{offset}/{rowcount}/images.htm", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody
	List<ProductImage> getCommonAndSpecificProductImages(
			@PathVariable("storeId") String storeId,
			@PathVariable("offset") String offset,
			@PathVariable("rowcount") String rowcount) {
		return productService.getCommonAndSpecificProductImages(storeId,
				offset, rowcount);
	}

	@RequestMapping(value = "/product/{storeId}/{offset}/{rowcount}/{searchString}/images.htm", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody
	List<ProductImage> getCommonAndSpecificProductImagesbySearch(
			@PathVariable("storeId") String storeId,
			@PathVariable("offset") String offset,
			@PathVariable("rowcount") String rowcount,
			@PathVariable("searchString") String searchString) {
		return productService.getCommonAndSpecificProductImages(storeId,
				offset, rowcount, searchString);
	}	

	@ModelAttribute("product")
	public Product getProductObject() {
		return new Product();
	}
}