package controllers;

import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import cart.Cart;
import data.CartDAO;
import data.RewardsDAO;
import entities.MenuItem;
import entities.User;

@Controller
public class CartController {

	@Autowired
	private CartDAO cartDAO;
	
	@Autowired
	private RewardsDAO rewardsDao;

	@RequestMapping(path = "showCart.do", method = RequestMethod.GET)
	public String showCart(HttpSession session, Model model) {
		User user = (User) session.getAttribute("user");
		session.getAttribute("cart");
		
		Cart sessionCart = (Cart) session.getAttribute("cart");
		List<MenuItem> mi = sessionCart.getItemsInCart();
		
		
		double totalBeforeTax = cartDAO.addCartPrice(mi);
		NumberFormat money = new DecimalFormat("#0.00"); 
		String stringTotalBeforeTax = money.format(totalBeforeTax); 
		
		double totalTax = cartDAO.calculateTax(mi);
		NumberFormat tax = new DecimalFormat("#0.00");
		String stringTotalTax = tax.format(totalTax);
		
		String totalAfterTax = cartDAO.addTotalCartPriceWithTax(mi);
		double reducedTotal = Double.parseDouble(totalAfterTax);
		double reduction = 0;

		session.setAttribute("userRewards", rewardsDao.showUpdatedRewardPoints(user));
		if(session.getAttribute("priceReduction") != null) {
			reduction = (double)session.getAttribute("priceReduction");
		}
		
		reducedTotal = reducedTotal - reduction;
		
		model.addAttribute("cartBeforeTax", stringTotalBeforeTax);
		model.addAttribute("cartTax", stringTotalTax);
		model.addAttribute("cartAfterTax", reducedTotal);

		return "views/cart.jsp";
	}

	@RequestMapping(path = "addToCart.do", method = RequestMethod.POST) // Coming from the INDEX.JSP
	public String addItemById(RedirectAttributes redir, MenuItem item, HttpSession session) { // index.jsp
		Cart sessionCart = (Cart) session.getAttribute("cart");
		if (sessionCart == null) {
			sessionCart = cartDAO.createNewCart();
		}
		redir.addFlashAttribute("cart", sessionCart);
		session.setAttribute("cart", cartDAO.addMenuItemToCart(sessionCart, item));
		return "redirect:AddedToCart.do";
	}

	@RequestMapping(path = "AddedToCart.do", method = RequestMethod.GET) // Coming from the INDEX.JSP
	public String addedItemById(MenuItem item, HttpSession session) { // index.jsp
		return "views/cart.jsp";
	}
	
	@RequestMapping(path="RedeemPoints.do")
	public String redeemPoints(HttpSession session) {
		Cart cart = (Cart) session.getAttribute("cart");
		User user = (User) session.getAttribute("user");
//		int up = user.getRewards().getPoints();
		double price = cartDAO.addCartPrice(cart.getItemsInCart());
		double rewardPointReduction = price;
		double priceReduction = rewardPointReduction/10.00;
		session.setAttribute("priceReduction", priceReduction);
		rewardsDao.decreaseRewardPoints(user, rewardPointReduction);
		return "redirect:showCart.do";
	}

}
