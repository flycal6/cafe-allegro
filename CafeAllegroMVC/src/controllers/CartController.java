package controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import data.OrderDAO;
import entities.MenuItem;

@Controller
public class CartController {

	@Autowired
	private OrderDAO orderDAO;

	@RequestMapping(path="cart.do", method=RequestMethod.POST)
	public ModelAndView cartSummary(MenuItem menuItem) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("items", orderDAO.addingItemtoCart(menuItem));
		mv.setViewName("views/cart.jsp");
		return mv;
	}
	
	@RequestMapping(path="cart.do", method=RequestMethod.POST)
	public ModelAndView addItemById(int id) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("items", orderDAO.getMenuItemById(id));
		mv.setViewName("views/cart.jsp");
		return mv;
	}
}
