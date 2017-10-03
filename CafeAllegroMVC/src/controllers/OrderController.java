package controllers;

import javax.xml.ws.RequestWrapper;

import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import cart.Cart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import data.UserDAO;
import entities.User;

import data.OrderDAO;

@Controller
public class OrderController {

	@Autowired
	private OrderDAO orderDAO;
	
	@RequestMapping(path="finalizeOrder.do", method=RequestMethod.POST)
	public String finalizeOrder(RedirectAttributes redir, HttpSession session) {
		User user = (User) session.getAttribute("user");
		Cart finalCart = (Cart) session.getAttribute("cart");
		session.setAttribute("order", orderDAO.archiveCart(user, finalCart));//TAKE IN USER, RETURN ORDER
		
		return "redirect:finalizedOrder.do";
	}
	@RequestMapping(path="finalizedOrder.do", method=RequestMethod.GET)
	public String finalizedOrder(RedirectAttributes redir, HttpSession session) {
		session.removeAttribute("cart");
		return "views/checkout.jsp";
	}
	
	
}
