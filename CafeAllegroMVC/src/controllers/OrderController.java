package controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import cart.Cart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import data.UserDAO;
import entities.MenuItem;
import entities.User;
import data.CartDAO;
import data.OrderDAO;

@Controller
public class OrderController {

	@Autowired
	private OrderDAO orderDAO;
	
	@Autowired
	private CartDAO cartDAO;
	
	@RequestMapping(path="finalizeOrder.do", method=RequestMethod.POST)
	public String finalizeOrder(RedirectAttributes redir, HttpSession session) {
		User user = (User) session.getAttribute("user");
		Cart finalCart = (Cart) session.getAttribute("cart");
		session.setAttribute("order", orderDAO.archiveCart(user, finalCart));//TAKE IN USER, RETURN ORDER
		
		return "redirect:finalizedOrder.do";
	}
	@RequestMapping(path="finalizedOrder.do", method=RequestMethod.GET)
	public String finalizedOrder(RedirectAttributes redir, HttpSession session) {
		Cart sessionCart = (Cart) session.getAttribute("cart");
		List<MenuItem> mi = sessionCart.getItemsInCart();
		double totalBeforeTax = cartDAO.addCartPrice(mi);
		double totalTax = cartDAO.calculateTax(mi);
		String totalAfterTax = cartDAO.addTotalCartPriceWithTax(mi);
		
		session.setAttribute("orderBeforeTax", totalBeforeTax);
		session.setAttribute("orderTax", totalTax);
		session.setAttribute("orderAfterTax", totalAfterTax);
		session.removeAttribute("cart");
		return "views/checkout.jsp";
	}
	
	
}
