package org.sunshine.store;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.sunshine.crontroller.InventoryController;
import org.sunshine.domain.Dues;
import org.sunshine.domain.Store;

@Controller
public class StoreController {

	/** Logger for this class and subclasses */
	protected final Log logger = LogFactory.getLog(getClass());
	@Autowired
	private InventoryController inventoryController;
	@Autowired
	private StoreService storeService;

	@RequestMapping(value="/store/add_store_details.htm", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody List<String> onAddStoreSubmit(@RequestBody Store store, HttpServletRequest request)
			throws ServletException, IOException {

		logger.info("store name: " + store.getName());
		int storeId = storeService.addStore(store);
		System.out.println("store id: " + storeId);
		
		double commissionPercentage = Double.parseDouble(request.getParameter("commission"));
		Dues dues = new Dues();
		dues.setCommissionPercentage(commissionPercentage);
		dues.setStoreId(storeId);
		storeService.addDueDetails(dues);
		
		List<String> message = new ArrayList<String>();
        message.add(store.getName() + "is successfully added to the system");
        message.add(Integer.toString(storeId));
        return message;
	}

	@RequestMapping(value = "/add_store.htm", method = RequestMethod.GET)
	public ModelAndView onAddStoreRequest() throws ServletException {
		return new ModelAndView("add_store");
	}

	@RequestMapping(value = "/store/edit_store_submit.htm", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody List<String> onEditStoreSubmit(@RequestBody Store store)
			throws ServletException, IOException {

		logger.info("store name: " + store.getName());
		storeService.editStore(store);

		List<String> message = new ArrayList<String>();
        message.add("'" + store.getName() + "' is successfully updated");
        return message;
		
        }

	@RequestMapping(value = "/edit_store_details.htm", method = RequestMethod.GET)
	public ModelAndView onEditStoreRequest() throws ServletException {
		return new ModelAndView("edit_store_details");
	}
	
	@RequestMapping(value = "/admin_edit_store_details.htm", method = RequestMethod.GET)
	public ModelAndView onAdminEditStoreRequest() throws ServletException {
		return new ModelAndView("admin_edit_store_details");
	}
	
	@RequestMapping(value = "/viewstores.htm", method = RequestMethod.GET)
	public ModelAndView onGetStoreRequest() throws ServletException {

		return new ModelAndView("view_stores");
	}

	@RequestMapping(value = "/store/{storeid}/delete_store_submit.htm", method = RequestMethod.POST)
	public @ResponseBody List<String> onDeleteStoreSubmit(@PathVariable("storeid") String storeid)
			throws ServletException, IOException {

		logger.info("store ID: " + storeid);
		Store store = new Store();
		store.setId(Integer.parseInt(storeid));
		storeService.deleteStore(store);

		List<String> message = new ArrayList<String>();
        message.add("Store with ID '" + store.getId() + "' is successfully deleted");
        return message;
	}
	
	@RequestMapping(value = "/stores/{location}/storesinlocation.htm", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody
	List<Store> getStoresInLocation(@PathVariable("location") String location) {
		System.out.println(storeService.getStoresInLocation(location));
		return storeService.getStoresInLocation(location);
	}

	@RequestMapping(value = "/stores/{store}/{location}/storessearch.htm", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody
	List<Store> getStoresInLocationSearch(@PathVariable("location") String location,@PathVariable("store") String store) {
		store = "%"+store+"%";
		if(location.equals("empty")){
			return storeService.getStoresInLocationSearch(store);
		}
		return storeService.getStoresInLocationSearch(location, store);
	}
	
	@RequestMapping(value = "view_store_details.htm", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public 	ModelAndView getStoreDetailsView() {
		return new ModelAndView("view_store_details");
	}
	
	@RequestMapping(value = "/stores/getAllStores.htm", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody
	List<Store> getAllStoreDetails() {
		return storeService.getStores();
	}
	
	@RequestMapping(value = "/stores/{store}/getAllStoresByName.htm", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody
	List<Store> getAllStoreDetailsByName(@PathVariable("store") String store) {
		return storeService.getStoresByName(store);
	}
	
	@RequestMapping(value = "/stores/{store}/storedetails.htm", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody
	List<Store> getStoreDetails(@PathVariable("store") String storeId) {
		return storeService.getStoreById(storeId);
	}
	
	@RequestMapping(value = "/stores/{store}/getstorename.htm", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody List<String> getStoreName(@PathVariable("store") String storeId) {
		List<String> l = new ArrayList<String>();
		l.add(storeService.getStoreNameById(storeId));
		return l;
	}
	
	@ModelAttribute("store")
	public Store getStoreObject() {
		return new Store();
	}
	
	@RequestMapping(value = "/store/index.htm", method = RequestMethod.GET)
	public ModelAndView getStoreHome(@PathVariable("storeName") String storeName) throws ServletException {
		System.out.println("Store Name: "+storeName);
		return new ModelAndView("store_home");
	}
	
}