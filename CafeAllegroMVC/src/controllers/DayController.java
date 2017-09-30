//package controllers;
//
//
//import java.util.ArrayList;
//import java.util.Collections;
//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RequestParam;
//
//import data.FilmDAO;
//import entity.Film;
//
//@Controller
//public class DayController {
//    @Autowired
//    private FilmDAO filmDAO;
//    
//    @RequestMapping(path = "Films.do", method = RequestMethod.GET)
//    public String index(Model model) {
//        model.addAttribute("films", filmDAO.index());
//        return "index.jsp";
//    }
//    
//    @RequestMapping(path = "GetFilm.do", method = RequestMethod.GET)
//    public String show(@RequestParam("id") int id, Model model) {
//        model.addAttribute("film", filmDAO.show(id));
//        return "film.jsp";
//    }
//    
//    @RequestMapping(path = "Search.do", method = RequestMethod.GET)
//    public String searc(@RequestParam("title") String title, Model model) {
//        model.addAttribute("films", filmDAO.search(title));
//        return "index.jsp";
//    }
//}
