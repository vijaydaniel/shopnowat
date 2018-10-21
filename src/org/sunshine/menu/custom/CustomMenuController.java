package org.sunshine.menu.custom;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.sunshine.domain.ShoppingBasketWrapper;

@Controller
public class CustomMenuController {
	
	@RequestMapping(value = "/store/custom-menu-editor.htm", method = RequestMethod.GET)
	public ModelAndView menuEditor(HttpServletRequest request) throws ServletException, Exception {
		ModelAndView mv=new ModelAndView("menu_editor");
		Map<String, Object> model=mv.getModel();
		
		List<String> menuList=new ArrayList<String>();
		File menuDir = new File(request.getRealPath("/menu/config/"));
		File[] listOfFiles = menuDir.listFiles();
		for(File file:listOfFiles) {
			menuList.add(file.getName());
		}
		/*File file = new File(request.getRealPath("/menu/config/"+stores.get(0)+".xml"));
		if(!file.exists()) {
			file = new File(request.getRealPath("/menu/config/default.xml"));
		}
		JAXBContext jaxbContext = JAXBContext.newInstance(ROOT.class);
		 
		Unmarshaller jaxbUnmarshaller = jaxbContext.createUnmarshaller();
		ROOT root = (ROOT) jaxbUnmarshaller.unmarshal(file);*/
		
		model.put("menuList", menuList);
		
		return mv;
	}
	
	@RequestMapping(value = "/store/{storeId}/custom-menu.htm", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody ROOT menu(@PathVariable("storeId") Integer storeId,HttpServletRequest request) {
		try {
			File file = new File(request.getRealPath("/menu/config/"+storeId+".xml"));
			if(!file.exists()) {
				file = new File(request.getRealPath("/menu/config/default.xml"));
			}
			JAXBContext jaxbContext = JAXBContext.newInstance(ROOT.class);
	 
			Unmarshaller jaxbUnmarshaller = jaxbContext.createUnmarshaller();
			ROOT root = (ROOT) jaxbUnmarshaller.unmarshal(file);
			System.out.println(root);
			return root;
		  } catch (JAXBException e) {
			e.printStackTrace();
		  }
		return null;
	}

	@RequestMapping(value = "/store/{storeId}/custom-menu-editor-action.htm", method = RequestMethod.POST)
	public void submit(@PathVariable("storeId") Integer storeId,HttpServletRequest request) {
		Map<String, String> map=request.getParameterMap();
		System.out.println(map);
		Menu menu;
		for(Entry<String, String> entry:map.entrySet()) {
			String[] array=entry.getKey().split("-");
			for(String id:array) {
			}
		}
	}
	
}
