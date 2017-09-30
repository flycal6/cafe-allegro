package controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import data.MenuItemDAO;

@Controller
public class CafeController {

	@Autowired
	private MenuItemDAO menuItemDao;
	
	@RequestMapping(path="Cafe.do", method=RequestMethod.GET)
	public String showHomePage(Model model) {
		model.addAttribute("items", menuItemDao.getAllItemsforIndexPage());
		return "views/index.jsp";
	}
}
