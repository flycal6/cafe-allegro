package controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import data.AdminDAO;

@Controller
public class AdminController {

	@Autowired
	private AdminDAO adminDao;
	
	@RequestMapping(path="UpdateMenuItemsView.do", method=RequestMethod.GET)
	public String getUpdateItemView() {
		return "views/adminItemUpdate.jsp";
	}
	
	@RequestMapping(path="UpdateMenuItems.do", method=RequestMethod.POST)
	public String updateItems() {
		return "views/adminItemUpdate.jsp";
	}
	
	
}
