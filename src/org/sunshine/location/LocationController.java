package org.sunshine.location;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.sunshine.domain.Location;

@Controller
public class LocationController {

	protected final Log logger = LogFactory.getLog(getClass());

	@Autowired
	private LocationService locationService;

	@RequestMapping(value = "/location/{location}/getLocation.htm", method = RequestMethod.POST)
	public @ResponseBody
	List<Location> getLocations(@PathVariable("location") String location)
			throws ServletException, IOException {

		return locationService.getLocations(location);
	}
	
	@RequestMapping(value = "/location/getAllLocation.htm", method = RequestMethod.POST)
	public @ResponseBody
	List<Location> getAllLocations()
			throws ServletException, IOException {
		return locationService.getLocations();
	}

	@RequestMapping(value = "/location/addLocation.htm", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody
	List<String> addLocations(@RequestBody Location location)
			throws ServletException, IOException {
		List<String> result = new ArrayList<String>();
		locationService.addLocation(location);
		result.add("Location '" + location.getName()
				+ "' is added successfully");
		return result;
	}
	
	@RequestMapping(value = "/location/deleteLocation.htm", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody
	List<String> deleteLocations(@RequestBody Location location)
			throws ServletException, IOException {
		List<String> result = new ArrayList<String>();
		locationService.deleteLocation(location);
		result.add("Location '" + location.getName()
				+ "' is deleted successfully");
		return result;
	}

	@RequestMapping(value="/addLocationPage.htm", method = RequestMethod.GET)
    public ModelAndView onAddLocationRequest()
            throws ServletException {
        return new ModelAndView("addLocationPage");
    }
	
	@RequestMapping(value="/edit_location.htm", method = RequestMethod.GET)
    public ModelAndView onEditLocationsRequest()
            throws ServletException, IOException {
        return new ModelAndView("edit_location");
    }
	
	@RequestMapping(value = "/location/editLocation.htm", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody
	List<String> editLocations(@RequestBody Location location,HttpServletRequest request)
			throws ServletException, IOException {
		List<String> result = new ArrayList<String>();
		locationService.editLocation(location);
		System.out.println(request.getParameter("previousLocationName"));
		locationService.updateLocationInShoppingCart(location,(String) request.getParameter("previousLocationName"));
		result.add("Location '" + location.getName()
				+ "' is modified successfully");
		return result;
	}
	
	@RequestMapping(value="/viewLocations.htm", method = RequestMethod.GET)
    public ModelAndView onViewLocationsRequest()
            throws ServletException {
        return new ModelAndView("viewLocations");
    }
	
}
