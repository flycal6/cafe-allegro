package controllers;

import javax.servlet.http.HttpSession;

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
	public String showLoginPage(User user, Model model, HttpSession session) {
		session.setAttribute("user", user);
		return "views/login.jsp";
	}

	@RequestMapping(path = "LoginUser.do", method = RequestMethod.POST)
	public String loginUser(User user, Model model, HttpSession session) {
		User u = userDao.customerLogin(user);
		model.addAttribute("user", u);
		session.setAttribute("user", u);
		return "views/profile.jsp";
	}
	
	@RequestMapping(path="ViewProfile.do", method= RequestMethod.GET)
	public String viewProfile(HttpSession session) {
		return "views/profile.jsp";
	}
	
	@RequestMapping(path="UpdateUser.do", method = RequestMethod.POST)
	public String updateUser(User user, Model model) {
		model.addAttribute("user", userDao.updateUserProfile(user));
		
		return"views/profile.jsp";
	}
	
	@RequestMapping(path="SignUpPage.do", method=RequestMethod.GET)
	public String userSignUpPage() {
		return "views/signup.jsp";
	}
	
	@RequestMapping(path="CreateUser.do", method=RequestMethod.POST)
	public String signUpNewUser(User user, Model model) {
		model.addAttribute("newUser", userDao.createNewUser(user));
		
		return "views/profile.jsp";
	}
}
