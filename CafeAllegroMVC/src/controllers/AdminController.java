package controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import data.AdminDAO;
import data.MenuItemDAO;
import entities.MenuItem;
import entities.User;

@Controller
public class AdminController {

	@Autowired
	private AdminDAO adminDao;
	
	@Autowired
	private MenuItemDAO menuDao;
	
	@RequestMapping(path="UpdateMenuItemsView.do", method=RequestMethod.GET)
	public String getUpdateItemView(User user, Model model) {
		model.addAttribute("items", menuDao.getAllItemsforIndexPage());
		return "views/adminItemUpdate.jsp";
	}
	
	@RequestMapping(path="UpdateMenuItem.do", method=RequestMethod.POST)
	public String updateItems(MenuItem item, Model model) {
		model.addAttribute("item", adminDao.adminUpdateMenuItem(item));
		model.addAttribute("items", menuDao.getAllItemsforIndexPage());
		return "views/adminItemUpdate.jsp";
	}
	
	@RequestMapping(path="GetNewItemView.do", method=RequestMethod.GET)
	public String getNewItemView() {
		return "views/newItem.jsp";
	}
	
	@RequestMapping(path="AddMenuItem.do", method=RequestMethod.POST)
	public String AddMenuItem(MenuItem item, Model model) {
		model.addAttribute("item", adminDao.addNewItem(item));
		model.addAttribute("items", menuDao.getAllItemsforIndexPage());
		return "views/adminItemUpdate.jsp";
	}
}
