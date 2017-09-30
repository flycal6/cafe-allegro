package controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import data.MenuItemDAO;
import data.UserDAO;
import entities.User;

@Controller
public class CafeController {

	@Autowired
	private MenuItemDAO menuItemDao;
	@Autowired
	private UserDAO userDao;
	
	@RequestMapping(path="Cafe.do", method=RequestMethod.GET)
	public String showHomePage(Model model) {
		model.addAttribute("items", menuItemDao.getAllItemsforIndexPage());
		return "views/index.jsp";
	}

	@RequestMapping(path="Login.do", method=RequestMethod.GET)
	public String showLoginPage(Model model) {
		return "views/login.jsp";
	}
	@RequestMapping(path="LoginUser.do", method=RequestMethod.POST)
	public String loginUser(User user, Model model) {
		model.addAttribute("user", userDao.customerLogin(user) );
		
		return "views/profile.jsp";
	}
	
	
	
}
