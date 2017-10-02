package controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import data.AdminDAO;
import entities.MenuItem;
import entities.User;

@Controller
public class AdminController {

	@Autowired
	private AdminDAO adminDao;
	
	@RequestMapping(path="UpdateMenuItemsView.do", method=RequestMethod.GET)
	public String getUpdateItemView(User user, Model model) {
		return "views/adminItemUpdate.jsp";
	}
	
	@RequestMapping(path="UpdateMenuItems.do", method=RequestMethod.POST)
	public String updateItems(MenuItem item, Model model) {
		model.addAttribute("item", adminDao.adminUpdateMenuItem(item));
		return "views/adminItemUpdate.jsp";
	}
	
	
}
