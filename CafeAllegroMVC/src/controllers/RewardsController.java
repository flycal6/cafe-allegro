package controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import data.RewardsDAO;
import entities.User;

@Controller
public class RewardsController {

	@Autowired
	private RewardsDAO rewardsDao;
	
	@RequestMapping(path="AddRewardPoints.do")
	public void addRewardPoints(int points, User user) {
		rewardsDao.increaseRewardPoints(user, points);
	}
	
	@RequestMapping(path="decreaseRewardPoints.do")
	public void decreaseRewardPoints(int points, User user) {
		rewardsDao.decreaseRewardPoints(user, points);
	}
}
