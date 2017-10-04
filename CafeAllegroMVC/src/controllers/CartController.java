package controllers;

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
import entities.MenuItem;
import entities.User;

@Controller
public class CartController {

	@Autowired
	private CartDAO cartDAO;

	@RequestMapping(path = "showCart.do", method = RequestMethod.GET)
	public String showCart(HttpSession session, Model model) {
//		User user = (User) session.getAttribute("user");
		session.getAttribute("cart");
		
		Cart sessionCart = (Cart) session.getAttribute("cart");
		List<MenuItem> mi = sessionCart.getItemsInCart();
		double totalBeforeTax = cartDAO.addCartPrice(mi);
		double totalTax = cartDAO.calculateTax(mi);
		String totalAfterTax = cartDAO.addTotalCartPriceWithTax(mi);

		model.addAttribute("cartBeforeTax", totalBeforeTax);
		model.addAttribute("cartTax", totalTax);
		model.addAttribute("cartAfterTax", totalAfterTax);

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
	
	

}
