package controllers;

import java.text.DecimalFormat;
import java.text.NumberFormat;
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
import data.RewardsDAO;

@Controller
public class OrderController {

	@Autowired
	private OrderDAO orderDAO;
	
	@Autowired
	private CartDAO cartDAO;
	
	@Autowired
	private RewardsDAO rewardsDao;
	
	@RequestMapping(path="finalizeOrder.do", method=RequestMethod.POST)
	public String finalizeOrder(RedirectAttributes redir, HttpSession session) {
		User user = (User) session.getAttribute("user");
		Cart finalCart = (Cart) session.getAttribute("cart");
		if (finalCart == null) {
			return "Cafe.do";
		}
		Double tot = (Double)session.getAttribute("orderAfterTax");
		int rewardsToAdd = tot.intValue();
		rewardsDao.increaseRewardPoints(user, rewardsToAdd);
		
		session.setAttribute("order", orderDAO.archiveCart(user, finalCart));//TAKE IN USER, RETURN ORDER
		
		return "redirect:finalizedOrder.do";
	}
	@RequestMapping(path="finalizedOrder.do", method=RequestMethod.GET)
	public String finalizedOrder(RedirectAttributes redir, HttpSession session) {
		Cart sessionCart = (Cart) session.getAttribute("cart");
		if (sessionCart == null) {
			return "Cafe.do";
		}
		List<MenuItem> mi = sessionCart.getItemsInCart();
		
		
		double totalBeforeTax = cartDAO.addCartPrice(mi);
		NumberFormat money = new DecimalFormat("#0.00"); 
		String stringTotalBeforeTax = money.format(totalBeforeTax); 
		
		double totalTax = cartDAO.calculateTax(mi);
		NumberFormat tax = new DecimalFormat("#0.00");
		String stringTotalTax = tax.format(totalTax);
		
//		String totalAfterTax = cartDAO.addTotalCartPriceWithTax(mi);
		
		session.setAttribute("orderBeforeTax", stringTotalBeforeTax);
		session.setAttribute("orderTax", stringTotalTax);
//		session.setAttribute("orderAfterTax", totalAfterTax);
		
		session.removeAttribute("cart");
		return "views/checkout.jsp";
	}
	
//	@RequestMapping(path="confirmation.do", method=RequestMethod.POST)
//	public String goToConfirmationPage(RedirectAttributes redir, HttpSession session) {
//		session.getAttribute("order");
//		return "redirect:confirmedOrder.do";
//	}
//	
//	@RequestMapping(path="confirmedOrder.do", method=RequestMethod.GET)
//	public String confirmedOrderPage(HttpSession session) {
//		String orderConfirm = "Thank You.";
//		session.setAttribute("thanks", orderConfirm);
//		return "views/checkout.jsp";
//	}
	
}
