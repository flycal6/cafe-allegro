package controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cart.Cart;
import data.CartDAO;
import data.MenuItemDAO;
import entities.MenuItem;

@Controller
public class CafeController {

	@Autowired
	private MenuItemDAO menuItemDao;
	
	@Autowired
	private CartDAO cartDAO;

	@RequestMapping(path = "Cafe.do")
	public String showHomePage(Model model, HttpSession session) {
		model.addAttribute("items", menuItemDao.getAllItemsforIndexPage());
		if(session.getAttribute("user") == null) {
			session.removeAttribute("cart");
		}
		return "views/index.jsp";
	}

	@RequestMapping(path="SendItemToCart.do", method= RequestMethod.POST)
	public String sendItemToCart(MenuItem item, Model model, HttpSession session) {
		Cart sessionCart = (Cart) session.getAttribute("cart");
		if (sessionCart == null) {
			sessionCart = cartDAO.createNewCart();
		}
		session.setAttribute("cart", cartDAO.addMenuItemToCart(sessionCart, item));
		menuItemDao.sendToCart(item);
		
		return "redirect:Cafe.do";
	}
	

//	@RequestMapping(path = "AddedToCart.do", method = RequestMethod.GET) // Coming from the INDEX.JSP
//	public String addedItemById(MenuItem item, HttpSession session) { // index.jsp
//		return "views/cart.jsp";
//	}
}
