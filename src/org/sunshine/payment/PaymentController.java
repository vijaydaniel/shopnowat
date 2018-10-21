package org.sunshine.payment;

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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.sunshine.domain.Dues;
import org.sunshine.reports.PaymentDues;
import org.sunshine.reports.ReportService;

@Controller
public class PaymentController {
	
	@Autowired
	private ReportService reportService;

	/** Logger for this class and subclasses */
	protected final Log logger = LogFactory.getLog(getClass());

	@Autowired
	private PaymentService paymentService;

	@RequestMapping(value = "/paymentdues.htm", method = RequestMethod.GET)
	public ModelAndView onPaymentDuesRequest() throws ServletException {
		return new ModelAndView("payment_dues");
	}
	
	@RequestMapping(value = "/paymentduesforstores.htm", method = RequestMethod.GET)
	public ModelAndView onPaymentDuesforStores() throws ServletException {
		return new ModelAndView("payment_dues_for_stores");
	}
	
	@RequestMapping(value = "/payment/{storeId}/getPaymentStatementForStore.htm", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody
	List<PaymentDues> getPaymentDuesForStore(@PathVariable("storeId") String storeId) {
		return paymentService.getPaymentDuesForStore(storeId);
	}
	
	@RequestMapping(value = "/reports/getpaymentdues.htm", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody
	List<PaymentDues> getPaymentDues() {
		return reportService.getAllPaymentDues();
	}
	
	@RequestMapping(value = "/payment.htm", method = RequestMethod.GET)
	public ModelAndView paymentDues() throws ServletException, IOException {
		System.out.println("payment dues page request");
		return new ModelAndView("payment");
	}	
	
	@RequestMapping(value = "/payment/pay.htm", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody
	List<String> onPaymentSubmit(@RequestBody Dues dues)
			throws ServletException, IOException {
		System.out.println("dues object:"+dues);
		paymentService.updatePayment(dues);
		List<String> message = new ArrayList<String>();
		message.add("Payment is successfully updated in the system");
		return message;
	}	
	
	@RequestMapping(value = "/payment/seteshopperstatus.htm", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody
	List<String> onSetEshopperStatus(HttpServletRequest request)
			throws ServletException, IOException {
		String storeId = (String) request.getParameter("storeId");
		paymentService.updateShopperPaymentStatus(storeId,"paid");
		List<String> message = new ArrayList<String>();
		message.add("Payment is successfully updated in the system");
		return message;
	}

}