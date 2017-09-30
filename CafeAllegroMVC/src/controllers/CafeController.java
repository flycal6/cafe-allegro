package controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import data.MenuItemDAO;

@Controller
public class CafeController {

//	@Autowired
//	private MenuItemDAO MenuDao;
	
	@RequestMapping(path="Cafe.do")
	public String showHomePage() {
		return "views/index.jsp";
	}
}
