package controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import data.MenuDAO;

@Controller
public class CafeController {

	@Autowired
	private MenuDAO MenuDao;
	
	@RequestMapping(path="Cafe.do")
	public String showHomePage() {
		return "views/index.jsp";
	}
}
