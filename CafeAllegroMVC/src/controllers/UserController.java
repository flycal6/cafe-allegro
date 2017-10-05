package controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import data.RewardsDAO;
import data.UserDAO;
import entities.User;

@Controller
public class UserController {

	@Autowired
	private UserDAO userDao;
	
	@Autowired
	private RewardsDAO rewardsDao;
	
	@RequestMapping(path = "Login.do", method = RequestMethod.GET)
	public String showLoginPage(User user, HttpSession session) {
		session.setAttribute("user", user);
		return "views/login.jsp";
	}

	@RequestMapping(path = "LoginUser.do", method = RequestMethod.POST)
	public String loginUser(User user, Model model, HttpSession session, RedirectAttributes redir) {
		User u = userDao.customerLogin(user);
		session.setAttribute("user", u);
		if(session.getAttribute("priceReduction") != null) {
			session.removeAttribute("priceReduction");
		}
		return "redirect:Cafe.do";
	}
	
	@RequestMapping(path="ViewProfile.do", method= RequestMethod.GET)
	public String viewProfile(HttpSession session) {
		User u = (User) session.getAttribute("user");
		if(session.getAttribute("userRewards") != null) {
			if(u != null) {
				session.removeAttribute("userRewards");
			}
		}
		session.setAttribute("userRewards", rewardsDao.showUpdatedRewardPoints(u));
		session.setAttribute("totalSpent", userDao.getTotalMoneySpent(u));
		return "views/profile.jsp";
	}
	
	@RequestMapping(path="UpdateUser.do", method = RequestMethod.POST)
	public String updateUser(User user, HttpSession session) {
		session.setAttribute("userRewards", rewardsDao.showUpdatedRewardPoints(user));
		session.setAttribute("totalSpent", userDao.getTotalMoneySpent(user));
		session.removeAttribute("user");
		session.setAttribute("user", userDao.updateUserProfile(user));
		
		return"redirect:ViewProfile.do";
	}
	
	@RequestMapping(path="SignUpPage.do", method=RequestMethod.GET)
	public String userSignUpPage() {
		return "views/signup.jsp";
	}
	
	@RequestMapping(path="CreateUser.do", method=RequestMethod.POST)
	public String signUpNewUser(User user, HttpSession session) {
		User u = userDao.createNewUser(user);
		session.setAttribute("user", u);
		session.setAttribute("userRewards", rewardsDao.showUpdatedRewardPoints(u));
		return "views/profile.jsp";
	}
	
	@RequestMapping(path="Logout.do")
	public String logoutUser(HttpSession session) {
		session.removeAttribute("cart");
		session.removeAttribute("user");
		session.removeAttribute("priceReduction");
		session.removeAttribute("totalSpent");
		session.removeAttribute("userRewards");
		return "Cafe.do";
	}
}
