package controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import data.OrderDAO;

@Controller
public class CartController {

	@Autowired
	private OrderDAO orderDAO;
	
	@RequestMapping(path="cart.do", method=RequestMethod.POST)
	public ModelAndView addItemById (@RequestParam(value="itemId") int itemId) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("items", orderDAO.getMenuItemById(itemId));
		
		mv.setViewName("views/cart.jsp");
		return mv;
	}
}
