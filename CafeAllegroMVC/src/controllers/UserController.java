package controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import data.UserDAO;
import entities.User;

@Controller
public class UserController {

	@Autowired
	private UserDAO userDao;

	@RequestMapping(path = "Login.do", method = RequestMethod.GET)
	public String showLoginPage(Model model) {
		return "views/login.jsp";
	}

	@RequestMapping(path = "LoginUser.do", method = RequestMethod.POST)
	public String loginUser(User user, Model model) {
		model.addAttribute("user", userDao.customerLogin(user));

		return "views/profile.jsp";
	}
	
	@RequestMapping(path="UpdateUser.do", method = RequestMethod.POST)
	public String updateUser(User user, Model model) {
		model.addAttribute("user", userDao.updateUserProfile(user));
		
		return"views/profile.jsp";
	}
}
