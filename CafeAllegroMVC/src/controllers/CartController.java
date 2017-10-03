package controllers;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import cart.Cart;
import data.CartDAO;
import data.OrderDAO;
import entities.MenuItem;

@Controller
public class CartController {

	@Autowired
	private CartDAO cartDAO;

	
	@RequestMapping(path="showCart", method=RequestMethod.GET)
	public String showCart(Cart cart, HttpSession session) {
		session.setAttribute("cart", cart);
		return "views/cart.jsp";
	}
	
	@RequestMapping(path="addToCart.do", method=RequestMethod.POST) //Coming from the INDEX.JSP
	public String addItemById(MenuItem item, HttpSession session){ //index.jsp
		Cart sessionCart = (Cart) session.getAttribute("cart");
		if (sessionCart == null) {
			sessionCart = cartDAO.createNewCart();
		}
		session.setAttribute("cart", cartDAO.addMenuItemToCart(sessionCart, item));
		return "views/cart.jsp";
	}
	
	
}

