package org.sunshine.reports;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.sunshine.domain.Store;

@Controller
public class ReportController {

	protected final Log logger = LogFactory.getLog(getClass());

	@Autowired
	private ReportService reportService;
	
	@RequestMapping("/all_open_carts_report.htm")
	public ModelAndView getAllOpenCartsRequest(HttpServletRequest request,
			HttpServletResponse response,HttpSession session) throws ServletException, IOException {

		
		String now = (new java.util.Date()).toString();
		logger.info("returning hello view with " + now);

		Map<String, Object> myModel = new HashMap<String, Object>();
		myModel.put("now", now);
		
		String storeid = (String) session.getAttribute("storeId");
		System.out.println("storeId:"+ storeid);
		
		if(storeid!=null){
			myModel.put("all_cart_report",reportService.getAllCarts(storeid));
			myModel.put("open_cart_report", reportService.getAllOpenCarts(storeid));
			myModel.put("items_in_cart_report", reportService.getAllInCartReports(storeid));
			myModel.put("all_cart_admin_report", reportService.getAllOrdersAcrossStores());
			myModel.put("open_cart_admin_report", reportService.getAllOpenOrdersAcrossStores());
		}

		return new ModelAndView("OrderReport", "model", myModel);
	}

	@RequestMapping(value = "/reports/getdues.htm", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody
	List<DueReport> getDues() {
		return reportService.getDues();
	}
	
	@RequestMapping(value = "/viewdues.htm", method = RequestMethod.GET)
	public ModelAndView onGetViewDuesRequest() throws ServletException {
		return new ModelAndView("view_dues");
	}

	@RequestMapping(value = "/display_dues_details.htm", method = RequestMethod.GET)
	public ModelAndView onGetViewDuesDetailsRequest() throws ServletException {
		return new ModelAndView("display_dues_details");
	}
	
	@RequestMapping(value = "/reports/{storeId}/getduesdetails.htm", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody
	List<DueDetailsReport> getDuesDetails(@PathVariable("storeId") String storeId) {
		System.out.println(reportService.getDuesDetails(storeId));
		return reportService.getDuesDetails(storeId);
	}
	
	@RequestMapping(value = "/viewpaidservice.htm", method = RequestMethod.GET)
	public ModelAndView onViewPaidServiceRequest() throws ServletException {
		return new ModelAndView("view_paid_service");
	}
	
	@RequestMapping(value = "/reports/getpaidservice.htm", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody
	List<DueReport> getPaidService() {
		return reportService.getPaidService();
	}
	
	@RequestMapping(value = "/viewdeliveredservice.htm", method = RequestMethod.GET)
	public ModelAndView onViewDeliveredServiceRequest() throws ServletException {
		return new ModelAndView("view_delivered_service");
	}
	
	@RequestMapping(value = "/reports/{delivered}/getservicereportbystatus.htm", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody
	List<DueReport> getDeliveredService(@PathVariable("delivered") String status) {
		return reportService.getServiceByStatus(status);
	}
	
	@RequestMapping(value = "/getservicereportbystoreandstatus.htm", method = RequestMethod.GET)
	public ModelAndView getservicereportbystoreandstatusRequest() throws ServletException {
		return new ModelAndView("view_delivered_service_for_store");
	}
	
	@RequestMapping(value = "/reports/{storeId}/{status}/getservicereportbystoreandstatus.htm", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody
	List<DueReport> getServiceByStoreandStatus(@PathVariable("storeId") String storeId,@PathVariable("status") String status) {
		return reportService.getServiceByStoreandStatus(storeId,status);
	}
	
	@RequestMapping(value = "/reports/{storeId}/getServiceByStoreandStatusDetails.htm", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody
	List<DueDetailsReport> getServiceByStoreandStatusDetails(@PathVariable("storeId") String storeId) {
		return reportService.getServiceByStoreandStatusDetails(storeId);
	}
	
	public void setReportService(ReportService reportService) {
		this.reportService = reportService;
	}

}