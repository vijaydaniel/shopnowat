package org.sunshine.user;

import java.io.IOException;
import java.util.ArrayList;
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
import org.sunshine.domain.User;


@Controller
public class UserController {

    /** Logger for this class and subclasses */
    protected final Log logger = LogFactory.getLog(getClass());
    @Autowired
    private InventoryController inventoryController;
    @Autowired
    private UserService userService;
    
    @RequestMapping(value="/login.htm", method = RequestMethod.GET)
    public ModelAndView login() throws ServletException, IOException {     
    	 System.out.println("login page request");
        return new ModelAndView("login");
    }
    
    @RequestMapping(value="/store_admin_login.htm", method = RequestMethod.GET)
    public ModelAndView store_admin_login() throws ServletException, IOException {     
    	 System.out.println("store_admin_login page request");
        return new ModelAndView("store_admin_login");
    }
    
    @RequestMapping(value="/login/{uname}/{pword}/authenticateLogin.htm", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody String authenticateLogin(HttpSession session,@PathVariable("uname") String uname,@PathVariable("pword") String pword)
            throws ServletException, IOException {
    	System.out.println("User name: " + uname);
        User user = new User();
        user.setName(uname);
        user.setPassword(pword);
        String authenticated = getUserService().authenticateUser(user);
        String storeId = getUserService().getStoreId(user.getName());
        System.out.println("authenticated:"+authenticated);
        session.setAttribute("storeid",storeId);
        return authenticated;
    }

    @RequestMapping(value="/logout.htm", method = RequestMethod.GET)
    public ModelAndView logout() throws ServletException, IOException {     
    	 System.out.println("logout page request");
        return new ModelAndView("logout");
    }
    
    @RequestMapping(value="/admin.htm", method = RequestMethod.GET)
    public ModelAndView adminView() throws ServletException, IOException {     
    	 System.out.println("admin view page request");
        return new ModelAndView("admin");
    }
    
    @RequestMapping(value="/store_admin_index.htm", method = RequestMethod.GET)
    public ModelAndView storeAdminView() throws ServletException, IOException {     
    	 System.out.println("store admin view page request");
        return new ModelAndView("store_admin_index");
    }
    
    @RequestMapping(value="/user/add_user.htm", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
    public  @ResponseBody List<String> onAddUserSubmit(@RequestBody User user)
            throws ServletException, IOException {

        System.out.println("User name: " + user.getName());
        getUserService().addUser(user);
        List<String> message = new ArrayList<String>();
        message.add("'"+user.getName() + "' are successfully added to the system");
        return message;
       
    }

    @RequestMapping(value="/user.htm", method = RequestMethod.GET)
    public ModelAndView onAddUserRequest()
            throws ServletException {

        return new ModelAndView("add_users");
    }
    
    @RequestMapping(value="/edit_user_submit.htm", method = RequestMethod.POST)
    public ModelAndView onEditUserSubmit(HttpSession session, HttpServletRequest request,
			HttpServletResponse response,@ModelAttribute("user")User user,BindingResult result)
            throws ServletException, IOException {

        logger.info("user name: " + user.getName());
        getUserService().editUser(user);
                
        Map<String, Object> myModel = new HashMap<String, Object>();
        myModel.put("users",getUserService().getUsers());

        return inventoryController.handleRequest(request, response, session,myModel);
    }
    
    @RequestMapping(value="/edit_user.htm", method = RequestMethod.GET)
    public ModelAndView onEditUserRequest()
            throws ServletException {

        return new ModelAndView("edit_users");
    }
    
    @RequestMapping(value="/delete_user_submit.htm", method = RequestMethod.POST)
    public ModelAndView onDeleteUserSubmit(HttpSession session, HttpServletRequest request,
			HttpServletResponse response,@ModelAttribute("user")User user,BindingResult result)
            throws ServletException, IOException {

        logger.info("user name: " + user.getName());
        getUserService().deleteUser(user);
                
        Map<String, Object> myModel = new HashMap<String, Object>();
        myModel.put("users",getUserService().getUsers());

        return inventoryController.handleRequest(request, response, session,myModel);
    }

    @RequestMapping(value="/user/{userId}/getStoreId.htm", method = RequestMethod.GET)
    public  @ResponseBody List<String> getStoreID(@PathVariable("userId") String userId)
            throws ServletException, IOException {
        String storeId = getUserService().getStoreId(userId);
        List<String> message = new ArrayList<String>();
        message.add(storeId);
        System.out.println("storeId:"+message);
        return message;
    }
    
    @ModelAttribute("user")
    public User getUserObject() {
     return new User();
    }

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}
}